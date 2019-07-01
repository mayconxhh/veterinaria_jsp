<%-- 
    Document   : login
    Created on : 25 jun. 2019, 00:15:36
    Author     : Familia
--%>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import="org.json.JSONObject,org.json.JSONException"%>
<%
    //String jsonString = json.toString();
    session.setAttribute("usuario", null);
    response.sendRedirect("index.jsp");
%>
