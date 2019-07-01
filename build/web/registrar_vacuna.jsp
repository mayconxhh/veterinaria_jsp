<%-- 
    Document   : agregar_familiar
    Created on : 25 jun. 2019, 23:21:56
    Author     : Familia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                    <div class="panel-title"><h3>Registrar vacuna</h3></div>
                                    
                                    <!-- <div class="panel-options">
                                        <a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
                                        <a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
                                    </div> -->
                                </div>
                                <div class="panel-body">
                                    <form class="form-horizontal" role="form" method="post" action="add_family.jsp">
                                      <div class="form-group">
                                        <label for="nombre" class="col-sm-2 control-label">Mascota</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="nombre" placeholder="Nombre de mascota" name="nombre" required minlength="3">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="apellido" class="col-sm-2 control-label">Fecha</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="apellido" placeholder="Fecha actual" name="apellido" required minlength="3">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="telefono" class="col-sm-2 control-label">Nombre de Vacuna</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="telefono" placeholder="vacuna" name="telefono" required minlength="6">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="telefono" class="col-sm-2 control-label">Tratamiento</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control" id="telefono" placeholder="tratamiento" name="telefono" required minlength="6">
                                        </div>
                                      </div>
                                      <br>
                                      <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                          <button type="submit" class="btn btn-primary">agregar registro</button>
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