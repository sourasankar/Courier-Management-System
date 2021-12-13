<%-- 
    Document   : dashboard
    Created on : Nov 22, 2021, 7:29:13 PM
    Author     : soura
--%>
<%
    if(session.getAttribute("branchUsername")==null){
        response.sendRedirect("branchLogin.jsp");
    }  
%>
<%@page import="java.sql.*, java.util.regex.*"%>
<%@include file="assets/jsp/dbConnection.jsp"%>
<%
    String sql = "SELECT COUNT(*) as employee_count FROM employee_details WHERE branch_id=?";
    PreparedStatement st=conn.prepareStatement(sql);
    st.setString(1,String.valueOf(session.getAttribute("branchUsername")));
    ResultSet rs=st.executeQuery();
    rs.next();
    String countEmployee = rs.getString("employee_count");
    
    sql = "SELECT COUNT(*) as inventory_count FROM consignment_inventory WHERE branch_id=?";
    st=conn.prepareStatement(sql);
    st.setString(1,String.valueOf(session.getAttribute("branchUsername")));
    rs=st.executeQuery();
    rs.next();
    String countInventory = rs.getString("inventory_count");
    
    sql = "SELECT district,state,type FROM branch_details WHERE branch_id=?";
    st=conn.prepareStatement(sql);
    st.setString(1,String.valueOf(session.getAttribute("branchUsername")));
    rs=st.executeQuery();
    rs.next();
    String branchDistrict = rs.getString("district");  

    sql = "SELECT COUNT(*) as shipment_count FROM consignment_details WHERE to_district!=? AND consignment_id IN (SELECT consignment_id FROM consignment_inventory WHERE branch_id=?)";
    st=conn.prepareStatement(sql);
    st.setString(1,branchDistrict);
    st.setString(2,String.valueOf(session.getAttribute("branchUsername")));
    rs=st.executeQuery();
    rs.next();
    String countShipment = rs.getString("shipment_count");
    
    sql = "SELECT COUNT(*) as deliver_count FROM consignment_details WHERE to_district=? AND consignment_id IN (SELECT consignment_id FROM consignment_inventory WHERE branch_id=?)";
    st=conn.prepareStatement(sql);
    st.setString(1,branchDistrict);
    st.setString(2,String.valueOf(session.getAttribute("branchUsername")));
    rs=st.executeQuery();
    rs.next();
    String countDeliver = rs.getString("deliver_count");
    
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
  <%@include file="assets/jsp/nav.jsp"%>
  <!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <%@include file="assets/jsp/sidebar.jsp"%>
  <!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
    </div><!-- End Page Title -->
    <section class="section dashboard">
        <div class="row">

            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card info-card">

                    <div class="card-body">
                      <h5 class="card-title">Employees</h5>

                      <div class="d-flex align-items-center">
                          <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="color: #4154f1;background: #f6f6fe;">
                          <i class="bi bi-people"></i>
                        </div>
                        <div class="ps-3">
                            <h6><%= countEmployee %></h6>
                        </div>
                      </div>
                    </div>

                  </div>
            </div>
            
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card info-card">

                    <div class="card-body">
                      <h5 class="card-title">Inventory</h5>

                      <div class="d-flex align-items-center">
                          <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="color: #e91e63;background: #ffe5ee;">
                          <i class="bi bi-boxes"></i>
                        </div>
                        <div class="ps-3">
                            <h6><%= countInventory %></h6>
                        </div>
                      </div>
                    </div>

                  </div>
            </div>

            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card info-card">

                    <div class="card-body">
                      <h5 class="card-title">Shipments Left</h5>

                      <div class="d-flex align-items-center">
                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="color: #ff771d;background: #ffecdf;">
                          <i class="bi bi-truck"></i>
                        </div>
                        <div class="ps-3">
                            <h6><%= countShipment %></h6>
                        </div>
                      </div>
                    </div>

                  </div>
            </div>

            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card info-card">

                    <div class="card-body">
                      <h5 class="card-title">Deliveries Left</h5>

                      <div class="d-flex align-items-center">
                          <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="color: rgb(46, 202, 106);background: rgb(224, 248, 233);">
                          <i class="bi bi-boxes"></i>
                        </div>
                        <div class="ps-3">
                            <h6><%= countDeliver %></h6>
                        </div>
                      </div>

                    </div>
                  </div>
            </div>

        </div>
    </section>

  </main><!-- End #main -->


  <%@include file="assets/jsp/footer.jsp"%>

</body>

</html>
