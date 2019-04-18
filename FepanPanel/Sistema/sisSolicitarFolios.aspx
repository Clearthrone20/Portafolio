<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisSolicitarFolios.aspx.vb" Inherits="FepanPanel.sisSolicitarFolios" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Solicitar Folio</title>
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
                    <li class="breadcrumb-item active">Solicitar Folio</li>
                </ol>
                        <div>
                            <div>
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                                    <Items>
                                        <dx:LayoutGroup ShowCaption="False" GroupBoxStyle-Border-BorderStyle="None" Width="100%" ColCount="3">
<GroupBoxStyle Border-BorderStyle="None"></GroupBoxStyle>
                                            <Items>
                                                <dx:LayoutItem Caption="Documentos" Width="75%" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:ASPxComboBox ID="cmb_TipoDocumento" runat="server" SelectedIndex="0" Width="100%">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Guias" Value="52" />
                                                                    <dx:ListEditItem Text="Facturas" Value="33" />
                                                                    <dx:ListEditItem Text="Notas de Credito" Value="61" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False" Width="25%" HorizontalAlign="Right">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                              <dx:BootstrapButton ID="btn_Consultar" runat="server" Text="Consultar" RenderOption="Success" Width="100%" AutoPostBack="False">
                                                                <ClientSideEvents Click="function(s, e) {grid.PerformCallback();}" />
                                                            </dx:BootstrapButton>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:ASPxGridView ID="grid_Detalle" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="sql_Solicitar_Folios" ClientInstanceName="grid" EnableRowsCache="False" KeyFieldName="Id_Empresa">
                                                                <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                                <EditFormLayoutProperties>
                                                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                                </EditFormLayoutProperties>
                                                                <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="Codigo" FieldName="Codigo" Name="Codigo" VisibleIndex="0" AdaptivePriority="1" Width="20%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Empresa" FieldName="Empresa" VisibleIndex="1" AdaptivePriority="1" Width="50%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Cantidad" VisibleIndex="2" AdaptivePriority="1" Width="10%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Solicitar" FieldName="Solicitar" VisibleIndex="4" AdaptivePriority="2" Width="10%">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Promedio" FieldName="Promedio" VisibleIndex="3" AdaptivePriority="2" Width="10%">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
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
                            </div>
                        </div>
            </div>

        </div>
        <!--DataSources-->
        <div>
            <asp:SqlDataSource ID="sql_Solicitar_Folios" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="fae_Solicitar_Folios" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Tipo_Dte" Type="Int32" />
                    <asp:Parameter DefaultValue="0" Name="Todos" Type="Int32" />
                </SelectParameters>
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



