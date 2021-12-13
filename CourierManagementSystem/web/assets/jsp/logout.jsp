<%-- 
    Document   : logout.jsp
    Created on : Nov 26, 2021, 12:10:24 PM
    Author     : soura
--%>

<%
    
    session.removeAttribute("branchUsername");
    session.removeAttribute("branchName");
    response.sendRedirect("../../branchLogin.jsp");

%>
