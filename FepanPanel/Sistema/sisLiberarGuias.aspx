<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisLiberarGuias.aspx.vb" Inherits="FepanPanel.sisLiberarGuias" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Liberar Guias</title>
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
                    <li class="breadcrumb-item active">Liberar Guias</li>
                </ol>
                <!--Contenedor Pagina-->
                            <div>
                                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="cbLiberar" Width="100%">
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                                                <Items>
                                                    <dx:LayoutGroup GroupBoxStyle-Border-BorderStyle="None" ShowCaption="False" Width="100%" ColCount="2">
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
                                                                        <dx:BootstrapTextBox ID="txt_Guia" runat="server">
                                                                        </dx:BootstrapTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                                              <dx:LayoutItem ShowCaption="False" Width="74%">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                        <br />
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
                                                            <dx:LayoutItem ShowCaption="False" Width="25%" HorizontalAlign="Right">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                        <div class="btn-group">
                                                                            <dx:BootstrapButton ID="btn_Consultar" runat="server" Text="Consultar" Width="100%" RenderOption="Success" OnClick="btn_Consultar_Click">
                                                                                <ClientSideEvents Click="function(s, e){  e.processOnServer = confirm('Estas seguro que deseas liberar este documento?');}" />
                                                                            </dx:BootstrapButton>
                                                                            <dx:BootstrapButton ID="btn_Cancelar" runat="server" Text="Cancelar" Enabled="false" Width="100%" RenderOption="Danger" OnClick="btn_Cancelar_Click">
                                                                            </dx:BootstrapButton>
                                                                            <dx:BootstrapButton ID="btn_Liberar" runat="server" Text="Liberar" Enabled="false" Width="100%" RenderOption="Primary" OnClick="btn_Liberar_Click">
                                                                            </dx:BootstrapButton>
                                                                        </div>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Cliente" Width="50%">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                        <dx:BootstrapTextBox ID="txt_Cliente" ReadOnly="true" runat="server">
                                                                        </dx:BootstrapTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Direccion cliente" Width="50%">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                          <dx:BootstrapTextBox ID="txt_Direccion" ReadOnly="true" runat="server">
                                                                        </dx:BootstrapTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Fecha" Width="50%">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                        <dx:BootstrapTextBox ID="txt_Fecha" ReadOnly="true" runat="server">
                                                                        </dx:BootstrapTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Total" Width="50%">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                        <dx:BootstrapTextBox ID="txt_Total" ReadOnly="true" runat="server">
                                                                        </dx:BootstrapTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Estado factura electronica" Width="50%">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                        <dx:BootstrapTextBox ID="txt_EstadoFactura" ReadOnly="true" runat="server">
                                                                        </dx:BootstrapTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:EmptyLayoutItem Width="50%">
                                                            </dx:EmptyLayoutItem>
                                                            <dx:LayoutItem ShowCaption="False" Width="50%" ColSpan="2">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                        <dx:ASPxGridView ID="grd_LiberarGuias" Width="100%" runat="server" AutoGenerateColumns="False" KeyFieldName="Numero" ClientInstanceName="grid" EnableRowsCache="False">
                                                                            <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                                            <EditFormLayoutProperties>
                                                                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                                            </EditFormLayoutProperties>
                                                                            <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                                            <Columns>
                                                                                <dx:GridViewDataTextColumn FieldName="Numero" VisibleIndex="1" Caption="Numero" AdaptivePriority="1" Width="20%">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn FieldName="Total" Caption="Total" VisibleIndex="2" AdaptivePriority="1" Width="20%">
                                                                                </dx:GridViewDataTextColumn>
                                                                            </Columns>
                                                                            <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                                                            <Settings VerticalScrollableHeight="143" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                                            <Styles>
                                                                                <Cell HorizontalAlign="Center" Wrap="true"></Cell>
                                                                                <Header HorizontalAlign="Center" BackColor="#99CCFF" Font-Bold="False" ForeColor="Black">
                                                                                </Header>
                                                                                <SelectedRow BackColor="#FFFF99">
                                                                                </SelectedRow>
                                                                                <FocusedRow BackColor="#FFFF99">
                                                                                </FocusedRow>
                                                                            </Styles>
                                                                        </dx:ASPxGridView>
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
            <asp:SqlDataSource ID="sql_LiberarGuias" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="SELECT [Numero], [Total] FROM [vta_Transaccion] WHERE ([Id_Factura] = @Id_Factura)"
                UpdateCommand="UPDATE [vta_Transaccion] SET [Estado] = 1, [Id_Factura] = NULL where [Id_Factura] = @Id_Factura">
                <SelectParameters>
                    <asp:Parameter Name="Id_Factura" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Id_Factura" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
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
        <!--End DataSources-->
    </form>
    <!--Ascx Menu-->
    <div>

        <bot:Menu runat="server" ID="Menu" />

    </div>
    <!--End Ascx Menu-->
</body>
</html>



