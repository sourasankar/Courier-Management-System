<%-- 
    Document   : transitConsignment
    Created on : Nov 25, 2021, 10:45:38 AM
    Author     : soura
--%>
<%
    if(session.getAttribute("branchUsername")==null){
        response.sendRedirect("branchLogin.jsp");
    }
    else{
%>
<%!
    String sql;
    String toBranchId,toBranchName,toBranchAddress,toBranchState,toBranchDistrict,toBranchPincode;                            
%>
<%@page import="java.sql.*, java.util.regex.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="assets/jsp/dbConnection.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  
  <title>Transit Consignment</title>

  <%@include file="assets/jsp/head.jsp"%>
  
</head>

<body>

  <!-- ======= Header ======= -->
  <%@include file="assets/jsp/nav.jsp"%>
  <!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <%@include file="assets/jsp/sidebar.jsp"%>
  <!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Transit Consignment</h1>
    </div>

      <div class="row">
        <div class="col-12">


          <div class="card">
            <div class="card-body" >
                <%
                    if(request.getParameter("transit")!=null && request.getMethod().equals("POST")){
                        sql = "SELECT * FROM consignment_details WHERE consignment_id=?";
                        PreparedStatement st=conn.prepareStatement(sql);
                        st.setString(1,request.getParameter("transit"));
                        ResultSet rs=st.executeQuery();
                        rs.next();
                        
                        sql = "SELECT name,address,state,district,pincode FROM branch_details WHERE branch_id=?";
                        PreparedStatement st2=conn.prepareStatement(sql);
                        st2.setString(1,request.getParameter("toBranch"));
                        ResultSet rs2=st2.executeQuery();
                        rs2.next();
                %>

                    <h5 class="card-title">Package Details</h5>

                    <div class="row" style="display: flex;justify-content: space-evenly;">
                        <fieldset style="all: revert; font-weight: 600;" class="col-6">
                            <legend style="all: revert;">Consignment Details:</legend>
                            Consignment ID: <%= rs.getString("consignment_id") %> <br>
                            Dimension: <%= rs.getString("length") %>x<%= rs.getString("width") %>x<%= rs.getString("height") %>cm<br>
                            Weight: <%= rs.getString("weight") %>gm<br>
                            Amount: <%= rs.getString("amount") %>/-<br><br>
                            <u>Deliver To:</u><br>
                            <%= rs.getString("to_name") %><br>
                            <%= rs.getString("to_address1") %>,<br><% if(rs.getString("to_address2").isEmpty()==false){ out.print(rs.getString("to_address2"));%>,<br><%} %>
                            <%= rs.getString("to_district") %>, <%= rs.getString("to_state") %>, <%= rs.getString("to_pincode") %>                       
                        </fieldset>
                        <fieldset style="all: revert; font-weight: 600;" class="col-6">
                            <legend style="all: revert;">Next Transit Location:</legend>                            
                            <br><br><u>Transit To:</u><br>
                            <%= rs2.getString("name") %><br>
                            <%= rs2.getString("address") %>,<br>
                            <%= rs2.getString("district") %>, <%= rs2.getString("state") %>, <%= rs2.getString("pincode") %>                       
                        </fieldset>
                    </div>
                    <div class="text-center" style="margin-top: 20px;">
                        <form method="POST" action="transitConsignment.jsp">
                            <input type="hidden" name="transitBranchId" value="<%= request.getParameter("toBranch") %>">
                            <button type="submit" class="btn btn-warning col-6 col-md-4 col-lg-3 col-xxl-2" id="transitConsignment" name="transitConsignment" value="<%= rs.getString("consignment_id") %>">Transit Consignment</button>
                        </form>
                    </div>

                  
                <%
                    }
                    else{
                        if(request.getParameter("transitConsignment")!=null && request.getMethod().equals("POST")){

                            sql = "DELETE FROM consignment_inventory WHERE consignment_id=?";
                            PreparedStatement st=conn.prepareStatement(sql);
                            st.setString(1,request.getParameter("transitConsignment"));
                            st.executeUpdate();

                            sql = "SELECT name FROM branch_details WHERE branch_id=?";
                            st=conn.prepareStatement(sql);
                            st.setString(1,request.getParameter("transitBranchId"));
                            ResultSet rs=st.executeQuery();
                            rs.next();
                            
                            java.util.Date date = new java.util.Date();
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

                            String nowTime = timeFormat.format(date);

                            sql = "INSERT INTO consignment_tracker(consignment_id,date,time,status,remarks,to_location) VALUES (?,?,?,?,?,?)";
                            st=conn.prepareStatement(sql);
                            st.setString(1,request.getParameter("transitConsignment"));
                            st.setString(2,dateFormat.format(date));
                            st.setString(3,nowTime);
                            st.setString(4,"In Transit");
                            st.setString(5,"to "+rs.getString("name"));
                            st.setString(6,request.getParameter("transitBranchId"));
                            st.executeUpdate();
                %>
                <div class="alert alert-success alert-dismissible fade show col-md-8 col-xl-6 text-center mx-auto" style="margin-top: 20px;" role="alert">
                    <i class="bi bi-check-circle me-1"></i>
                    Consignment has been shipped successfully
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                  }  
                %>
                
                <h5 class="card-title">Inventory</h5>
                <div class="col-md-10 offset-md-1 col-xxl-8 offset-xxl-2">
                    <table class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Consignment ID</th>
                          <th scope="col">Next Transit Location</th>
                          <th scope="col">Transit</th>
                        </tr>
                      </thead>
                      <tbody>
                          <% 
                                sql = "SELECT district,state,type FROM branch_details WHERE branch_id=?";
                                PreparedStatement st=conn.prepareStatement(sql);
                                st.setString(1,String.valueOf(session.getAttribute("branchUsername")));
                                ResultSet rs=st.executeQuery();
                                rs.next();
                                String branchDistrict = rs.getString("district");
                                String branchState = rs.getString("state");
                                String branchType = rs.getString("type");   

                                sql = "SELECT consignment_id,to_district,to_state FROM consignment_details WHERE to_district!=? AND consignment_id IN (SELECT consignment_id FROM consignment_inventory WHERE branch_id=?)";
                                st=conn.prepareStatement(sql);
                                st.setString(1,branchDistrict);
                                st.setString(2,String.valueOf(session.getAttribute("branchUsername")));
                                rs=st.executeQuery();
                                int i = 1;                            
                                while(rs.next()){
                                    if(rs.getString("to_state").equalsIgnoreCase(branchState)){
                                        if(branchType.equalsIgnoreCase("dho")){
                                            String sql2 = "SELECT branch_id,name,address,state,district,pincode FROM branch_details WHERE state=? AND type=?";
                                            PreparedStatement st2=conn.prepareStatement(sql2);
                                            st2.setString(1,branchState);
                                            st2.setString(2,"sho");
                                            ResultSet rs2=st2.executeQuery();
                                            rs2.next();
                                            toBranchId=rs2.getString("branch_id");
                                            toBranchName=rs2.getString("name");
                                            toBranchAddress=rs2.getString("address");
                                            toBranchState=rs2.getString("state");
                                            toBranchDistrict=rs2.getString("district");
                                            toBranchPincode=rs2.getString("pincode");
                                        }
                                        else{
                                            
                                            String sql2 = "SELECT branch_id,name,address,state,district,pincode FROM branch_details WHERE district=? AND state=? AND type=?";
                                            PreparedStatement st2=conn.prepareStatement(sql2);
                                            st2.setString(1,rs.getString("to_district"));
                                            st2.setString(2,branchState);
                                            st2.setString(3,"dho");
                                            ResultSet rs2=st2.executeQuery();
                                            rs2.next();
                                            toBranchId=rs2.getString("branch_id");
                                            toBranchName=rs2.getString("name");
                                            toBranchAddress=rs2.getString("address");
                                            toBranchState=rs2.getString("state");
                                            toBranchDistrict=rs2.getString("district");
                                            toBranchPincode=rs2.getString("pincode");
                                        }
                                    }
                                    else{
                                        if(branchType.equalsIgnoreCase("dho")){                                       
                                            String sql2 = "SELECT branch_id,name,address,state,district,pincode FROM branch_details WHERE state=? AND type=?";
                                            PreparedStatement st2=conn.prepareStatement(sql2);
                                            st2.setString(1,branchState);
                                            st2.setString(2,"sho");
                                            ResultSet rs2=st2.executeQuery();
                                            rs2.next();
                                            toBranchId=rs2.getString("branch_id");
                                            toBranchName=rs2.getString("name");
                                            toBranchAddress=rs2.getString("address");
                                            toBranchState=rs2.getString("state");
                                            toBranchDistrict=rs2.getString("district");
                                            toBranchPincode=rs2.getString("pincode");
                                        }
                                        else{
                                            String sql2 = "SELECT branch_id,name,address,state,district,pincode FROM branch_details WHERE state=? AND type=?";
                                            PreparedStatement st2=conn.prepareStatement(sql2);
                                            st2.setString(1,rs.getString("to_state"));
                                            st2.setString(2,"sho");
                                            ResultSet rs2=st2.executeQuery();
                                            rs2.next();
                                            toBranchId=rs2.getString("branch_id");
                                            toBranchName=rs2.getString("name");
                                            toBranchAddress=rs2.getString("address");
                                            toBranchState=rs2.getString("state");
                                            toBranchDistrict=rs2.getString("district");
                                            toBranchPincode=rs2.getString("pincode");
                                        }
                                    }
                          %>
                        <tr class="align-middle">
                          <th scope="row"><%= i %></th>
                          <td><%= rs.getString("consignment_id") %></td>
                          <td><%= toBranchName+", "+toBranchAddress+", "+toBranchDistrict+", "+toBranchState+", "+toBranchPincode %></td>
                          <td>
                              <form method="POST" action="transitConsignment.jsp">
                                  <input type="hidden" name="toBranch" value="<%= toBranchId %>">
                                  <button type="submit" class="btn btn-warning btn-sm" name="transit" value="<%= rs.getString("consignment_id") %>">Transit</button>
                              </form>
                          </td>
                        </tr>
                          <%
                              i++;
                              }
                          %>
                      </tbody>
                    </table>
                </div>
                
                <%
                    }        
                %>

            </div>
              
              
          </div>

        </div>        
    
  </main>
  
    <%
      conn.close();
    %>
  
  <%@include file="assets/jsp/footer.jsp"%>

</body>

</html>
<% } %>
