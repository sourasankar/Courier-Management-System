<%-- 
    Document   : index
    Created on : Dec 13, 2021, 6:32:15 PM
    Author     : soura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <title>Track Consignment</title>

  <%@include file="assets/jsp/head.jsp"%>

</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
              <%
                    if(request.getParameter("submit")!=null && request.getMethod().equals("POST")){
                %>
                <div class="d-flex flex-column align-items-center justify-content-center">

                    <div class="d-flex justify-content-center py-4">
                      <a href="javascript:void(0)" class="logo d-flex align-items-center w-auto">
                        <img src="assets/img/logo.png" alt="">
                        <span>CMS Tracking</span>
                      </a>
                    </div>
                      <div class="card mb-3" style="width: 100%;">
                          <div class="card-body" style="margin-top: 30px;">
                          <div class="col-md-10 offset-md-1 col-xxl-8 offset-xxl-2">
                              <table class="table table-striped table-bordered">
                                <thead>
                                  <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Consignment ID</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Remarks</th>
                                  </tr>
                                </thead>
                                <tbody>

                                  <tr class="align-middle">
                                    <th scope="row">1</th>
                                    <td>PKG12380691IN</td>
                                    <td>13-12-2021</td>
                                    <td>19:12:30</td>
                                    <td>Booked</td>
                                    <td>at Hooghly DHO</td>
                                  </tr>
                                  <tr class="align-middle">
                                    <th scope="row">1</th>
                                    <td>PKG12380691IN</td>
                                    <td>13-12-2021</td>
                                    <td>19:12:30</td>
                                    <td>Booked</td>
                                    <td>at Hooghly DHO</td>
                                  </tr><tr class="align-middle">
                                    <th scope="row">1</th>
                                    <td>PKG12380691IN</td>
                                    <td>13-12-2021</td>
                                    <td>19:12:30</td>
                                    <td>Booked</td>
                                    <td>at Hooghly DHO</td>
                                  </tr><tr class="align-middle">
                                    <th scope="row">1</th>
                                    <td>PKG12380691IN</td>
                                    <td>13-12-2021</td>
                                    <td>19:12:30</td>
                                    <td>Booked</td>
                                    <td>at Hooghly DHO</td>
                                  </tr><tr class="align-middle">
                                    <th scope="row">1</th>
                                    <td>PKG12380691IN</td>
                                    <td>13-12-2021</td>
                                    <td>19:12:30</td>
                                    <td>Booked</td>
                                    <td>at Hooghly DHO</td>
                                  </tr><tr class="align-middle">
                                    <th scope="row">1</th>
                                    <td>PKG12380691IN</td>
                                    <td>13-12-2021</td>
                                    <td>19:12:30</td>
                                    <td>Booked</td>
                                    <td>at Hooghly DHO</td>
                                  </tr>
                                  <tr class="align-middle">
                                    <th scope="row">1</th>
                                    <td>PKG12380691IN</td>
                                    <td>13-12-2021</td>
                                    <td>19:12:30</td>
                                    <td>Booked</td>
                                    <td>at Hooghly DHO</td>
                                  </tr>
                                  <tr class="align-middle">
                                    <th scope="row">1</th>
                                    <td>PKG12380691IN</td>
                                    <td>13-12-2021</td>
                                    <td>19:12:30</td>
                                    <td>Booked</td>
                                    <td>at Hooghly DHO</td>
                                  </tr>
                                  <tr class="align-middle">
                                    <th scope="row">1</th>
                                    <td>PKG12380691IN</td>
                                    <td>13-12-2021</td>
                                    <td>19:12:30</td>
                                    <td>Booked</td>
                                    <td>at Hooghly DHO</td>
                                  </tr>
                                  <tr class="align-middle">
                                    <th scope="row">1</th>
                                    <td>PKG12380691IN</td>
                                    <td>13-12-2021</td>
                                    <td>19:12:30</td>
                                    <td>Booked</td>
                                    <td>at Hooghly DHO</td>
                                  </tr>
                                  <tr class="align-middle">
                                    <th scope="row">1</th>
                                    <td>PKG12380691IN</td>
                                    <td>13-12-2021</td>
                                    <td>19:12:30</td>
                                    <td>Booked</td>
                                    <td>at Hooghly DHO</td>
                                  </tr>
                                  
                                  
                                  
                                  

                                </tbody>
                              </table>
                          </div>
                          </div>
                      </div>
                </div>
                    <%
                    }
                    else{
                    %>
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="javascript:void(0)" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span>CMS Tracking</span>
                </a>
              </div>

              <div class="card mb-3">

                <div class="card-body" style="padding-bottom: 30px;">
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Consignment ID:</h5>
                  </div>
                    
                    <form method="POST" action="#" class="row g-3">

                        <div class="col-12">
                          <div class="input-group">
                              <input type="text" name="consignmentId" class="form-control" id="consignmentId" required>
                          </div>
                        </div>            
                        <div class="col-12">
                            <button class="btn btn-primary w-100" id="submit" name="submit" value="submit" type="submit">Track Consignment</button>
                        </div>
                    
                    </form>
                    <% } %>

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
