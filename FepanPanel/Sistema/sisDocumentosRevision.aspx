<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisDocumentosRevision.aspx.vb" Inherits="FepanPanel.sisDocumentosRevision" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Documentos Pedientes</title>
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
                    <li class="breadcrumb-item active">Documentos Pedientes</li>
                </ol>
                <!--Contenedor Pagina-->
                            <div>
                                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server"
                                    ClientInstanceName="cbpri" Width="100%">
                                    <ClientSideEvents EndCallback="function(s, e) {Imprimir(s)}" />
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                                                <Items>
                                                    <dx:LayoutGroup ShowCaption="False" GroupBoxStyle-Border-BorderStyle="None" Width="100%" ColCount="3">
<GroupBoxStyle Border-BorderStyle="None"></GroupBoxStyle>
                                                        <Items>
                                                            <dx:LayoutItem Caption="Estado" Width="75%" ColSpan="2">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                        <dx:ASPxComboBox ID="cmb_Estado" runat="server" SelectedIndex="0" Width="100%">
                                                                            <Items>
                                                                                <dx:ListEditItem Text="TODOS" Value="0" Selected="True" />
                                                                                <dx:ListEditItem Text="Pendientes" Value="1" />
                                                                                <dx:ListEditItem Text="Firmado" Value="2" />
                                                                                <dx:ListEditItem Text="Enviado" Value="3" />
                                                                            </Items>
                                                                        </dx:ASPxComboBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem ShowCaption="False" Width="25%" HorizontalAlign="Right">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                        <div class="btn-group">
                                                                        <dx:BootstrapButton ID="btn_Consultar" runat="server" AutoPostBack="False" Text="Consultar" Width="100%" RenderOption="Success">
                                                                            <ClientSideEvents Click="function(s, e) {
	grid.PerformCallback()
}" />
                                                                        </dx:BootstrapButton>
                                                                                                                                                <dx:BootstrapButton ID="btn_Excel" runat="server" Text="Excel" Width="100%" RenderOption="Primary">
                                                                        </dx:BootstrapButton>
                                                                            </div>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem ShowCaption="False" ColSpan="3" Width="100%">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                        <dx:ASPxGridView ID="grid_Detalle" Width="100%" runat="server" AutoGenerateColumns="False" KeyFieldName="id_documento" DataSourceID="sql_Detalle" ClientInstanceName="grid" EnableRowsCache="False">
                                                                            <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                                            <EditFormLayoutProperties>
                                                                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                                            </EditFormLayoutProperties>
                                                                            <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                                            <Columns>
                                                                                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0" AdaptivePriority="2" ShowClearFilterButton="True" Width="4%">
                                                                                </dx:GridViewCommandColumn>
                                                                                <dx:GridViewDataTextColumn Caption="Cliente" FieldName="razon_social_emisor" VisibleIndex="1" AdaptivePriority="1" Width="15%">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn Caption="ID" FieldName="id_empresa" VisibleIndex="2" AdaptivePriority="1" Width="3%">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn Caption="Tipo" FieldName="tipo_dte" VisibleIndex="3" AdaptivePriority="1"  Width="3%">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn Caption="Emisor" FieldName="rut_Emisor" VisibleIndex="4" AdaptivePriority="2" Width="7%">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn Caption="id_documento" FieldName="id_documento" VisibleIndex="5" Visible="False" AdaptivePriority="2">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn Caption="Pendiente" FieldName="pendiente" VisibleIndex="6" AdaptivePriority="2"  Width="4%">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn Caption="TrackId" FieldName="TrackId" VisibleIndex="7" AdaptivePriority="1" Width="7%">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn Caption="Emision" FieldName="Fecha" VisibleIndex="8" AdaptivePriority="1" Width="7%">
                                                                                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                                                                                    </PropertiesTextEdit>
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn FieldName="FechaCre" VisibleIndex="9" Caption="Creacion" AdaptivePriority="1"  Width="7%">
                                                                                     <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                                                                                    </PropertiesTextEdit>
                                                                                </dx:GridViewDataTextColumn>
                                                                            </Columns>
                                                                            <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                                                            <Settings VerticalScrollableHeight="335" VerticalScrollBarMode="Visible" ShowFilterRow="True" />
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
            <asp:SqlDataSource ID="sql_Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="fae_DocumentosRevision" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter DefaultValue="" Name="Estado" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div>
            <dx:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="grid_Detalle">
            </dx:ASPxGridViewExporter>
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




