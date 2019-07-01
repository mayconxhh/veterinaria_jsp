<%-- 
    Document   : edit_client
    Created on : 28 jun. 2019, 01:08:26
    Author     : Familia
--%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import="org.json.JSONObject,org.json.JSONException"%>
<%
    int idCliente = Integer.parseInt(request.getParameter("idCliente"));
    String apellido = request.getParameter("apellido");
    String cuenta_b = request.getParameter("cuentaB");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");

    JSONObject user = (JSONObject)session.getAttribute("usuario");
    String idC = user.get("idUsuario").toString();
    int idUsuario = Integer.parseInt(idC);

    Connection canal = null;
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

    String q="UPDATE cliente SET idUsuario='"+idUsuario+"', primerApellido='"+apellido+"', cuentaBanco='"+cuenta_b+"', telefono='"+telefono+"', direccion='"+direccion+"' where idCliente="+idCliente;
    try {
        instruccion.executeUpdate(q);
        response.sendRedirect("clientes.jsp");
    } catch(SQLException e){};

    try {
        instruccion.close();
        canal.close();
    } catch(SQLException e){};

%>
