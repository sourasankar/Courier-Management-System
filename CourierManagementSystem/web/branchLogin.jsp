<%-- 
    Document   : branchLogin
    Created on : Nov 22, 2021, 8:01:00 PM
    Author     : soura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <title>Branch Login</title>

  <jsp:include page="assets/jsp/head.jsp" />

</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="#" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">CMS Admin</span>
                </a>
              </div>

              <div class="card mb-3">

                <div class="card-body" style="padding-bottom: 30px;">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Branch Login</h5>
                    <p class="text-center small">Enter your username & password to login</p>
                  </div>

                    <form method="POST" action="branchLogin.jsp" class="row g-3">

                    <div class="col-12">
                      <label for="branchUsername" class="form-label">Username</label>
                      <div class="input-group">
                        <input type="text" name="branchUsername" class="form-control" id="branchUsername" required>
                        <div class="invalid-feedback">Please enter your username.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="branchPassword" class="form-label">Password</label>
                      <input type="password" name="branchPassword" class="form-control" id="branchPassword" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>

                    
                    <div class="col-12">
                        <button class="btn btn-primary w-100" id="submit" name="submit" value="submit" type="submit">Login</button>
                    </div>
                    
                  </form>

                </div>
              </div>
            </div>
          </div>
        </div>

      </section>

    </div>
  </main>   
    
  <jsp:include page="assets/jsp/footer.jsp" />

</body>

</html>
