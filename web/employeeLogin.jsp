<%-- 
    Document   : employeeLogin
    Created on : Nov 25, 2021, 7:39:56 PM
    Author     : soura
--%>

<%!
    String employeeUsername,employeePassword,errorMsg;
%>
<%@page import="java.sql.*"%>
<%
    if(request.getParameter("submit")!=null && request.getMethod().equals("POST")){
        
        //Data from FORM
        employeeUsername = request.getParameter("employeeUsername");
        employeePassword = request.getParameter("employeePassword");
        
%>
        <%@include file="assets/jsp/dbConnection.jsp"%>
<%
        String sql = "SELECT name,password FROM employee_details WHERE employee_id=?";
        PreparedStatement st=conn.prepareStatement(sql);
        st.setString(1,employeeUsername);
        
        ResultSet rs=st.executeQuery();
        if(rs.next()){
            if(rs.getString("password").equals(employeePassword)){
                session.setAttribute("employeeUsername", employeeUsername);
                session.setAttribute("employeeName", rs.getString("name"));
                response.sendRedirect("employeeDashboard.jsp");
            }
            else{
                errorMsg = "Password not matched";
            }
        }
        else{
            errorMsg = "Account not found";
        }
        
        conn.close();
        
    }
    else{
        employeeUsername = "";
        employeePassword = "";
        errorMsg = null;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <title>Employee Login</title>

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
                <a href="#" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span>CMS Admin</span>
                </a>
              </div>

              <div class="card mb-3">

                <div class="card-body" style="padding-bottom: 30px;">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Employee Login</h5>
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

                    <form method="POST" action="employeeLogin.jsp" class="row g-3">

                    <div class="col-12">
                      <label for="employeeUsername" class="form-label">Username</label>
                      <div class="input-group">
                        <input type="text" name="employeeUsername" class="form-control" id="employeeUsername" value="<%= employeeUsername %>" required>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="employeePassword" class="form-label">Password</label>
                      <input type="password" name="employeePassword" class="form-control" id="employeePassword" value="<%= employeePassword %>" required>
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
