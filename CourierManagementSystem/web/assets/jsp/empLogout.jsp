<%-- 
    Document   : empLogout
    Created on : Dec 13, 2021, 12:34:56 PM
    Author     : soura
--%>

<%
    
    session.invalidate();
    response.sendRedirect("../../employeeLogin.jsp");

%>
