<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisDocumentosRechazados.aspx.vb" Inherits="FepanPanel.sisDocumentosRechazados" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Documentos Rechazados</title>
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
                    <li class="breadcrumb-item active">Documentos Rechazados</li>
                </ol>
                <!--Contenedor Pagina-->
                <div>
                    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server"
                        ClientInstanceName="cbpri" Width="100%">
                        <ClientSideEvents EndCallback="function(s, e) {Imprimir(s)}" />
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
                                    <Items>
                                        <dx:LayoutGroup ShowCaption="False" GroupBoxStyle-Border-BorderStyle="None" Width="100%" ColCount="3">
                                            <GroupBoxStyle Border-BorderStyle="None">
                                            </GroupBoxStyle>
                                            <Items>
                                                <dx:LayoutItem Caption="Observacion" Width="38%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:ASPxComboBox ID="cmb_Observacion" runat="server" DataSourceID="sql_Observacion" SelectedIndex="8" TextField="Observacion_Sii" ValueField="Observacion_Sii" Width="100%">
                                                            </dx:ASPxComboBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Empresa" Width="38%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="80%">
                                                            <dx:ASPxComboBox ID="cmb_Empresa" runat="server" DataSourceID="sql_Empresa2" SelectedIndex="0" TextField="Descripcion" ValueField="Id_Empresa" Width="100%">
                                                            </dx:ASPxComboBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False" Width="24%" HorizontalAlign="Right">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="50%">
                                                            <div class="btn-group">
<dx:BootstrapButton ID="btn_Consultar" runat="server" AutoPostBack="False" RenderOption="Success" Text="Consultar" Width="100%">
                                                                <ClientSideEvents Click="function(s, e) {
	grid.PerformCallback()
}" />
                                                            </dx:BootstrapButton>
                                                                 <dx:BootstrapButton ID="btn_Firmar" runat="server" RenderOption="Primary" Text="Firmar" Width="100%">
                                                            </dx:BootstrapButton>
</div>
                                                            
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="3">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:ASPxGridView ID="grid_Detalle" Width="100%" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" KeyFieldName="Id_Documento" EnableRowsCache="False">
                                                                <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                                <EditFormLayoutProperties>
                                                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                                </EditFormLayoutProperties>
                                                                <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0" AdaptivePriority="1" Width="4%">
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="ID Empresa" FieldName="id_empresa" VisibleIndex="8" AdaptivePriority="2" Width="10%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Tipo" FieldName="tipo_dte" VisibleIndex="1" AdaptivePriority="2" Width="4%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Folio" FieldName="folio" VisibleIndex="2" AdaptivePriority="1" Width="5%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Fecha" FieldName="fecha_emision" VisibleIndex="3" AdaptivePriority="2" Width="10%">
                                                                        <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                                                                        </PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Cliente" FieldName="razon_social_emisor" VisibleIndex="5" AdaptivePriority="1" Width="20%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Observacion" FieldName="observacion_sii" VisibleIndex="6" AdaptivePriority="2" Width="20%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Track Id" FieldName="trackid" VisibleIndex="7" AdaptivePriority="2" Width="10%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Emisor" FieldName="rut_Emisor" VisibleIndex="9" AdaptivePriority="2" Width="7%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Receptor" FieldName="rut_receptor" VisibleIndex="10" AdaptivePriority="2" Width="6%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="id_documento" FieldName="id_documento" VisibleIndex="11" Visible="False" AdaptivePriority="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Monto Total" FieldName="Monto_Total" VisibleIndex="4" AdaptivePriority="2" Width="10%">
                                                                        <PropertiesTextEdit DisplayFormatString="#,##0">
                                                                        </PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <SettingsPager Mode="ShowAllRecords" />
                                                                <Settings VerticalScrollableHeight="350" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
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
            <asp:SqlDataSource ID="sql_Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString1 %>" SelectCommand="fae_DocumentosRechazados" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter DefaultValue="TODOS" Name="Observacion" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Empresa2" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString1 %>" SelectCommand="SELECT '(TODOS)' AS Descripcion, 0 AS Id_Empresa UNION SELECT Descripcion, Id_Empresa FROM sis_Empresa"></asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Observacion" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString1 %>" SelectCommand="SELECT DISTINCT a.Observacion_Sii FROM fae_Documento AS a INNER JOIN sis_Empresa AS b ON a.Id_Empresa = b.Id_Empresa WHERE (a.Tipo_Operacion = 'VENTA') AND (a.Estado_Documento = 6) UNION SELECT 'TODOS' AS observacion_sii"></asp:SqlDataSource>
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




