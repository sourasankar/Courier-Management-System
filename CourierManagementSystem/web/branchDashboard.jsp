<%-- 
    Document   : dashboard
    Created on : Nov 22, 2021, 7:29:13 PM
    Author     : soura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    
  <title>Dashboard</title>
  
  <jsp:include page="assets/jsp/head.jsp" />

  
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="assets/jsp/nav.jsp" />
  <!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <jsp:include page="assets/jsp/sidebar.jsp" />
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
                          <h6>3</h6>
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
                          <h6>14</h6>
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
                          <h6>12</h6>
                        </div>
                      </div>

                    </div>
                  </div>
            </div>

        </div>
    </section>

  </main><!-- End #main -->


  <jsp:include page="assets/jsp/footer.jsp" />

</body>

</html>
