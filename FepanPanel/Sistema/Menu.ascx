<%@ Control Language="VB" CodeBehind="Menu.ascx.vb" Inherits="FepanPanel.Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Fepan - Inicio</title>
        <!-- Bootstrap core JavaScript-->
 <script src="../Bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="../Bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
    <!-- Bootstrap core CSS-->
    <link href="../Bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="../Bootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/v4-shims.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <script defer src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.5.0/js/v4-shims.js"></script>
    <!-- Custom styles for this template-->
    <link href="../Bootstrap/css/sb-admin.css" rel="stylesheet">

    <!-- Core plugin JavaScript-->
    <script src="../Bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script>
        function getServidores(selectObject) {
            var servidor = selectObject.value;
            document.cookie = "servidores=" + "";
            document.cookie = "servidores=" + servidor;
            location.reload();
        }
    </script>
     
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
    <!--Navegacion-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
        <a class="navbar-brand" style="width: 220PX !important" href="sisMenuPanel.aspx">
            <img height="42" src="../Imagenes/fepanlogo2.png" />
        </a>
        <!--Form control servidores-->
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav navbar-sidenav" id="AcordeonMenu">
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Inicio">
                    <a class="nav-link" href="sisMenuPanel.aspx">
                        <i class="fas fa-tachometer-alt"></i>
                        <span class="nav-link-text">Inicio</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Folios">
                    <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseFolio" data-parent="#AcordeonMenu">
                        <i class="fas fa-file-invoice"></i>
                        <span class="nav-link-text">Folios</span>
                    </a>
                    <ul class="sidenav-second-level collapse" id="collapseFolio">
                        <li>
                            <a href="sisSolicitarFolios.aspx">Solicitar Folio</a>
                        </li>
                        <li>
                            <a href="sis_AudFolios.aspx">Auditar Folios</a>
                        </li>
                        <li>
                            <a href="sisLiberarFolios.aspx">Liberar Folios no usados</a>
                        </li>
                        <li>
                            <a href="sis_FoliosVencidos.aspx">Folios vencidos</a>
                        </li>
                        <li>
                            <a href="sisDocumentosRechazados.aspx">Documentos Rechazados</a>
                        </li>
                        <li>
                            <a href="sisDocumentosRevision.aspx">Documentos Pendientes</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Guias">
                    <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseGuias" data-parent="#AcordeonMenu">
                        <i class="fas fa-book"></i>
                        <span class="nav-link-text">Guias</span>
                    </a>
                    <ul class="sidenav-second-level collapse" id="collapseGuias">
                        <li>
                            <a href="sisAnularGuia.aspx">Anular Guias Aceptadas SII</a>
                        </li>
                        <li>
                            <a href="sisLiberarGuias.aspx">Liberar Guias de Factura</a>
                        </li>
                        <li>
                            <a href="sisClienteDireccion.aspx">Modificar direccion documento</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Gestion">
                    <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseGestion" data-parent="#AcordeonMenu">
                        <i class="fas fa-network-wired"></i>
                        <span class="nav-link-text">Gestion</span>
                    </a>
                    <ul class="sidenav-second-level collapse" id="collapseGestion">
                        <li>
                            <a href="sis_Morosos.aspx">Morosos</a>
                        </li>
                         <li>
                            <a href="sis_CorrigeTotales.aspx">Corregir totales factura</a>
                        </li>
                         <li>
                            <a href="sisLiberarImpresion.aspx">Liberar Impresion</a>
                        </li>
                        <li>
                            <a href="sisEmpresa.aspx">Mantención de Empresas</a>
                        </li>
                        <li>
                            <a href="sisListarUsuarios.aspx">Mantención Usuarios</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="navbar-nav sidenav-toggler">
                <li class="nav-item">
                    <a class="nav-link text-center" id="sidenavToggler">
                        <i class="fa fa-fw fa-angle-left"></i>
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                        <li id="formServidores" class="form-inline my-2 my-lg-0 mr-lg-2">
            <select class="form-control" style="width:100px; font-size:11pt"  id="cmb_Servidores" runat="server" onchange="getServidores(this)">
                <option selected value="" disabled="disabled">Servidor</option>
                <option value="FepanConnectionString1">Z1</option>
                <option value="FepanConnectionString2">Z2</option>
                <option value="FepanConnectionString3">Z3</option>
            </select>

        </li>
                <!--Logout-->
                <li class="nav-item">
                    <a class="nav-link" style="color:#FF5115 !important" data-toggle="modal" data-target="#exampleModal">
                        <i class="fa fa-fw fa-sign-out" style="color:#FF5115 !important"></i>Cerrar sesión</a>
                </li>

            </ul>
        </div>
    </nav>
    <!--Navegacion fin-->
    <!--Wrapper-->

    <!--Wrapper fin-->
    <!--Footer-->
    <footer class="sticky-footer">
        <div class="container">
            <div class="text-center">
                <small>Copyright © Fepan 2018</small>
            </div>
        </div>
    </footer>
    <!--Footer fin-->
    <!--Scroll arriba-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fa fa-angle-up"></i>
    </a>
    <!--Scroll arriba fin-->
    <!-- Cerrar sesion Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Listo para salir?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Seleccione "Cerrar sesión" a continuación si está listo para cerrar su sesión actual.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-primary" href="../Login.aspx">Cerrar sesión</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Cerrar sesion fin-->

    <!-- Custom scripts for all pages-->
    <script src="../Bootstrap/js/sb-admin.min.js"></script>
</body>

</html>




