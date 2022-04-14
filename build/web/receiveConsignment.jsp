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
      <h1>Receive Consignment</h1>
    </div><!-- End Page Title -->

      <div class="row">
        <div class="col-12">


          <div class="card">
            <div class="card-body" style="margin-top: 20px;">

              <!-- Multi Columns Form -->
              <form method="POST" action="receiveConsignment.jsp">
                  
<!--                  <h5 class="card-title">Package Details</h5>-->
                  
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
            //if(request.getMethod().equals("GET")){ 
            //if(request.getParameter("submit")!=null){
            %>
            
            <div class="card">
                <div class="card-body">

                  <!-- Multi Columns Form -->
                  <form method="POST" action="receiveConsignment.jsp">

                    <h5 class="card-title">Package Details</h5>

                    <div style="display: flex;">
                        <fieldset style="all: revert; font-weight: 600;width: fit-content;" class="col-6">
                            <legend style="all: revert;">Consignment Tag:</legend>
                            Consignment ID: AEGD74595WB <br>
                            Weight: 15gm<br><br>
                            <u>Ship To:</u><br>
                            Soura Sankar Mondal<br>
                            Bali Kali Tala,<br>P.O & Dist- Hooghly,<br>
                            Hooghly, West Bengal, 712103<br><br>
                            <u>From:</u><br>
                            Uday Sankar Mondal<br>
                            Bali Kali Tala,<br>P.O & Dist- Hooghly,<br>
                            Hooghly, West Bengal, 712103<br>                       
                        </fieldset>   
                    </div>
                    <div class="text-center" style="margin-top: 20px;">
                            <button type="submit" class="btn btn-primary col-6 col-md-4 col-lg-3 col-xxl-2" id="submit" name="submit" value="submit">Receive Consignment</button>
                    </div>

                  </form><!-- End Multi Columns Form -->

                </div>
            </div>
            
            <%
            //}    
            %>
            
          

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
