<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisClienteDireccion.aspx.vb" Inherits="FepanPanel.sisClienteDireccion" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Modificar Documento</title>
    <!--Script Grilla responsive-->
    <script type="text/javascript">
        function UpdateGridHeight() {
            sampleGrid.SetHeight(0);
            var containerHeight = ASPxClientUtils.GetDocumentClientHeight();
            if (document.body.scrollHeight > containerHeight)
                containerHeight = document.body.scrollHeight;
            sampleGrid.SetHeight(containerHeight);
        }
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
                    <li class="breadcrumb-item active">Direccion documento</li>
                </ol>
                <!--Contenedor Pagina-->
                        <div id="clienteDireccion" runat="server">
                    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="cbConsultar" Width="100%">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                  <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                                <Items>
                                    <dx:LayoutGroup ShowCaption="False" GroupBoxStyle-Border-BorderStyle="None" Width="100%" ColCount="2">
<GroupBoxStyle Border-BorderStyle="None"></GroupBoxStyle>
                                       <Items>
                                                <dx:LayoutItem Caption="Empresa" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:ASPxComboBox ID="cmb_Empresa" runat="server" DataSourceID="sql_Empresa" TextField="Descripcion" ValueField="Id_Empresa" Width="100%">
                                                            </dx:ASPxComboBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                       <dx:LayoutItem Caption="Folio" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:BootstrapTextBox ID="txt_Folio" runat="server">
                                                            </dx:BootstrapTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem Width="50%">
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem ShowCaption="False" Width="50%" HorizontalAlign="Right">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                         <div class="btn-group">
                                                            <dx:BootstrapButton ID="btn_Consultar" runat="server" Text="Consultar" Width="100%" RenderOption="Success" OnClick="btn_Consultar_Click">
                                                            </dx:BootstrapButton>
                                                            <dx:BootstrapButton ID="btn_Cancelar" runat="server" Text="Cancelar" Enabled="false" Width="100%" RenderOption="Danger" OnClick="btn_Cancelar_Click">
                                                            </dx:BootstrapButton>
                                                            <dx:BootstrapButton ID="btn_CambiarDireccion" runat="server" Text="Actualizar" Enabled="false" Width="100%" RenderOption="Primary" OnClick="btn_CambiarDireccion_Click">
                                                            </dx:BootstrapButton>
                                                           </div>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem ColSpan="2" Width="100%">
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="Cliente" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:BootstrapTextBox ID="txt_Cliente" ReadOnly="true" runat="server">
                                                            </dx:BootstrapTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Direccion actual" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                               <dx:BootstrapTextBox ID="txt_Direccion" ReadOnly="true" runat="server">
                                                            </dx:BootstrapTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                             <dx:LayoutItem Caption="Nueva Direccion" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:ASPxComboBox ID="cmb_nuevaDireccion" runat="server" Enabled="false" TextField="Codigo" ValueField="Id_cliente_DIreccion" Width="100%"></dx:ASPxComboBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem Width="75%">
                                                </dx:EmptyLayoutItem>
                                                  <dx:LayoutItem ShowCaption="False" Width="25%" HorizontalAlign="Right">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                 
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                              <dx:LayoutItem  ShowCaption="False" Width="75%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <div class="alert alert-success" id="dvMensajeS" width="100%" visible="false" runat="server" role="alert">
                                                                <a class="alert-link">
                                                                    <dx:ASPxLabel CssClass="alert-link" ID="lbl_Mensaje" runat="server">
                                                                    </dx:ASPxLabel>
                                                                </a>
                                                            </div>
                                                            <div class="alert alert-danger" role="alert" id="dvMensajeE" width="100%" visible="false" runat="server">
                                                                <a class="alert-link">
                                                                    <dx:ASPxLabel CssClass="alert-link" ID="lbl_MensajeE" runat="server">
                                                                    </dx:ASPxLabel>
                                                                </a>
                                                            </div>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                    </dx:LayoutGroup>
                                </Items>
                            </dx:ASPxFormLayout>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </div>
                <!--End Contenedor Pagina-->
            </div>

        </div>
        <!--DataSources-->
        <asp:SqlDataSource ID="sql_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString2 %>" SelectCommand="SELECT [Id_Empresa], [Descripcion] FROM [sis_Empresa]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sql_DireccionTransaccion" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" UpdateCommand="UPDATE [vta_Transaccion] SET Id_Cliente_Direccion=@Id_Cliente_Direccion WHERE Id_Empresa=@Id_Empresa and Id_Tipo_Documento=@Id_Tipo_Documento and Numero=@Numero" >
            <UpdateParameters>
                <asp:Parameter Name="Id_Empresa" Type="Int32" />
                <asp:Parameter Name="Id_Tipo_Documento" Type="Int32" />
                <asp:Parameter Name="Numero" Type="Int32" />
                <asp:Parameter Name="Id_Cliente_Direccion" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <!--End DataSources-->
    </form>
    <!--Ascx Menu-->
    <div>

        <bot:Menu runat="server" ID="Menu" />

    </div>
    <!--End Ascx Menu-->
</body>
</html>




