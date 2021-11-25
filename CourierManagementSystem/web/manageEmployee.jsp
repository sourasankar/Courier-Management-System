<%-- 
    Document   : manageEmployee
    Created on : Nov 25, 2021, 8:27:26 PM
    Author     : soura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    
  <title>Manage Employee</title>
  
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
      <h1>Manage Employee</h1>
    </div><!-- End Page Title -->
    
        <div class="row">
            
            <div class="col-lg-6">
                <div class="card">
                 <div class="card-body">
                   <h5 class="card-title">Employees</h5>

                   <!-- Default Table -->
                   <table class="table table-striped table-bordered">
                     <thead>
                       <tr>
                         <th scope="col">#</th>
                         <th scope="col">Employee ID</th>
                         <th scope="col">Name</th>
                         <th scope="col">Action</th>
                       </tr>
                     </thead>
                     <tbody>
                       <tr class="align-middle">
                         <th scope="row">1</th>
                         <td>SD5245SD</td>
                         <td>Brandon Jacob</td>
                         <td>
                             <div style="display: flex;justify-content: space-evenly;">
                                <form method="POST" action="manageEmployee.jsp">
                                    <button type="submit" class="btn btn-primary" name="edit" value="empID"><i class="bi bi-pencil-square"></i></button>
                                </form>
                                <form method="POST" action="manageEmployee.jsp">
                                    <button type="submit" class="btn btn-danger" name="delete" value="empID"><i class="bi bi-trash"></i></button>
                                </form> 
                            </div>
                         </td>
                       </tr>
                       <tr class="align-middle">
                         <th scope="row">2</th>
                         <td>SD5245SD</td>
                         <td>Bridie Kessler</td>
                         <td>
                             <div style="display: flex;justify-content: space-evenly;">
                                <form method="POST" action="manageEmployee.jsp">
                                    <button type="submit" class="btn btn-primary" name="edit" value="empID"><i class="bi bi-pencil-square"></i></button>
                                </form>
                                <form method="POST" action="manageEmployee.jsp">
                                    <button type="submit" class="btn btn-danger" name="delete" value="empID"><i class="bi bi-trash"></i></button>
                                </form> 
                            </div>
                         </td>
                       </tr>
                       <tr class="align-middle">
                         <th scope="row">3</th>
                         <td>SD5245SD</td>
                         <td>Ashleigh Langosh</td>
                         <td>
                             <div style="display: flex;justify-content: space-evenly;">
                                <form method="POST" action="manageEmployee.jsp">
                                    <button type="submit" class="btn btn-primary" name="edit" value="empID"><i class="bi bi-pencil-square"></i></button>
                                </form>
                                <form method="POST" action="manageEmployee.jsp">
                                    <button type="submit" class="btn btn-danger" name="delete" value="empID"><i class="bi bi-trash"></i></button>
                                </form> 
                            </div>
                         </td>
                       </tr>
                       <tr class="align-middle">
                         <th scope="row">4</th>
                         <td>SD5245SD</td>
                         <td>Angus Grady</td>
                         <td>
                             <div style="display: flex;justify-content: space-evenly;">
                                <form method="POST" action="manageEmployee.jsp">
                                    <button type="submit" class="btn btn-primary" name="edit" value="empID"><i class="bi bi-pencil-square"></i></button>
                                </form>
                                <form method="POST" action="manageEmployee.jsp">
                                    <button type="submit" class="btn btn-danger" name="delete" value="empID"><i class="bi bi-trash"></i></button>
                                </form> 
                            </div>
                         </td>
                       </tr>
                       <tr class="align-middle">
                         <th scope="row">5</th>
                         <td>SD5245SD</td>
                         <td>Raheem Lehner</td>
                         <td>
                             <div style="display: flex;justify-content: space-evenly;">
                                <form method="POST" action="manageEmployee.jsp">
                                    <button type="submit" class="btn btn-primary" name="edit" value="empID"><i class="bi bi-pencil-square"></i></button>
                                </form>
                                <form method="POST" action="manageEmployee.jsp">
                                    <button type="submit" class="btn btn-danger" name="delete" value="empID"><i class="bi bi-trash"></i></button>
                                </form> 
                            </div>
                         </td>
                       </tr>
                     </tbody>
                   </table>
                   <!-- End Default Table Example -->
                 </div>
               </div>
            </div>
            <div class="col-lg-6">
                <div class="card">
                <div class="card-body">
                    
                    <%
                    if(request.getParameter("addEmployee")!=null && request.getMethod().equals("POST")){
                    %>
                    
                    <div class="alert alert-success alert-dismissible fade show col-md-10 text-center mx-auto" style="margin-top: 20px;" role="alert">
                        <i class="bi bi-check-circle me-1"></i>
                        Employee has been Added successfully
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    
                    <%
                    }
                    %>
                    
                  <h5 class="card-title">Default Table</h5>

                  <form class="row g-3" method="POST" action="manageEmployee.jsp">
                      
                    <div class="col-md-6">
                      <label for="employeeName" class="form-label">Name</label>
                      <input type="text" class="form-control" id="employeeName" name="employeeName" required>
                    </div>
                    <div class="col-md-6">
                      <label for="employeePhone" class="form-label">Phone</label>
                      <input type="phone" class="form-control" id="employeePhone" name="employeePhone" required>
                    </div>
                 
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary" id="addEmployee" name="addEmployee" value="addEmployee">Add Employee</button>
                    </div>
                      
                </form>
                  
                </div>
              </div>
            </div>

        </div>

  </main><!-- End #main -->


  <jsp:include page="assets/jsp/footer.jsp" />

</body>

</html>