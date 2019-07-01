<%-- 
    Document   : editar_paciente
    Created on : 28 jun. 2019, 01:34:28
    Author     : Familia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%

  int idPaciente = Integer.parseInt(request.getParameter("paciente"));
  String idCliente="";
  String nombre="";
  String fechaNac="";
  String especie="";
  String raza="";
  String colorPelo=""; 

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
    String sql="select * from paciente where idMascota="+idPaciente;
    tabla = instruccion.executeQuery(sql);
    
    if (tabla.next()) {
      idCliente = tabla.getObject(3).toString();
      nombre = tabla.getObject(4).toString();
      fechaNac = tabla.getObject(5).toString();
      especie = tabla.getObject(6).toString();
      raza = tabla.getObject(7).toString();
      colorPelo = tabla.getObject(8).toString();
    }
  } //fin try no usar ; al final de dos o más catchs
  catch(SQLException e) {
  };
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi Mascota</title>
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
                        <div class="col-md-8 col-md-offset-2">
                            <div class="content-box-large">
                                <div class="panel-heading">
                                    <div class="panel-title"><h3>Crear nuevo cliente</h3></div>
                                  
                                    <!-- <div class="panel-options">
                                      <a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
                                      <a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
                                    </div> -->
                                </div>
                                <div class="panel-body">
                                    <form class="form-horizontal" role="form" method="post" action="edit_patient.jsp">
                                      <input type="text" class="hidden" name="idPaciente" value="<%= idPaciente %>">
                                      <div class="form-group">
                                        <label for="alias" class="col-sm-2 control-label">Nombre</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="alias" placeholder="Nombre" name="alias" required minlength="3" value="<%= nombre %>">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="familia" class="col-sm-2 control-label">Cliente</label>
                                        <div class="col-sm-10">
                                          <select type="text" class="form-control" id="familia" name="idCliente" required minlength="3">
                                            <%
                                                try {
                                                  String sql="select * from cliente";
                                                  tabla = instruccion.executeQuery(sql);
                                                  while(tabla.next()){
                                                    if(Integer.parseInt(idCliente) == Integer.parseInt(tabla.getString(1))){
                                                      out.println("<OPTION SELECTED VALUE="+tabla.getString(1)+">"+tabla.getString(3)+"</OPTION>");
                                                    } else{
                                                      out.println("<OPTION VALUE="+tabla.getString(1)+">"+tabla.getString(3)+"</OPTION>");
                                                    }
                                                  }
                                                  
                                                  tabla.close();
                                                  instruccion.close();
                                                  canal.close();
                                                } //fin try no usar ; al final de dos o más catchs
                                                catch(SQLException e) {
                                                };
                                              %>
                                          </select>
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="especie" class="col-sm-2 control-label">Especie</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="especie" placeholder="Especie" name="especie" required minlength="3" value="<%= especie %>">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="raza" class="col-sm-2 control-label">Raza</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="raza" placeholder="Raza de la mascota" name="raza" required minlength="3" value="<%= raza %>">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="color" class="col-sm-2 control-label">Color(es)</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="color" placeholder="Color o colores" name="color" required minlength="3" value="<%= colorPelo %>">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="nacimiento" class="col-sm-2 control-label">Fecha de Nacimiento</label>
                                        <div class="col-sm-10">
                                          <input type="date" class="form-control" id="nacimiento" placeholder="Fecha de Nacimiento" name="nacimiento" required value="<%= fechaNac %>">
                                        </div>
                                      </div>
                                      <br>
                                      <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                          <button type="submit" class="btn btn-primary">Editar Paciente</button>
                                        </div>
                                      </div>
                                    </form>
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

