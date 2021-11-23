<%-- 
    Document   : bookConsignment
    Created on : Nov 22, 2021, 8:03:11 PM
    Author     : soura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  
  <title>Book Consignment</title>

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

              

              <!-- Multi Columns Form -->
              <form method="post" action="#">
                  
                  <h5 class="card-title">Package Details</h5>
                  
                  <div class="row g-2">
                      
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="length" class="form-label">Length (cm)</label>
                      <input type="number" class="form-control" id="length" name="length" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="width" class="form-label">Width (cm)</label>
                      <input type="number" class="form-control" id="width" name="width" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="height" class="form-label">Height (cm)</label>
                      <input type="number" class="form-control" id="height" name="height" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="weight" class="form-label">Weight (gm)</label>
                      <input type="number" class="form-control" id="weight" name="weight" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="amount" class="form-label">Amount (Rs)</label>
                      <input type="number" class="form-control" id="amount" name="amount" required>
                    </div>
                      
                  </div>
                  
                  <h5 class="card-title">Destination Details</h5>
                 
                <div class="row g-2">
                  
                    <div class="col-md-6">
                      <label for="toname" class="form-label">Receiver Name</label>
                      <input type="text" class="form-control" id="toname" name="toname" required>
                    </div>
                    <div class="col-md-6">
                      <label for="tophone" class="form-label">Phone No</label>
                      <input type="phone" class="form-control" id="tophone" name="tophone" required>
                    </div>
                    <div class="col-lg-6">
                      <label for="toaddress1" class="form-label">Address</label>
                      <input type="text" class="form-control" id="toaddress1" name="toaddress1" required>
                    </div>
                    <div class="col-lg-6">
                      <label for="toaddress2" class="form-label">Address 2</label>
                      <input type="text" class="form-control" id="toaddress2" name="toaddress2">
                    </div>
                    <div class="col-sm-6 col-md-4">
                      <label for="tostate" class="form-label">State</label>
                      <select id="tostate" name="tostate" class="form-select" required>
                        <option value="">Choose...</option>
                        <option>...</option>
                      </select>
                    </div>
                    <div class="col-sm-6 col-md-4">
                      <label for="todistrict" class="form-label">District</label>
                      <select id="todistrict" name="todistrict" class="form-select" required>
                        <option value="">Choose...</option>
                        <option>...</option>
                      </select>
                    </div>             
                    <div class="col-md-4">
                      <label for="topincode" class="form-label">Zip</label>
                      <input type="text" class="form-control" id="topincode" name="topincode" required>
                    </div>
                    
                </div>

                <h5 class="card-title">Sender Details</h5>
                
                <div class="row g-2">
                  
                    <div class="col-md-6">
                      <label for="fromname" class="form-label">Sender Name</label>
                      <input type="text" class="form-control" id="fromname" name="fromname" required>
                    </div>
                    <div class="col-md-6">
                      <label for="fromphone" class="form-label">Phone No</label>
                      <input type="phone" class="form-control" id="fromphone" name="fromphone" required>
                    </div>
                    <div class="col-lg-6">
                      <label for="fromaddress1" class="form-label">Address</label>
                      <input type="text" class="form-control" id="fromaddress1" name="fromaddress1" required>
                    </div>
                    <div class="col-lg-6">
                      <label for="fromaddress2" class="form-label">Address 2</label>
                      <input type="text" class="form-control" id="fromaddress2" name="fromaddress2">
                    </div>
                    <div class="col-sm-6 col-md-4">
                      <label for="fromstate" class="form-label">State</label>
                      <select id="fromstate" name="fromstate" class="form-select" required>
                        <option value="">Choose...</option>
                        <option>...</option>
                      </select>
                    </div>
                    <div class="col-sm-6 col-md-4">
                      <label for="fromdistrict" class="form-label">District</label>
                      <select id="fromdistrict" name="fromdistrict" class="form-select" required>
                        <option value="">Choose...</option>
                        <option>...</option>
                      </select>
                    </div>             
                    <div class="col-md-4">
                      <label for="frompincode" class="form-label">Zip</label>
                      <input type="text" class="form-control" id="frompincode" name="frompincode" required>
                    </div>
                    
                </div>
                    
                <div class="text-center" style="margin-top: 20px;">
                    <button type="submit" class="btn btn-primary col-3" id="submit" name="submit">Submit</button>
                    
                </div>                           

              </form><!-- End Multi Columns Form -->
            

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
