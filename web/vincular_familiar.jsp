<%-- 
    Document   : vincular_familiar
    Created on : 28 jun. 2019, 11:20:07
    Author     : Familia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%
  int idPaciente = Integer.parseInt(request.getParameter("paciente"));
  String alias="";
  String idCliente="";

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
      alias = tabla.getObject(4).toString();
    }
  } //fin try no usar ; al final de dos o más catchs
  catch(SQLException e) {
  };


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
                        <div class="col-md-8 col-md-offset-2">
                            <div class="content-box-large">
                                <div class="panel-heading">
                                    <div class="panel-title"><h3>Agregar familiar a <%= alias %></h3></div>
                                    
                                    <!-- <div class="panel-options">
                                        <a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
                                        <a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
                                    </div> -->
                                </div>
                                <div class="panel-body">
                                    <form class="form-horizontal" role="form" method="post" action="link_person.jsp">
                                      <input type="text" class="hidden" name="idCliente" value="<%= idCliente %>">
                                      <div class="form-group">
                                        <label for="familia" class="col-sm-2 control-label">Seleccione familiar</label>
                                        <div class="col-sm-10">
                                          <select type="text" class="form-control" id="familia" name="idPersona" required minlength="3">
                                            <%
                                                try {
                                                  String sql="select * from persona";
                                                  tabla = instruccion.executeQuery(sql);
                                                  while(tabla.next()){
                                                    out.println("<OPTION VALUE="+tabla.getString(1)+">"+tabla.getString(3)+"</OPTION>");
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
                                        <div class="col-sm-offset-2 col-sm-10">
                                          <button type="submit" class="btn btn-primary">Agregar familiar</button>
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
