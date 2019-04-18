<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="fae_DocumentosRechazados.aspx.vb" Inherits="FepanPanel.fae_DocumentosRechazados" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Documentos Rechazados</title>
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
                    <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
                        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
                        <Items>
                            <dx:LayoutGroup ShowCaption="False" GroupBoxStyle-Border-BorderStyle="None" ColCount="2">
                                <GroupBoxStyle Border-BorderStyle="None"></GroupBoxStyle>
                                <Items>
                                    <dx:LayoutItem Caption="Empresa" Width="50%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="cmb_Empresa" runat="server" AutoPostBack="false" Height="21px" TextField="Descripcion" ValueField="Id_Empresa" Width="100%" DataSourceID="sql_Empresas">
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False" Width="50%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                <dx:BootstrapButton ID="btn_Consultar" runat="server" Width="100%" Text="Consultar" OnClick="btn_Consultar_Click1" RenderOption="Primary">
                                                </dx:BootstrapButton>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False" Width="100%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                <dx:ASPxGridView ID="grd_DocumentosRechazados" Width="100%" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" KeyFieldName="id_documento" DataSourceID="sql_DocumentosRechazados" EnableRowsCache="False">
                                                    <Settings ShowFilterRow="True" />
                                                    <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                    <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                    <EditFormLayoutProperties>
                                                        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                                                    </EditFormLayoutProperties>
                                                    <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="razon_social_emisor" VisibleIndex="1" Caption="Razon social" AdaptivePriority="1">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="folio" VisibleIndex="2" Caption="Folio" AdaptivePriority="1">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Estado_Documento" VisibleIndex="3" Caption="Estado del documento" AdaptivePriority="2">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="id_empresa" VisibleIndex="4" Caption="ID empresa" AdaptivePriority="2">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="tipo_dte" VisibleIndex="5" Caption="Tipo DTE" AdaptivePriority="1">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Fecha_Creacion" VisibleIndex="6" Caption="Fecha de Creacion" AdaptivePriority="1">
                                                            <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataDateColumn FieldName="fecha_emision" VisibleIndex="7" Caption="Fecha emision" AdaptivePriority="1">
                                                            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataTextColumn FieldName="observacion_sii" VisibleIndex="8" Caption="Observacion SII" AdaptivePriority="2">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="trackid" VisibleIndex="9" Caption="TrackID" AdaptivePriority="2">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="rut_Emisor" VisibleIndex="10" Caption="Rut emisor" AdaptivePriority="2">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="rut_receptor" VisibleIndex="11" Caption="Rut receptor" AdaptivePriority="2">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                                    <Settings VerticalScrollableHeight="350" ColumnMinWidth="5" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                    <Styles>
                                                        <Cell Wrap="True"></Cell>
                                                        <Header BackColor="#99CCFF" Font-Bold="False" ForeColor="Black">
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
                </div>
                <!--End Contenedor Pagina-->
            </div>
        </div>
        <!--DataSources-->
        <div>
            <asp:SqlDataSource ID="sql_DocumentosRechazados" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="fae_DocumentosRechazados" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter Name="Observacion" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Empresas" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="Select 'TODAS' as [Descripcion],0 as [Id_Empresa] union 
SELECT [Descripcion], [Id_Empresa] FROM [sis_Empresa]
"></asp:SqlDataSource>
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
