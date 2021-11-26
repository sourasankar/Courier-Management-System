<%-- 
    Document   : branchLogin
    Created on : Nov 22, 2021, 8:01:00 PM
    Author     : soura
--%>
<%!
    String branchUsername,branchPassword,errorMsg;
%>
<%@page import="java.sql.*"%>
<%
    if(request.getParameter("submit")!=null && request.getMethod().equals("POST")){
        
        //Data from FORM
        branchUsername = request.getParameter("branchUsername");
        branchPassword = request.getParameter("branchPassword");
        
%>
        <%@include file="assets/jsp/dbConnection.jsp"%>
<%
        String sql = "SELECT name,password FROM branch_details WHERE branch_id=?";
        PreparedStatement st=conn.prepareStatement(sql);
        st.setString(1,branchUsername);
        
        ResultSet rs=st.executeQuery();
        if(rs.next()){
            if(rs.getString("password").equals(branchPassword)){
                out.print("<script>alert('Logged In')</script>");
                session.setAttribute("branchUsername", branchUsername);
                session.setAttribute("branchName", rs.getString("name"));
                response.sendRedirect("branchDashboard.jsp");
            }
            else{
//                out.print("<script>alert('Wrong Password')</script>");
                errorMsg = "Password not matched";
            }
        }
        else{
//            out.print("<script>alert('Not Found')</script>");
            errorMsg = "Account not found";
        }
        
        conn.close();
        
    }
    else{
        branchUsername = "";
        branchPassword = "";
        errorMsg = null;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <title>Branch Login</title>

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
                  <span class="d-none d-lg-block">CMS Admin</span>
                </a>
              </div>

              <div class="card mb-3">

                <div class="card-body" style="padding-bottom: 30px;">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Branch Login</h5>
                    <p class="text-center small">Enter your username & password to login</p>
                  </div>
                    <%
                        if(errorMsg!=null){
                    %>
                    <div class="alert alert-danger text-center" style="padding: 1px 20px;font-weight: 600;" role="alert">
                        <i class="bi bi-exclamation-triangle"></i> <%= errorMsg %>
                    </div>
                    <%
                      }  
                    %>

                    <form method="POST" action="branchLogin.jsp" class="row g-3">

                    <div class="col-12">
                      <label for="branchUsername" class="form-label">Username</label>
                      <div class="input-group">
                          <input type="text" name="branchUsername" class="form-control" id="branchUsername" value="<%= branchUsername %>" required>
<!--                        <div class="invalid-feedback">Please enter your username.</div>-->
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="branchPassword" class="form-label">Password</label>
                      <input type="password" name="branchPassword" class="form-control" id="branchPassword" value="<%= branchPassword %>" required>
<!--                      <div class="invalid-feedback">Please enter your password!</div>-->
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
    
  <%@include file="assets/jsp/footer.jsp"%>

</body>

</html>
