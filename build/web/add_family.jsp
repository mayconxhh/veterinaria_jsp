<%-- 
    Document   : add_family
    Created on : 25 jun. 2019, 23:35:55
    Author     : Familia
--%>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import="org.json.JSONObject,org.json.JSONException"%>
<%
    String apellido = request.getParameter("apellido");
    String nombre = request.getParameter("nombre");
    String telefono = request.getParameter("telefono");

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

    String q="insert into persona (idUsuario, nombrePersona, apellidoPersona, telefono) values("+idUsuario+", '"+nombre+"', '"+apellido+"', '"+telefono+"'); ";
    try {
        int n=instruccion.executeUpdate(q);
        response.sendRedirect("dashboard.jsp");

        instruccion.close();
        canal.close();
    } catch(SQLException e){};

%>