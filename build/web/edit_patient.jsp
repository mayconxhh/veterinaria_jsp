<%-- 
    Document   : edit_patient
    Created on : 28 jun. 2019, 02:15:17
    Author     : Familia
--%>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import="org.json.JSONObject,org.json.JSONException"%>
<%
    int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
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

    String q="UPDATE paciente SET idUsuario='"+idUsuario+"', aliasMascota='"+alias+"', fechaNacimiento='"+nacimiento+"', especie='"+especie+"', raza='"+raza+"' where idMascota="+idPaciente;
    try {
        instruccion.executeUpdate(q);
        response.sendRedirect("pacientes.jsp");
    } catch(SQLException e){};

    try {
        instruccion.close();
        canal.close();
    } catch(SQLException e){};

%>
