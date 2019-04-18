<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sis_AudFolios.aspx.vb" Inherits="FepanPanel.sis_AudFolios" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Auditar folios</title>
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
                    <li class="breadcrumb-item active">Auditar Folios</li>
                </ol>
                <!--Contenedor Pagina-->
                        <div>
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
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
                                            <dx:LayoutItem Caption="Folio" Width="50%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                        <dx:BootstrapTextBox ID="txt_Folio" runat="server">
                                                        </dx:BootstrapTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Documento electrónico" Width="50%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:ASPxComboBox ID="cmb_tipoDte" runat="server" TextField="Descripcion" Width="100%">
                                                                    <Items>
                                                                    <dx:ListEditItem Selected="true" Text="Factura" Value="33"></dx:ListEditItem>
                                                                    <dx:ListEditItem Text="Guia" Value="52"></dx:ListEditItem>
                                                                    <dx:ListEditItem Text="Notas de credito" Value="61"></dx:ListEditItem>
                                                                    </Items>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:EmptyLayoutItem Width="50%">
                                            </dx:EmptyLayoutItem>
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
                                                         <div class="btn-group">
                                                        <dx:BootstrapButton ID="btn_Consultar" runat="server" Text="Consultar" Width="100%" RenderOption="Success" OnClick="btn_Consultar_Click">
                                                        </dx:BootstrapButton>
                                                        <dx:BootstrapButton ID="btn_Excel" runat="server" Text="Excel" Width="100%" RenderOption="Info" OnClick="btn_Excel_Click">
                                                        </dx:BootstrapButton>
                                                             </div>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                                    <dx:LayoutItem Visible="false" Name="txtCliente" Caption="Cliente" Width="50%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                        <dx:BootstrapTextBox ID="txt_Receptor" runat="server">
                                                        </dx:BootstrapTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                                    <dx:LayoutItem Visible="false" Name="txtTotal" Caption="Total" Width="50%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                        <dx:BootstrapTextBox ID="txt_Total" runat="server"  DisplayFormatString="$#,###">
                                                        </dx:BootstrapTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                                      <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="2">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                        <dx:ASPxGridView ID="grd_AudFolios" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="sql_AudFolios" ClientInstanceName="grid" EnableRowsCache="False" KeyFieldName="Folio">
                                                            <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                            <EditFormLayoutProperties>
                                                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                            </EditFormLayoutProperties>
                                                            <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="Usuario" Caption="Usuarios" VisibleIndex="0" AdaptivePriority="1" Width="10%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Folio" Caption="Folio" VisibleIndex="1" AdaptivePriority="1" Width="5%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="Fecha_Emision" Caption="Emision" ShowInCustomizationForm="True" VisibleIndex="2" AdaptivePriority="1" Width="7%">
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataDateColumn FieldName="Fecha_Eliminacion" Caption="Eliminacion" ShowInCustomizationForm="True" VisibleIndex="3" AdaptivePriority="1" Width="7%">
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Rut_Receptor" Caption="Rut receptor" ShowInCustomizationForm="True" VisibleIndex="4" AdaptivePriority="1" Width="8%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Razon_Social_Receptor" Caption="Razon social receptor" ShowInCustomizationForm="True" VisibleIndex="5" AdaptivePriority="1" Width="20%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Monto_Total" Caption="Monto total" ShowInCustomizationForm="True" VisibleIndex="6" AdaptivePriority="1" Width="10%">
                                                                <PropertiesTextEdit DisplayFormatString="$#,###" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Motivo" Caption="Motivo" ShowInCustomizationForm="True" VisibleIndex="7" AdaptivePriority="1" Width="10%">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                                            <Settings VerticalScrollableHeight="200" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
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
                <!--End Contenedor Pagina-->
            </div>

        </div>
        <!--DataSources-->
            <div>
            <asp:SqlDataSource ID="sql_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString2 %>" SelectCommand="SELECT [Id_Empresa], [Descripcion] FROM [sis_Empresa]"></asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_AudFolios" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="SELECT [Usuario], [Folio], [Fecha_Emision], [Rut_Receptor], [Razon_Social_Receptor], [Monto_Total], [Fecha_Eliminacion],[Motivo] FROM [aud_Documento] WHERE (([Id_Empresa] = @Id_Empresa) AND ([Tipo_dte] = @Tipo_dte) AND ([Folio] = @Folio))">
                <SelectParameters>
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter Name="Tipo_dte" Type="Int32" />
                    <asp:Parameter Name="Folio" Type="Int32" />
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




