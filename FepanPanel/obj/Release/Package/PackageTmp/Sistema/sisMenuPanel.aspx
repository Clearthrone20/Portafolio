<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisMenuPanel.aspx.vb" Inherits="FepanPanel.sisMenuPanel" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2">
            <Items>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxNavBar ID="ASPxNavBar1" runat="server">
                                <Groups>
                                    <dx:NavBarGroup>
                                        <Items>
                                            <dx:NavBarItem NavigateUrl="sisSolicitarFolios.aspx" Text="Solicitar Folio">
                                            </dx:NavBarItem>
                                            <dx:NavBarItem NavigateUrl="~/Sistema/sisDocumentosRechazados.aspx" Text="Documentos Rechazados">
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="Documentos Revision" NavigateUrl="~/Sistema/sisDocumentosRevision.aspx" Text="Documentos Pendientes">
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="sisPrograma" NavigateUrl="~/Sistema/sisPrograma.aspx" Text="Programas del Sistema">
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="Panel de Soporte" NavigateUrl="~/Sistema/sis_ListarSoporte.aspx" Text="Panel de Soporte">
                                            </dx:NavBarItem>
                                            <dx:NavBarItem Name="Panel Empresas" NavigateUrl="~/Sistema/sisEmpresa.aspx" Text="Panel Empresas">
                                            </dx:NavBarItem>
                                            <dx:NavBarItem NavigateUrl="~/Ventas/vtaImportarMinuta.aspx" Text="Minuta Colegios">
                                            </dx:NavBarItem>
                                            <dx:NavBarItem NavigateUrl="~/Sistema/fae_LibroCompraVentaRevision.aspx" Text="Revision Libros">
                                            </dx:NavBarItem>
                                            <dx:NavBarItem NavigateUrl="~/Sistema/sisDocumentosRevisionXML.aspx" Text="Revision Documentos XML">
                                            </dx:NavBarItem>
                                            <dx:NavBarItem NavigateUrl="~/Sistema/sisListarUsuarios.aspx" Text="Panel Usuarios">
                                            </dx:NavBarItem>
                                        </Items>
                                    </dx:NavBarGroup>
                                </Groups>
                            </dx:ASPxNavBar>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:ASPxFormLayout>
    </div>
    </form>
</body>
</html>
