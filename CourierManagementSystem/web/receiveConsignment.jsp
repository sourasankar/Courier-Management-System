<%-- 
    Document   : receiveConsignment
    Created on : Nov 24, 2021, 8:07:57 PM
    Author     : soura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  
  <title>Receive Consignment</title>

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
      <h1>Book Consignment</h1>
    </div><!-- End Page Title -->

      <div class="row">
        <div class="col-12">


          <div class="card">
            <div class="card-body">
                
            <%
            //if(request.getMethod().equals("GET")){ 
            if(request.getParameter("submit")!=null){
//                out.print("<script>alert('Consignment has been successfully booked')</script>");
  
            %>
            
<!--                Need To done something after putting ID-->
                
            <%
            }
            else{
            %>
            
              <!-- Multi Columns Form -->
              <form method="POST" action="">
                  
                  <h5 class="card-title">Package Details</h5>
                  
                  <div class="row g-2">
                      
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="length" class="form-label">Length (cm) <span style="color: red;">*</span></label>
                      <input type="number" class="form-control" id="length" name="length" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="width" class="form-label">Width (cm) <span style="color: red;">*</span></label>
                      <input type="number" class="form-control" id="width" name="width" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="height" class="form-label">Height (cm) <span style="color: red;">*</span></label>
                      <input type="number" class="form-control" id="height" name="height" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="weight" class="form-label">Weight (gm) <span style="color: red;">*</span></label>
                      <input type="number" class="form-control" id="weight" name="weight" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="amount" class="form-label">Amount (Rs) <span style="color: red;">*</span></label>
                      <input type="number" class="form-control" id="amount" name="amount" required>
                    </div>
                      
                  </div>
                  
              </form><!-- End Multi Columns Form -->
            
            <%  
            }
            %>
            

            </div>
          </div>

        </div>        
    
  </main><!-- End #main -->
  
    <script>
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
    </script>

  <jsp:include page="assets/jsp/footer.jsp" />

</body>

</html>
