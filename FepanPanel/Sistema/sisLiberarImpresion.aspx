<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisLiberarImpresion.aspx.vb" Inherits="FepanPanel.sisLiberarImpresion" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Liberar Impresion</title>
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
                    <li class="breadcrumb-item active">Liberar Impresion</li>
                </ol>
                <!--Contenedor Pagina-->
                <div>
                    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="cbImprimir" Width="100%">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
                                    <Items>
                                        <dx:LayoutGroup ShowCaption="False" GroupBoxStyle-Border-BorderStyle="None" Width="100%" ColCount="2">
                                            <GroupBoxStyle Border-BorderStyle="None"></GroupBoxStyle>
                                            <Items>
                                                <dx:LayoutItem Caption="Empresa" Width="74%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:ASPxComboBox ID="cmb_Empresa" runat="server" DataSourceID="sql_Empresa" TextField="Descripcion" ValueField="Id_Empresa" Width="100%">
                                                            </dx:ASPxComboBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False" Width="25%" HorizontalAlign="Right">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <div class="btn-group">
                                                                <dx:BootstrapButton ID="btn_Consultar" runat="server" Text="Consultar" Width="100%" AutoPostBack="false" RenderOption="Primary">
                                                                    <ClientSideEvents Click="function(s, e) {cbImprimir.PerformCallback('consultar')}" />
                                                                </dx:BootstrapButton>
                                                                <dx:BootstrapButton ID="btn_Eliminar" Enabled="false" runat="server" Text="Eliminar" Width="100%" AutoPostBack="false" RenderOption="Danger">
                                                                    <ClientSideEvents Click="function(s, e) { e.processOnServer = confirm('Estas seguro que deseas eliminar las impresiones?'); cbImprimir.PerformCallback('eliminar')}" />
                                                                </dx:BootstrapButton>
                                                            </div>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:ASPxGridView ID="grd_Imprimir" Width="100%" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" EnableRowsCache="False" KeyFieldName="Id_Imprimir_PDF">
                                                                <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                                <EditFormLayoutProperties>
                                                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                                </EditFormLayoutProperties>
                                                                <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn FieldName="Id_Imprimir_PDF" Visible="false" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Id_Empresa" Caption="Empresa" VisibleIndex="1" AdaptivePriority="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataDateColumn FieldName="Usuario" Caption="Usuario" ShowInCustomizationForm="True" VisibleIndex="2" AdaptivePriority="1">
                                                                    </dx:GridViewDataDateColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Id_Documento" Caption="Id Documento" ShowInCustomizationForm="True" VisibleIndex="3" AdaptivePriority="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                                                <Settings VerticalScrollableHeight="250" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
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
                                                <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="2">
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
            <asp:SqlDataSource ID="sql_EliminarImpresion" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString3 %>" DeleteCommand="DELETE FROM [fae_Imprimir_PDF] WHERE [Id_Empresa] = @Id_Empresa">
                <DeleteParameters>
                     <asp:Parameter Name="Id_Empresa" Type="Int32" />
                </DeleteParameters>
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




