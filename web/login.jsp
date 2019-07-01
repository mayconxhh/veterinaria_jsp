<%-- 
    Document   : login
    Created on : 25 jun. 2019, 00:15:36
    Author     : Familia
--%>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import="org.json.JSONObject,org.json.JSONException"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

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
        String sql = "select * from usuario where username='"+username+"' and password='"+password+"'";
        tabla = instruccion.executeQuery(sql);
        
        if (tabla.next()) {
            ResultSetMetaData metaData = tabla.getMetaData();
            JSONObject json = new JSONObject();
            for (int i = 0; i < metaData.getColumnCount(); i++) {
                json.put(metaData.getColumnLabel(i + 1),tabla.getObject(i + 1));
            }
            
            json.put("password", "");
            //String jsonString = json.toString();
            session.setAttribute("usuario", json);
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("iniciar_sesion.jsp");
        }
        
        tabla.close();
        instruccion.close();
        canal.close();
    } //fin try no usar ; al final de dos o más catchs
    catch(SQLException e) {
    };
%>
