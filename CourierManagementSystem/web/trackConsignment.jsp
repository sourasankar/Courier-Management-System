<%-- 
    Document   : index
    Created on : Dec 13, 2021, 6:32:15 PM
    Author     : soura
--%>
<%@page import="java.sql.*, java.util.regex.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="assets/jsp/dbConnection.jsp"%>
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
                              <div class="col-lg-10 offset-lg-1" style="overflow: auto;">
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
                                   <%
                                        String sql = "SELECT * FROM consignment_tracker WHERE consignment_id=? ORDER BY date,time";
                                        PreparedStatement st=conn.prepareStatement(sql);
                                        st.setString(1,request.getParameter("consignmentId"));
                                        ResultSet rs=st.executeQuery();
                                        SimpleDateFormat today = new SimpleDateFormat("dd-MMM-yyyy");
                                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                        int i = 1;                            
                                        while(rs.next()){
                                            java.util.Date date = dateFormat.parse(rs.getString("date"));
                                   %>
                                  <tr class="align-middle">
                                    <th scope="row"><%= i %></th>
                                    <td><%= rs.getString("consignment_id") %></td>
                                    <td><%= today.format(date) %></td>
                                    <td><%= rs.getString("time") %></td>
                                    <td><%= rs.getString("status") %></td>
                                    <td><%= rs.getString("remarks") %></td>
                                  </tr>
                                  <% i++; }%>
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
                    
                    <form method="POST" action="trackConsignment.jsp" class="row g-3">

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
