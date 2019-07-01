<%-- 
    Document   : nuevo_cliente
    Created on : 25 jun. 2019, 13:03:04
    Author     : Familia
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                  
                                    <div class="panel-options">
                                      <a href="#" data-rel="reload">Ver más... <i class="glyphicon glyphicon-log-in"></i></a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <form class="form-horizontal" role="form" method="post" action="new_client.jsp">
                                      <div class="form-group">
                                        <label for="apellido" class="col-sm-2 control-label">Apellido</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="apellido" placeholder="Apellido de Familia" name="apellido" required minlength="3">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="cuentaB" class="col-sm-2 control-label">Cuenta de Banco</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="cuentaB" placeholder="Número de Cuenta" name="cuentaB" required minlength="8">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="telefono" class="col-sm-2 control-label">Teléfono</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="telefono" placeholder="Número de Teléfono o Celular" name="telefono" required minlength="6">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="direccion" class="col-sm-2 control-label">Direccón</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="direccion" placeholder="Direccón de Familia" name="direccion" required minlength="6">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                          <button type="submit" class="btn btn-primary">Registrar Cliente</button>
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
