<%-- 
    Document   : new_patient
    Created on : 25 jun. 2019, 15:33:59
    Author     : Familia
--%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import="org.json.JSONObject,org.json.JSONException"%>
<%
    String alias = request.getParameter("alias");
    String especie = request.getParameter("especie");
    String raza = request.getParameter("raza");
    String color = request.getParameter("color");
    String nacimiento = request.getParameter("nacimiento");
    int idCliente = Integer.parseInt(request.getParameter("idCliente"));

    JSONObject user = (JSONObject)session.getAttribute("usuario");
    String idC = user.get("idUsuario").toString();
    int idUsuario = Integer.parseInt(idC);

    Connection canal = null;
    ResultSet tabla= null;
    Statement instruccion=null;
    String strcon = "jdbc:mysql://localhost:3306/veterinaria?user=root&password=";
    
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        canal=DriverManager.getConnection(strcon);
        instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
    } catch(java.lang.ClassNotFoundException e){
    }catch(SQLException e) {};

    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        canal=DriverManager.getConnection(strcon);
        instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
    } catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

    String q="insert into paciente (idUsuario, idCliente, aliasMascota, especie, raza, colorPelo, fechaNacimiento) values("+idUsuario+", "+idCliente+", '"+alias+"', '"+especie+"', '"+raza+"', '"+color+"', '"+nacimiento+"');";

    try {
        int n=instruccion.executeUpdate(q);
        response.sendRedirect("dashboard.jsp");

        instruccion.close();
        canal.close();
    } catch(SQLException e){};

%>
