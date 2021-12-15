<%-- 
    Document   : employeeDashboard
    Created on : Nov 25, 2021, 7:53:59 PM
    Author     : soura
--%>

<%
    if(session.getAttribute("employeeUsername")==null){
        response.sendRedirect("employeeLogin.jsp");
    }
    else{
%>
<%@page import="java.sql.*, java.util.regex.*"%>
<%@include file="assets/jsp/dbConnection.jsp"%>
<%
    String sql = "SELECT COUNT(*) as delivery_count FROM consignment_delivery WHERE employee_id=?";
    PreparedStatement st=conn.prepareStatement(sql);
    st.setString(1,String.valueOf(session.getAttribute("employeeUsername")));
    ResultSet rs=st.executeQuery();
    rs.next();
    String countDelivery = rs.getString("delivery_count");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    
  <title>Dashboard</title>
  
  <%@include file="assets/jsp/head.jsp"%>

  
</head>

<body>

  <!-- ======= Header ======= -->
  <%@include file="assets/jsp/employeeNav.jsp"%>
  <!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <%@include file="assets/jsp/employeeSidebar.jsp"%>
  <!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
    </div>
    <section class="section dashboard">
        <div class="row">

            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card info-card">

                    <div class="card-body">
                      <h5 class="card-title">Deliveries Left</h5>

                      <div class="d-flex align-items-center">
                          <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="color: rgb(46, 202, 106);background: rgb(224, 248, 233);">
                          <i class="bi bi-boxes"></i>
                        </div>
                        <div class="ps-3">
                          <h6><%= countDelivery %></h6>
                        </div>
                      </div>

                    </div>
                  </div>
            </div>

        </div>
    </section>

  </main>


  <%@include file="assets/jsp/footer.jsp"%>

</body>

</html>
<% } %>