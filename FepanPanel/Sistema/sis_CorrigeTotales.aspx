<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sis_CorrigeTotales.aspx.vb" Inherits="FepanPanel.sis_CorrigeTotales" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Corregir Documento</title>
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
    <script type="text/javascript">
        ASPxClientControl.GetControlCollection().ControlsInitialized.AddHandler(function (s, e) {
            UpdateGridHeight();
        });
        ASPxClientControl.GetControlCollection().BrowserWindowResized.AddHandler(function (s, e) {
            UpdateGridHeight();
        });
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
                    <li class="breadcrumb-item active">Corregir totales</li>
                </ol>
                <!--Contenedor Pagina-->
                <div>
                    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="cbConsultar" Width="100%">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
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
                                                <dx:LayoutItem Caption="Factura" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:BootstrapTextBox ID="txt_Factura" runat="server">
                                                            </dx:BootstrapTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False" Width="100%" HorizontalAlign="Right" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <div class="btn-group">
                                                                <dx:BootstrapButton ID="btn_Consultar" runat="server" Text="Consultar" Width="100%" RenderOption="Success" OnClick="btn_Consultar_Click">
                                                                </dx:BootstrapButton>
                                                                <dx:BootstrapButton ID="btn_Cancelar" runat="server" Text="Cancelar" Enabled="false" Width="100%" RenderOption="Danger" OnClick="btn_Cancelar_Click">
                                                                </dx:BootstrapButton>
                                                                <dx:BootstrapButton ID="btn_Grabar" runat="server" Text="Grabar" Enabled="false" Width="100%" RenderOption="Primary" OnClick="btn_Grabar_Click">
                                                                    <ClientSideEvents Click="function(s, e){  e.processOnServer = confirm('Estas seguro que deseas modificar esta factura?');}" />
                                                                </dx:BootstrapButton>
                                                            </div>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem Width="100%">
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="Cliente" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:BootstrapTextBox ID="txt_Cliente" ReadOnly="true" runat="server">
                                                            </dx:BootstrapTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Afecto" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:BootstrapTextBox Enabled="false" ID="txt_Afecto" runat="server" DisplayFormatString="#,##0">
                                                            </dx:BootstrapTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="IVA" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:BootstrapTextBox Enabled="false" ID="txt_Iva" runat="server" DisplayFormatString="#,##0">
                                                            </dx:BootstrapTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Total" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:BootstrapTextBox ID="txt_Total" Enabled="false" runat="server" DisplayFormatString="#,##0">
                                                            </dx:BootstrapTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False" Width="75%">
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
        <div>
            <asp:SqlDataSource ID="sql_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString2 %>" SelectCommand="SELECT [Id_Empresa], [Descripcion] FROM [sis_Empresa]"></asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_audDocumento" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" InsertCommand="INSERT INTO aud_Documento(Id_Empresa, Usuario, Tipo_dte, Folio, Fecha_Emision, Rut_Receptor, Razon_Social_Receptor, Monto_Total, Fecha_Eliminacion, Motivo) VALUES (@Id_Empresa, @Usuario, @Tipo_dte, @Folio, @Fecha_Emision, @Rut_Receptor, @Razon_Social_Receptor, @Monto_Total, @Fecha_Eliminacion, @Motivo)">
                <InsertParameters>
                    <asp:Parameter Name="Id_Empresa" />
                    <asp:Parameter Name="Usuario" />
                    <asp:Parameter Name="Tipo_dte" />
                    <asp:Parameter Name="Folio" />
                    <asp:Parameter Name="Fecha_Emision" />
                    <asp:Parameter Name="Rut_Receptor" />
                    <asp:Parameter Name="Razon_Social_Receptor" />
                    <asp:Parameter Name="Monto_Total" />
                    <asp:Parameter Name="Fecha_Eliminacion" />
                    <asp:Parameter Name="Motivo" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Transaccion" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>"
                UpdateCommand="UPDATE vta_Transaccion SET Afecto = @Afecto, Impuesto = @Impuesto, Total = @Total, Saldo = @Total WHERE (Id_Empresa = @Id_Empresa) AND (Id_Tipo_Documento = @Id_Tipo_Documento) AND (Numero = @Numero)">
                <UpdateParameters>
                    <asp:Parameter Name="Afecto" Type="Int32" />
                    <asp:Parameter Name="Impuesto" Type="Int32" />
                    <asp:Parameter Name="Total" Type="Int32" />
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter Name="Id_Tipo_Documento" Type="Int32" />
                    <asp:Parameter Name="Numero" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Documento" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>"
                UpdateCommand="UPDATE fae_Documento SET Monto_Afecto = @Monto_Afecto, Monto_Iva = @Monto_Iva, Monto_Total = @Monto_Total, Total_Pago = @Monto_Total, Estado_Documento = 1 WHERE (Id_Empresa = @Id_Empresa) AND (Tipo_Dte = 33) AND (Folio = @Folio)">
                <UpdateParameters>
                    <asp:Parameter Name="Monto_Afecto" Type="Int32" />
                    <asp:Parameter Name="Monto_Iva" Type="Int32" />
                    <asp:Parameter Name="Monto_Total" Type="Int32" />
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter Name="Folio" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <!--End DataSources-->
    </form>
    <!--Ascx Menu-->
    <div>

        <bot:Menu runat="server" ID="Menu" />

    </div>
    <!--End Ascx Menu-->
</body>
</html>



