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

    
  
      <div class="row">

            
        <!-- Reports -->
        <div class="col-12">
              <div class="card">

                <div class="card-body" style="padding: 20px; height: 100px;">
                  <!-- <h5 class="card-title">Reports <span>/Today</span></h5> -->

                

                </div>

              </div>
        </div><!-- End Reports -->

           

      

      </div>
             
    

  </main><!-- End #main -->


  <jsp:include page="assets/jsp/footer.jsp" />

</body>

</html>
