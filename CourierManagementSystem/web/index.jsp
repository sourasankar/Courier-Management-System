<%-- 
    Document   : index
    Created on : Dec 13, 2021, 6:38:55 PM
    Author     : soura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <title>Home</title>

  <%@include file="assets/jsp/head.jsp"%>

</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="javascript:void(0)" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span>CMS HOME</span>
                </a>
              </div>

                <div class="card mb-3" style="width: 100%;">

                <div class="card-body" style="padding-bottom: 30px;">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">HOME</h5>
                  </div>
                    
                    <div class="row g-3">
           
                    <div class="col-12">
                        <a class="btn btn-primary w-100" href="branchLogin.jsp" >Branch Login</a>
                    </div>
                    <div class="col-12">
                        <a class="btn btn-primary w-100" href="employeeLogin.jsp" >Employee Login</a>
                    </div>
                    <div class="col-12">
                        <a class="btn btn-primary w-100" href="trackConsignment.jsp" >Track Consignment</a>
                    </div>
                    
                    </div>

                </div>
              </div>
            </div>
          </div>
        </div>

      </section>

    </div>
  </main>   
    
  <%@include file="assets/jsp/footer.jsp"%>

</body>

</html>
