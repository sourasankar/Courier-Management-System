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

              <h5 class="card-title">Destination Details</h5>

              <!-- Multi Columns Form -->
              <form>
                <div class="row g-2">
                  
                    <div class="col-md-12">
                      <label for="inputName5" class="form-label">Your Name</label>
                      <input type="text" class="form-control" id="inputName5">
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail5" class="form-label">Email</label>
                      <input type="email" class="form-control" id="inputEmail5">
                    </div>
                    <div class="col-md-6">
                      <label for="inputPassword5" class="form-label">Password</label>
                      <input type="password" class="form-control" id="inputPassword5">
                    </div>
                    <div class="col-12">
                      <label for="inputAddress5" class="form-label">Address</label>
                      <input type="text" class="form-control" id="inputAddres5s" placeholder="1234 Main St">
                    </div>
                    <div class="col-12">
                      <label for="inputAddress2" class="form-label">Address 2</label>
                      <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
                    </div>
                    <div class="col-md-6">
                      <label for="inputCity" class="form-label">City</label>
                      <input type="text" class="form-control" id="inputCity">
                    </div>
                    <div class="col-md-4">
                      <label for="inputState" class="form-label">State</label>
                      <select id="inputState" class="form-select">
                        <option selected>Choose...</option>
                        <option>...</option>
                      </select>
                    </div>
                    <div class="col-md-2">
                      <label for="inputZip" class="form-label">Zip</label>
                      <input type="text" class="form-control" id="inputZip">
                    </div>
                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="gridCheck">
                        <label class="form-check-label" for="gridCheck">
                          Check me out
                        </label>
                      </div>
                    </div>

                    <h5 class="card-title">Destination Details</h5>
                    
                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Submit</button>
                      <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
                
                

              </form><!-- End Multi Columns Form -->
            </div>

            </div>
          </div>

        </div>

        
      </div>         

      

      </div>
             
    

  </main><!-- End #main -->

  <jsp:include page="assets/jsp/footer.jsp" />

</body>

</html>
