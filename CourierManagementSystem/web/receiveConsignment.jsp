<%-- 
    Document   : receiveConsignment
    Created on : Nov 24, 2021, 8:07:57 PM
    Author     : soura
--%>
<%
    if(session.getAttribute("branchUsername")==null){
        response.sendRedirect("branchLogin.jsp");
    }else{  
%>
<%@page import="java.sql.*, java.util.regex.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="assets/jsp/dbConnection.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  
  <title>Receive Consignment</title>

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
      <h1>Receive Consignment</h1>
    </div><!-- End Page Title -->

      <div class="row">
        <div class="col-12">


          <div class="card">
            <div class="card-body" style="margin-top: 20px;">

              <!-- Multi Columns Form -->
              <form method="POST" action="receiveConsignment.jsp">
                  
                <div class="row g-3">
                    <label for="consignmentId" class="col-md-3 col-lg-2 col-form-label">Consignment Id: <span style="color: red;">*</span></label>
                    <div class="col-md-6 col-lg-4 col-xxl-3">
                        <input type="text" class="form-control" id="consignmentId" name="consignmentId" required>
                    </div>
                    <button type="submit" id="submit" name="submit" value="submit" class="btn btn-primary col-6 offset-3 col-sm-4 offset-sm-4 col-md-2 offset-md-0 col-xl-1">Submit</button>
                </div>
                  
              </form><!-- End Multi Columns Form -->

            </div>
          </div>
            
            <%
            if(request.getParameter("submit")!=null && request.getMethod().equals("POST")){
                String sql = "SELECT * FROM consignment_tracker WHERE consignment_id=? ORDER BY date DESC,time DESC LIMIT 1";
                PreparedStatement st=conn.prepareStatement(sql);
                st.setString(1,request.getParameter("consignmentId"));
                ResultSet rs=st.executeQuery();
                if(!rs.next()){
                    out.print("<script>alert('Wrong Consignment ID')</script>");
                }
                else if(rs.getString("to_location")!=null && rs.getString("to_location").equalsIgnoreCase(String.valueOf(session.getAttribute("branchUsername")))){
                    String sql2 = "SELECT * FROM consignment_details WHERE consignment_id=?";
                    PreparedStatement st2=conn.prepareStatement(sql2);
                    st2.setString(1,request.getParameter("consignmentId"));
                    ResultSet rs2=st2.executeQuery();
                    rs2.next();
            %>
            
            <div class="card">
                <div class="card-body">
                    
                    <h5 class="card-title">Package Details</h5>

                    <div style="display: flex;justify-content: center;">
                        <fieldset style="all: revert; font-weight: 600;" class="col-6">
                            <legend style="all: revert;">Consignment Details:</legend>
                            Consignment ID: <%= rs2.getString("consignment_id") %> <br>
                            Dimension: <%= rs2.getString("length") %>x<%= rs2.getString("width") %>x<%= rs2.getString("height") %>cm<br>
                            Weight: <%= rs2.getString("weight") %>gm<br>
                            Amount: <%= rs2.getString("amount") %>/-<br>
                            <u>Deliver To:</u><br>
                            <%= rs2.getString("to_name") %><br>
                            <%= rs2.getString("to_address1") %>,<br><% if(rs2.getString("to_address2").isEmpty()==false){ out.print(rs2.getString("to_address2"));%>,<br><%} %>
                            <%= rs2.getString("to_district") %>, <%= rs2.getString("to_state") %>, <%= rs2.getString("to_pincode") %>                       
                        </fieldset>   
                    </div>
                    <div class="text-center" style="margin-top: 20px;">
                        <form method="POST" action="receiveConsignment.jsp">
                            <button type="submit" class="btn btn-primary col-6 col-md-4 col-lg-3 col-xxl-2" id="receiveConsignment" name="receiveConsignment" value="<%= rs2.getString("consignment_id") %>">Receive Consignment</button>
                        </form>
                    </div>
                 
                </div>
            </div>
            
            <%
                }
                else{
                    out.print("<script>alert('Wrong Consignment ID')</script>");
                }
            }
            if(request.getParameter("receiveConsignment")!=null && request.getMethod().equals("POST")){
                            String sql = "INSERT INTO consignment_inventory(consignment_id,branch_id) VALUES (?,?)";
                            PreparedStatement st=conn.prepareStatement(sql);
                            st.setString(1,request.getParameter("receiveConsignment")); 
                            st.setString(2,String.valueOf(session.getAttribute("branchUsername")));
                            st.executeUpdate();

                            sql = "SELECT name FROM branch_details WHERE branch_id=?";
                            st=conn.prepareStatement(sql);
                            st.setString(1,String.valueOf(session.getAttribute("branchUsername")));
                            ResultSet rs=st.executeQuery();
                            rs.next();

                            java.util.Date date = new java.util.Date();
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

                            String nowTime = timeFormat.format(date);

                            sql = "INSERT INTO consignment_tracker(consignment_id,date,time,status,remarks) VALUES (?,?,?,?,?)";
                            st=conn.prepareStatement(sql);
                            st.setString(1,request.getParameter("receiveConsignment"));
                            st.setString(2,dateFormat.format(date));
                            st.setString(3,nowTime);
                            st.setString(4,"Received");
                            st.setString(5,"at "+rs.getString("name"));
                            st.executeUpdate();
            %>
            <div class="alert alert-success alert-dismissible fade show col-md-8 col-xl-6 text-center mx-auto" style="margin-top: 20px;" role="alert">
                <i class="bi bi-check-circle me-1"></i>
                Consignment has been Received and Added to Inventory
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
            }
            %>
            
          

        </div>        
    
  </main><!-- End #main -->

  <%@include file="assets/jsp/footer.jsp"%>

</body>

</html>
<% } %>
