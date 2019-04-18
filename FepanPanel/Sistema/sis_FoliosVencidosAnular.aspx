<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sis_FoliosVencidosAnular.aspx.vb" Inherits="FepanPanel.sis_FoliosVencidosAnular" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Folios vencidos</title>
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

                <!--Contenedor Pagina-->
                        <div>
                    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server"
                    ClientInstanceName="cbpri" Width="100%">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                                <Items>
                                    <dx:LayoutGroup ShowCaption="False" GroupBoxStyle-Border-BorderStyle="None" Width="100%" ColCount="2">
<GroupBoxStyle Border-BorderStyle="None"></GroupBoxStyle>
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False" Width="50%">
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
                                            <dx:LayoutItem ShowCaption="False" Width="50%" HorizontalAlign="Right">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                        <dx:ASPxButton ID="btn_Anular" runat="server" Text="Anular" Width="100%" RenderOption="Success" OnClick="btn_Anular_Click">
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                                      <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="2">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                        <dx:ASPxGridView ID="grd_FoliosVencidos" Width="100%" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" EnableRowsCache="False" KeyFieldName="id_secuencia_numerica">
                                                            <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                            <EditFormLayoutProperties>
                                                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                            </EditFormLayoutProperties>
                                                            <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="Id_Empresa" Caption="Empresa" VisibleIndex="0" AdaptivePriority="1" Width="7%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Tipo_Dte" Caption="Tipo Dte" VisibleIndex="1" AdaptivePriority="1" Width="5%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="Folio_Inicial" Caption="Folio Inicial" VisibleIndex="2" AdaptivePriority="1" Width="7%">
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataDateColumn FieldName="Folio_Final" Caption="Folio Final" VisibleIndex="3" AdaptivePriority="1" Width="7%">
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Secuencia" Caption="Secuencia" VisibleIndex="4" AdaptivePriority="1" Width="5%">
                                                                </dx:GridViewDataTextColumn>
                                                                 <dx:GridViewDataTextColumn FieldName="id_secuencia_numerica" Caption="Id" VisibleIndex="5" AdaptivePriority="1" Width="8%">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                                            <Settings VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
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
        <!--DataSources-->
        <div>
            <asp:SqlDataSource ID="sql_FoliosVencidos" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString3 %>" UpdateCommand="UPDATE sis_Secuencia_Numerica SET Estado = 3 WHERE (Id_Secuencia_Numerica = @Id_Secuencia_Numerica)">
                <UpdateParameters>
                    <asp:Parameter Name="Id_Secuencia_Numerica" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <!--End DataSources-->
    </form>
</body>
</html>




