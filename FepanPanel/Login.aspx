<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="FepanPanel.Login" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Fepan - Login</title>
  <!-- Bootstrap core CSS-->
  <link href="Bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="Bootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="Bootstrap/css/sb-admin.css" rel="stylesheet">

    <script type="text/javascript">
        function PosVenta() {
            var params = 'width=' + screen.width;
            params += ', height=' + screen.height;
            params += ', top=0, left=0'
            params += ', toolbar=0, resizable=0, titlebar=0';
            window.open("/Ventas/vtaPosVenta.aspx", "PosVenta", 'directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no, width=400, height=400');
        }
    </script>

</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Iniciar sesion</div>
      <div class="card-body">
        <form runat="server">
          <div class="form-group" >
            <label for="exampleInputEmail">Email usuario</label>
            <input class="form-control"  id="txt_Usuario" runat="server"  aria-describedby="emailHelp" placeholder="Email">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword">Contraseña</label>
            <input class="form-control" id="txt_Password" runat="server" type="password"  placeholder="Contraseña">
          </div>
          <div class="form-group">
            <div class="form-check">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox">Recordar Contraseña</label>
            </div>
          </div>
            <dx:BootstrapButton ID="btn_Aceptar" CssClasses-Button="btn btn-primary btn-block" runat="server" Text="Ingresar">
            </dx:BootstrapButton>
        </form>
        <div class="text-center">
          <a class="d-block small" href="forgot-password.html">Olvidaste tu contraseña?</a>
        </div>
              <div class="text-center">
  <dx:ASPxLabel ID="lbl_Mensaje" runat="server" ForeColor="#CC3300">
                                                </dx:ASPxLabel>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="Bootstrap/vendor/jquery/jquery.min.js"></script>
  <script src="Bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="Bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
