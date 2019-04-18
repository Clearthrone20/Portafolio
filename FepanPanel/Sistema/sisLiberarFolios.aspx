<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisLiberarFolios.aspx.vb" Inherits="FepanPanel.sisLiberarFolios" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Liberar Folio</title>
</head>
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
<body>

    <form id="form1" runat="server">

        <div class="content-wrapper">
            <div class="container-fluid">
                <br />
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="sisMenuPanelB.aspx">Inicio</a>
                    </li>
                    <li class="breadcrumb-item active">Liberar Folio</li>
                </ol>
                <!--Contenedor Pagina-->
                <div id="clienteDireccion" runat="server">
                    <div class="container">
                        <div class="row">
                        <div class="col">
                            <label for="cmb_Empresa">Empresa</label>
                            <dx:ASPxComboBox ID="cmb_Empresa" runat="server" CssClass="form-control" DataSourceID="sql_Empresa" TextField="Descripcion" ValueField="Id_Empresa" Width="100%">
                            </dx:ASPxComboBox>
                        </div>
                        <div class="col">
                            <label for="cmb_tipoDte">Documento</label>
                            <dx:ASPxComboBox ID="cmb_tipoDte" CssClass="form-control"  runat="server" Width="100%" SelectedIndex="0">
                                <Items>
                                    <dx:ListEditItem Selected="true" Text="Factura" Value="33"></dx:ListEditItem>
                                    <dx:ListEditItem Text="Guia" Value="52"></dx:ListEditItem>
                                    <dx:ListEditItem Text="Notas de credito" Value="61"></dx:ListEditItem>
                                </Items>
                            </dx:ASPxComboBox>
                        </div>
                            </div>
                        <div class="form-group">
                            <label for="txt_Fecha">Fecha</label>
                            <dx:ASPxDateEdit ID="txt_Fecha" runat="server" EditFormat="Custom" Width="50%">
                                <TimeSectionProperties>
                                    <TimeEditProperties EditFormatString="hh:mm tt" />
                                </TimeSectionProperties>
                            </dx:ASPxDateEdit>
                        </div>
                        <div class="form-group" style="display:inline;">
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
                        </div>
                        <div class="form-group" style="float: right;">
                            <dx:BootstrapButton ID="btn_Consultar" runat="server" Text="Liberar folios" Width="100%" RenderOption="Success" OnClick="btn_Consultar_Click">
                                 <ClientSideEvents Click="function(s, e){  e.processOnServer = confirm('Estas seguro que deseas liberar los folios?');}" />
                            </dx:BootstrapButton>
                        </div>
                        <div class="form-group">
                            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server"
                                ClientInstanceName="cbpri" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
                                            <Items>
                                                <dx:LayoutGroup ShowCaption="False" GroupBoxStyle-Border-BorderStyle="None" Width="100%" ColCount="3">
                                                    <GroupBoxStyle Border-BorderStyle="None">
                                                    </GroupBoxStyle>
                                                    <Items>
                                                        <dx:LayoutItem ShowCaption="False" Width="50%" ColSpan="3">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                                    <dx:ASPxGridView ID="grd_FoliosLiberados" Width="100%" runat="server" AutoGenerateColumns="false" ClientInstanceName="grid" KeyFieldName="Id_Documento" EnableRowsCache="False">
                                                                        <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                                        <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                                        <EditFormLayoutProperties>
                                                                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                                        </EditFormLayoutProperties>
                                                                        <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="secuencia" Caption="Secuencia" ShowInCustomizationForm="True" VisibleIndex="1" AdaptivePriority="1" Width="20%">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <SettingsPager Mode="ShowAllRecords" />
                                                                        <Settings VerticalScrollableHeight="116" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
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
                    </div>
                </div>

                <!--End Contenedor Pagina-->
            </div>

        </div>
        <!--DataSources-->
        <asp:SqlDataSource ID="sql_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString2 %>" SelectCommand="SELECT [Id_Empresa], [Descripcion] FROM [sis_Empresa]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sql_LiberarFolios" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="sis_Diferencia_Secuencia" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="Tipo_Dte" Type="Int32" />
                <asp:Parameter Name="Actualizar" Type="Int32" />
                <asp:Parameter Name="Fecha" Type="String" />
                <asp:Parameter Name="Id_Empresa2" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <!--End DataSources-->
    </form>
    <!--Ascx Menu-->
    <div>
        <bot:Menu runat="server" ID="Menu" />
    </div>
    <!--End Ascx Menu-->
</body>
</html>




