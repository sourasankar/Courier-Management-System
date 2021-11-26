<%-- 
    Document   : dbConnection
    Created on : Nov 26, 2021, 10:38:35 AM
    Author     : soura
--%>

<%@page import="java.sql.*,java.util.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");   
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms", "root", "");                
    
    Statement st=conn.createStatement();
    
%>