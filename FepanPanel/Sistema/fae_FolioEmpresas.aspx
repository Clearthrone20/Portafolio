<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="fae_FolioEmpresas.aspx.vb" Inherits="FepanPanel.fae_FolioEmpresas" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Folios Empresas</title>
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
                    <li class="breadcrumb-item active">Folios Empresas</li>
                </ol>
                <!--Contenedor Pagina-->
                <asp:ScriptManager ID="ScriptManagerContenedorPagina" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanelContenedorPagina" runat="server">
                    <ContentTemplate>
                        <div>
                            <div>
                                <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
                                    <Items>
                                        <dx:LayoutGroup ShowCaption="False" Width="100%" ColCount="2" GroupBoxStyle-Border-BorderStyle="None">
                                            <Items>
                                                <dx:LayoutItem ShowCaption="True" Caption="Cantidad" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:BootstrapTextBox ID="txt_Cantidad" runat="server" Text="50" HelpText="Cantidad de registros a visualizar">
                                                            </dx:BootstrapTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False" Width="50%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:BootstrapButton ID="btn_Consultar" runat="server" AutoPostBack="False" Width="100%" Text="Consultar" RenderOption="Primary">
                                                                <ClientSideEvents Click="function(s, e) {
	grid.PerformCallback();
}" />
                                                            </dx:BootstrapButton>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:ASPxGridView ID="grd_fae_FolioEmpresas" Width="100%" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="sql_fae_FolioEmpresas" EnableRowsCache="False">
                                                                <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                                <EditFormLayoutProperties>
                                                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                                </EditFormLayoutProperties>
                                                                <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn FieldName="Codigo" VisibleIndex="1" Caption="Codigo" AdaptivePriority="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Documento" Caption="Documento" VisibleIndex="2" AdaptivePriority="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Empresa" VisibleIndex="3" Caption="Empresa" AdaptivePriority="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Cantidad" ReadOnly="True" Caption="Cantidad" VisibleIndex="4" AdaptivePriority="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                                                <Settings VerticalScrollableHeight="350" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
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
                            <div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!--End Contenedor Pagina-->
            </div>
        </div>
        <!--DataSources-->
        <div>
            <asp:SqlDataSource ID="sql_fae_FolioEmpresas" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="fae_Folios_Empresa" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Cantidad" Type="Int32" />
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



