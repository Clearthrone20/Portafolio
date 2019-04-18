<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisMenuPanel.aspx.vb" Inherits="FepanPanel.sisMenuPanel" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Inicio</title>
    </script>
    <!--End Script Grilla responsive-->
</head>

<body>

    <form id="form1" runat="server">

        <div class="content-wrapper">
            <div class="container-fluid">
                <br />
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="sisMenuPanelB.aspx">Inicio</a>
                    </li>
                    <li class="breadcrumb-item active">Mi inicio</li>
                </ol>
                <!--Contenedor Pagina-->
                <asp:ScriptManager ID="ScriptManagerContenedorPagina" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanelContenedorPagina" runat="server">
                    <ContentTemplate>
                        <div>

                        </div>
           </ContentTemplate>
                </asp:UpdatePanel>
                <!--End Contenedor Pagina-->
            </div>

        </div>
        <!--DataSources-->

        <!--End DataSources-->
            <!--Ascx Menu-->
    <div>

        <bot:Menu runat="server" ID="Menu" />

    </div>
                 
    <!--End Ascx Menu-->
    </form>

</body>
</html>



