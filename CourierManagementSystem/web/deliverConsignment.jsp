<%-- 
    Document   : deliverConsignment
    Created on : Nov 25, 2021, 5:57:31 PM
    Author     : soura
--%>
<%
    if(session.getAttribute("branchUsername")==null){
        response.sendRedirect("branchLogin.jsp");
    }  
%>
<%!
    String sql;
%>
<%@page import="java.sql.*, java.util.regex.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="assets/jsp/dbConnection.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  
  <title>Deliver Consignment</title>

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
      <h1>Deliver Consignment</h1>
    </div><!-- End Page Title -->

      <div class="row">
        <div class="col-12">


          <div class="card">
            <div class="card-body" >
                <%
                    if(request.getParameter("deliver")!=null && request.getMethod().equals("POST")){
                        sql = "SELECT * FROM consignment_details WHERE consignment_id=?";
                        PreparedStatement st=conn.prepareStatement(sql);
                        st.setString(1,request.getParameter("deliver"));
                        ResultSet rs=st.executeQuery();
                        rs.next();
                %>

                    <h5 class="card-title">Package Details</h5>

                    <div class="row" style="display: flex;justify-content: center;">
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
                    </div>
                    <form method="POST" action="deliverConsignment.jsp">
                        <div style="margin-top: 20px;display: flex;justify-content: center;">
                            <div class="col-12 col-sm-8 col-md-6 col-lg-4 col-xxl-3">
                                <label for="employee" class="form-label">Assign Employee: <span style="color: red;">*</span></label>
                                <select id="employee" name="employee" class="form-select" required>
                                  <option value="">Choose...</option>
                                  <%
                                        sql = "SELECT employee_id,name FROM employee_details WHERE branch_id=?";
                                        st=conn.prepareStatement(sql);
                                        st.setString(1,String.valueOf(session.getAttribute("branchUsername")));
                                        ResultSet rs2=st.executeQuery();
                                        while(rs2.next()){
                                  %>
                                  <option value="<%= rs2.getString("employee_id") %>"><%= rs2.getString("name") %></option>
                                  <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="text-center" style="margin-top: 20px;">
                            <button type="submit" class="btn btn-success col-6 col-md-4 col-lg-3 col-xxl-2" id="deliverConsignment" name="deliverConsignment" value="<%= rs.getString("consignment_id") %>">Deliver Consignment</button>
                        </div>
                    </form>
      
                <%
                    }
                    else{
                        if(request.getParameter("deliverConsignment")!=null && request.getMethod().equals("POST")){

                            sql = "INSERT INTO consignment_delivery(consignment_id,employee_id) VALUES (?,?)";
                            PreparedStatement st=conn.prepareStatement(sql);
                            st.setString(1,request.getParameter("deliverConsignment")); 
                            st.setString(2,request.getParameter("employee"));
                            st.executeUpdate();

                            sql = "SELECT name,phone FROM employee_details WHERE employee_id=?";
                            st=conn.prepareStatement(sql);
                            st.setString(1,request.getParameter("employee"));
                            ResultSet rs=st.executeQuery();
                            rs.next();

//                            sql = "DELETE FROM consignment_inventory WHERE consignment_id=?";
//                            st=conn.prepareStatement(sql);
//                            st.setString(1,request.getParameter("deliverConsignment"));
//                            st.executeUpdate();
                            
                            java.util.Date date = new java.util.Date();
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

                            String nowTime = timeFormat.format(date);

                            sql = "INSERT INTO consignment_tracker(consignment_id,date,time,status,remarks) VALUES (?,?,?,?,?)";
                            st=conn.prepareStatement(sql);
                            st.setString(1,request.getParameter("deliverConsignment"));
                            st.setString(2,dateFormat.format(date));
                            st.setString(3,nowTime);
                            st.setString(4,"Out For Delivery");
                            st.setString(5,rs.getString("name")+" ("+rs.getString("phone")+")");
                            st.executeUpdate();

                %>
                <div class="alert alert-success alert-dismissible fade show col-md-8 col-xl-6 text-center mx-auto" style="margin-top: 20px;" role="alert">
                    <i class="bi bi-check-circle me-1"></i>
                    Consignment ID: <%= request.getParameter("deliverConsignment") %> has been assigned to <%= rs.getString("name") %> for Delivery
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
                          <th scope="col">Deliver To</th>
                          <th scope="col">Deliver</th>
                        </tr>
                      </thead>
                      <tbody>
                          <%
                            sql = "SELECT district FROM branch_details WHERE branch_id=?";
                            PreparedStatement st=conn.prepareStatement(sql);
                            st.setString(1,String.valueOf(session.getAttribute("branchUsername")));
                            ResultSet rs=st.executeQuery();
                            rs.next();
                            String branchDistrict = rs.getString("district");
                            
                            sql = "SELECT consignment_id,to_name,to_address1,to_address2,to_pincode FROM consignment_details WHERE to_district=? AND consignment_id IN (SELECT consignment_id FROM consignment_inventory WHERE branch_id=?)";
                            st=conn.prepareStatement(sql);
                            st.setString(1,branchDistrict);
                            st.setString(2,String.valueOf(session.getAttribute("branchUsername")));
                            rs=st.executeQuery();
                            int i = 1;                            
                            while(rs.next()){    
                         %>
                        <tr class="align-middle">
                          <th scope="row"><%= i %></th>
                          <td><%= rs.getString("consignment_id") %></td>
                          <td>
                              <%
                                  out.print(rs.getString("to_name")+", "+rs.getString("to_address1")+", ");
                                  if(rs.getString("to_address2").isEmpty()==false){
                                      out.print(rs.getString("to_address2")+", ");
                                  }
                                  out.print(rs.getString("to_pincode"));                                  
                              %>
                          </td>
                          <td>
                              <form method="POST" action="deliverConsignment.jsp">
                                  <button type="submit" class="btn btn-success btn-sm" name="deliver" value="<%= rs.getString("consignment_id") %>">Deliver</button>
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
    
  </main><!-- End #main -->
  
    <%
      conn.close();
    %>

  <%@include file="assets/jsp/footer.jsp"%>

</body>

</html>
