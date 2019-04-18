<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sis_Morosos.aspx.vb" Inherits="FepanPanel.sis_Morosos" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Morosos</title>
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
                    <li class="breadcrumb-item active">Morosos</li>
                </ol>
                <!--Contenedor Pagina-->
                        <div>
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                                <Items>
                                    <dx:LayoutGroup ShowCaption="False" Width="100%" ColCount="2" GroupBoxStyle-Border-BorderStyle="None">
<GroupBoxStyle Border-BorderStyle="None"></GroupBoxStyle>
                                        <Items>
                                            <dx:EmptyLayoutItem HorizontalAlign="Left" Width="50%">
                                            </dx:EmptyLayoutItem>
                                            <dx:LayoutItem ShowCaption="False" Width="50%" HorizontalAlign="Right">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                           <div class="btn-group">
                                                        <dx:BootstrapButton ID="btn_Consultar" runat="server" Text="Consultar" Width="100%" RenderOption="Success" OnClick="btn_Consultar_Click">
                                                        </dx:BootstrapButton>
                                                                              <dx:BootstrapButton ID="btn_Morosos" runat="server" Text="Actualizar Morosos" Width="100%" RenderOption="Primary" OnClick="btn_Morosos_Click">
                                                        </dx:BootstrapButton> 
                                                           </div>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="2">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                        <br />
                                                        <dx:ASPxGridView ID="grd_Morosos" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="sql_Morosos" ClientInstanceName="grid" KeyFieldName="Id_Empresa" EnableRowsCache="False">
                                                            <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                            <EditFormLayoutProperties>
                                                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                            </EditFormLayoutProperties>
                                                            <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="Id_Empresa" Caption="Id Empresa" VisibleIndex="0" AdaptivePriority="1" Width="10%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Total" Caption="Total" VisibleIndex="1" AdaptivePriority="1" Width="10%">
                                                                    <PropertiesTextEdit DisplayFormatString="$#,###" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Cantidad" Caption="Cantidad" ShowInCustomizationForm="True" VisibleIndex="2" AdaptivePriority="1" Width="10%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Empresa" Caption="Empresa" ShowInCustomizationForm="True" VisibleIndex="3" AdaptivePriority="1" Width="60%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataCheckColumn FieldName="Bloqueado" Caption="Bloqueado" ShowInCustomizationForm="True" VisibleIndex="4" AdaptivePriority="1" SortIndex="0" SortOrder="Ascending" Width="10%">
                                                                </dx:GridViewDataCheckColumn>
                                                            </Columns>
                                                            <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                                            <Settings VerticalScrollableHeight="260" VerticalScrollBarMode="Visible" ShowFilterRow="True" />
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
                                                        <br />
                                                        <div class="alert alert-success" id="dvMensajeS" width="100%" style="display:none" runat="server" role="alert">
                                                            <a class="alert-link">
                                                                <dx:ASPxLabel CssClass="alert-link" ID="lbl_Mensaje" runat="server">
                                                                </dx:ASPxLabel>
                                                            </a>
                                                        </div>
                                                        <div class="alert alert-danger" role="alert" id="dvMensajeE" width="100%" style="display:none" runat="server">
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
                        </div>
                <!--End Contenedor Pagina-->
            </div>

        </div>
        <!--DataSources-->
        <div>
            <asp:SqlDataSource ID="sql_Morosos" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="SELECT * FROM [cob_Moroso]"></asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_ActualizaMorosos" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="cob_Actualiza_Morosos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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



