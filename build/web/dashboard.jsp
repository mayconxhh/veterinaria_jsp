<%-- 
    Document   : dashboard
    Created on : 25 jun. 2019, 01:36:51
    Author     : Familia
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%
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
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi Mascota | Dashboard</title>
        <link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="./css/styles.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <jsp:include page="./components/header.jsp" />

        <div class="page-content">
            <div class="row">
                <div class="col-md-2">
                    <jsp:include page="./components/sidebar.jsp" />
                </div>
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="content-box-large">
                                <div class="panel-heading">
                                    <div class="panel-title">Pacientes</div>
                                    
                                    <div class="panel-options">
                                      <a href="pacientes.jsp" data-rel="reload">Ver más... <i class="glyphicon glyphicon-log-in"></i></a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                      <thead>
                                        <tr>
                                          <th>#</th>
                                          <th>Nombre</th>
                                          <th>Fecha Nac.</th>
                                          <th>Raza</th>
                                          <th>Especie</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <%
                                          try {
                                            String sql="select * from paciente limit 5";
                                            tabla = instruccion.executeQuery(sql);
                                            
                                            while(tabla.next()){
                                              out.println("<TR>");
                                              out.println("<TD>"+tabla.getString(1)+"</TD>");
                                              out.println("<TD>"+tabla.getString(4)+"</TD>");
                                              out.println("<TD>"+tabla.getString(5)+"</TD>");
                                              out.println("<TD>"+tabla.getString(6)+"</TD>");
                                              out.println("<TD>"+tabla.getString(7)+"</TD>");
                                              out.println("</TR>");
                                            }
                                          } //fin try no usar ; al final de dos o más catchs
                                          catch(SQLException e) {
                                          };
                                        %>
                                      </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="content-box-large">
                                <div class="panel-heading">
                                    <div class="panel-title">Clientes</div>
                                    
                                    <div class="panel-options">
                                      <a href="clientes.jsp" data-rel="reload">Ver más... <i class="glyphicon glyphicon-log-in"></i></a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <table class="table table-striped">
                                      <thead>
                                        <tr>
                                          <th>#</th>
                                          <th>Apellido</th>
                                          <th>Cuenta de Banco</th>
                                          <th>Telefono</th>
                                          <th>Dirección</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <%
                                          try {
                                            String sql="select * from cliente limit 5";
                                            tabla = instruccion.executeQuery(sql);
                                            
                                            while(tabla.next()){
                                              out.println("<TR>");
                                              out.println("<TD>"+tabla.getString(1)+"</TD>");
                                              out.println("<TD>"+tabla.getString(3)+"</TD>");
                                              out.println("<TD>"+tabla.getString(4)+"</TD>");
                                              out.println("<TD>"+tabla.getString(5)+"</TD>");
                                              out.println("<TD>"+tabla.getString(6)+"</TD>");
                                              out.println("</TR>");
                                            }
                                            
                                            tabla.close();
                                            instruccion.close();
                                            canal.close();
                                          } //fin try no usar ; al final de dos o más catchs
                                          catch(SQLException e) {
                                          };
                                        %>
                                      </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="./components/footer.jsp" />
        <script src="./js/jquery-3.3.1.slim.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/custom.js"></script>
    </body>
</html>
