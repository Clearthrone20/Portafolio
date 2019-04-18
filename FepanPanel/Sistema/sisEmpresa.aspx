<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisEmpresa.aspx.vb" Inherits="FepanPanel.sisEmpresa" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Empresa</title>
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
    <script type="text/javascript">
        var visibleIndex, Id;
        visibleIndex = 0;
        Id = 0;
        function Menu(e) {
            switch (e.item.name) {
                case 'Nuevo':
                    popupIngresar.Show();
                    break;
                case 'Empresa':
                    var values = grid.GetRowValues(visibleIndex, 'Id_Empresa;Descripcion', Empresa);
                    break;
                case 'Direccion':
                    var values = grid.GetRowValues(visibleIndex, 'Id_Empresa;Descripcion', Direccion);
                    break;
                case 'Resolucion':
                    var values = grid.GetRowValues(visibleIndex, 'Id_Empresa;Descripcion', Resolucion);
                    break;
            }
        }
        function Actualizar() {
            grid.PerformCallback();
        }
        function ModEmpresa(s) {
            s.SetContentUrl('Empresa/sisEmpresaMod.aspx?Id_Empresa=' + Id);
            s.RefreshContentUrl();
        }
        function ModDireccion(s) {
            s.SetContentUrl('Empresa/sisEmpresaModDir.aspx?Id_Empresa=' + Id);
            s.RefreshContentUrl();
        }
        function ModResolucion(s) {
            s.SetContentUrl('Empresa/sisEmpresaModRes.aspx?Id_Empresa=' + Id);
            s.RefreshContentUrl();
        }
        function Empresa(values) {
            Id = values[0];
            popupEmpresa.Show();
        }
        function Direccion(values) {
            Id = values[0];
            popupDireccion.Show();
        }
        function Resolucion(values) {
            Id = values[0];
            popupResolucion.Show();
        }

    </script>
</head>

<body>

    <form id="form1" runat="server">

        <div class="content-wrapper">
            <div class="container-fluid">
                <!--Contenedor Pagina-->
                <dx:ASPxRibbon ID="ASPxRibbon1" runat="server"
                    EnableTheming="True" ShowFileTab="False" ShowGroupLabels="False">
                    <Tabs>
                        <dx:RibbonTab Text="EMPRESA" Name="rib_Empresa">
                            <Groups>
                                <dx:RibbonGroup Name="rbng_Nuevo" runat="server">
                                    <Items>
                                        <dx:RibbonButtonItem Name="Nuevo" Size="Large" Text="Nuevo" >
                                            <LargeImage IconID="actions_additem_32x32">
                                            </LargeImage>
                                        </dx:RibbonButtonItem>
                                    </Items>
                                </dx:RibbonGroup>
                                <dx:RibbonGroup>
                                    <Items>
                                        <dx:RibbonButtonItem Name="Empresa" Size="Large" Text="Modificar Empresa">
                                            <LargeImage IconID="businessobjects_boresume_32x32">
                                            </LargeImage>
                                        </dx:RibbonButtonItem>
                                        <dx:RibbonButtonItem Name="Direccion" Size="Large" Text="Modificar Dirección">
                                            <LargeImage IconID="businessobjects_bolocalization_32x32">
                                            </LargeImage>
                                        </dx:RibbonButtonItem>
                                        <dx:RibbonButtonItem Name="Resolucion" Size="Large" Text="Modificar Resolución">
                                            <LargeImage IconID="businessobjects_boreport2_32x32">
                                            </LargeImage>
                                        </dx:RibbonButtonItem>
                                    </Items>
                                </dx:RibbonGroup>
                            </Groups>
                        </dx:RibbonTab>
                    </Tabs>
                    <ClientSideEvents CommandExecuted="function(s, e) {Menu(e);}" />
                </dx:ASPxRibbon>
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server"
                    ClientInstanceName="cbpri" Width="100%">
                    <ClientSideEvents EndCallback="function(s, e) {Imprimir(s)}" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
                                <Items>
                                    <dx:LayoutGroup ShowCaption="False" Width="100%" GroupBoxStyle-Border-BorderStyle="None">
                                        <GroupBoxStyle Border-BorderStyle="None">
                                        </GroupBoxStyle>
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer Width="100%" runat="server">
                                                        <dx:ASPxGridView ID="grd_Empresa" Width="100%" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="sql_Empresa" EnableRowsCache="False" KeyFieldName="Id_Empresa" SettingsBehavior-AllowFocusedRow="False" SettingsBehavior-ProcessFocusedRowChangedOnServer="False">
                                                            <Settings ShowFilterRow="True" />
                                                            <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                            <EditFormLayoutProperties>
                                                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                            </EditFormLayoutProperties>
                                                            <SettingsEditing EditFormColumnCount="1" Mode="EditForm"></SettingsEditing>
                                                            <ClientSideEvents RowClick="function(s, e) {visibleIndex = e.visibleIndex;}" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Empresa" FieldName="Descripcion" VisibleIndex="1" AdaptivePriority="1" AllowTextTruncationInAdaptiveMode="True" Width="20%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Actividad" FieldName="Codigo_Actividad" VisibleIndex="2" AdaptivePriority="1" Width="7%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Codigo" FieldName="Codigo" VisibleIndex="3" AdaptivePriority="2" Width="10%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Giro" FieldName="Giro" VisibleIndex="4" AdaptivePriority="2" AllowTextTruncationInAdaptiveMode="True">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Resolucion" FieldName="Fecha_Resolucion" VisibleIndex="5" AdaptivePriority="2" Width="9%">
                                                                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Direccion" FieldName="Direccion" VisibleIndex="6" AdaptivePriority="2" AllowTextTruncationInAdaptiveMode="True">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Comuna" FieldName="Comuna" VisibleIndex="7" AdaptivePriority="2" Width="12%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Ciudad" FieldName="Ciudad" VisibleIndex="8" AdaptivePriority="2">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Resolucion" FieldName="Numero_Resolucion" VisibleIndex="9" AdaptivePriority="2" Width="8%">
                                                                </dx:GridViewDataTextColumn>
                                                                   <dx:GridViewDataTextColumn Visible="false" FieldName="Id_Empresa" VisibleIndex="10">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                                            <Settings VerticalScrollableHeight="350" VerticalScrollBarMode="Visible" ShowFilterRow="True" />
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
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </div>
            <!--End Contenedor Pagina-->
            <dx:ASPxPopupControl ID="popupIngresar" runat="server" AllowDragging="True"
                ClientInstanceName="popupIngresar" HeaderText="Ingresar Empresa"
                Width="850px" PopupHorizontalAlign="WindowCenter"
                PopupVerticalAlign="WindowCenter" Modal="True" ContentUrl="~/Sistema/Empresa/sisEmpresaNuevo.aspx" Height="575px">
                 <ClientSideEvents CloseUp="function(s, e) {Actualizar()}"/>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
            <dx:ASPxPopupControl ID="popupEmpresa" runat="server" AllowDragging="True"
                ClientInstanceName="popupEmpresa" HeaderText="Empresa"
                Width="850px" PopupHorizontalAlign="WindowCenter"
                PopupVerticalAlign="WindowCenter" Modal="True" ContentUrl="~/Sistema/Empresa/sisEmpresaMod.aspx?Id_Empresa=0" Height="300px" >
                <ClientSideEvents CloseUp="function(s, e) {Actualizar()}" Shown="function(s, e) {ModEmpresa(s)}"/>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
              <dx:ASPxPopupControl ID="popupDireccion" runat="server" AllowDragging="True"
                ClientInstanceName="popupDireccion" HeaderText="Dirección Empresa"
                Width="850px" PopupHorizontalAlign="WindowCenter"
                PopupVerticalAlign="WindowCenter" Modal="True" ContentUrl="~/Sistema/Empresa/sisEmpresaModDir.aspx?Id_Empresa=0" Height="300px">
                  <ClientSideEvents CloseUp="function(s, e) {Actualizar()}" Shown="function(s, e) {ModDireccion(s)}"/>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
            <dx:ASPxPopupControl ID="popupResolucion" runat="server" AllowDragging="True"
                ClientInstanceName="popupResolucion" HeaderText="Resolución"
                Width="850px" PopupHorizontalAlign="WindowCenter"
                PopupVerticalAlign="WindowCenter" Modal="True" ContentUrl="~/Sistema/Empresa/sisEmpresaModRes.aspx?Id_Empresa=0" Height="300px">
                <ClientSideEvents CloseUp="function(s, e) {Actualizar()}" Shown="function(s, e) {ModResolucion(s)}"/>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
        <!--DataSources-->
        <div>
            <asp:SqlDataSource ID="sql_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="SELECT * FROM [sis_Empresa]" DeleteCommand="DELETE FROM [sis_Empresa] WHERE [id] = @id" InsertCommand="INSERT INTO [sis_Empresa] ([Id_Empresa], [Codigo], [Descripcion], [Codigo_Actividad], [Giro], [Numero_Resolucion], [Fecha_Resolucion], [Rut_Firma], [KeyCertificado], [Id_Direccion], [Telefono], [Contrato], [Path_Fe], [Direccion], [Comuna], [Ciudad], [dte_Compras], [Correo_Intercambio], [Password_Intercambio], [Giro_SII], [Unidad_SII]) VALUES (@Id_Empresa, @Codigo, @Descripcion, @Codigo_Actividad, @Giro, @Numero_Resolucion, @Fecha_Resolucion, @Rut_Firma, @KeyCertificado, @Id_Direccion, @Telefono, @Contrato, @Path_Fe, @Direccion, @Comuna, @Ciudad, @dte_Compras, @Correo_Intercambio, @Password_Intercambio, @Giro_SII, @Unidad_SII)" UpdateCommand="UPDATE [sis_Empresa] SET [Codigo] = @Codigo, [Descripcion] = @Descripcion, [Direccion] = @Direccion WHERE [Id_Empresa] = @Id_Empresa">
                <InsertParameters>
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter Name="Codigo" Type="String" />
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="Codigo_Actividad" Type="String" />
                    <asp:Parameter Name="Giro" Type="String" />
                    <asp:Parameter Name="Numero_Resolucion" Type="Int32" />
                    <asp:Parameter Name="Fecha_Resolucion" Type="DateTime" />
                    <asp:Parameter Name="Rut_Firma" Type="String" />
                    <asp:Parameter Name="KeyCertificado" Type="String" />
                    <asp:Parameter Name="Id_Direccion" Type="Int32" />
                    <asp:Parameter Name="Telefono" Type="String" />
                    <asp:Parameter Name="Contrato" Type="Int32" />
                    <asp:Parameter Name="Path_Fe" Type="String" />
                    <asp:Parameter Name="Direccion" Type="String" />
                    <asp:Parameter Name="Comuna" Type="String" />
                    <asp:Parameter Name="Ciudad" Type="String" />
                    <asp:Parameter Name="dte_Compras" Type="String" />
                    <asp:Parameter Name="Correo_Intercambio" Type="String" />
                    <asp:Parameter Name="Password_Intercambio" Type="String" />
                    <asp:Parameter Name="Giro_SII" Type="String" />
                    <asp:Parameter Name="Unidad_SII" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter Name="Codigo" Type="String" />
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="Codigo_Actividad" Type="String" />
                    <asp:Parameter Name="Giro" Type="String" />
                    <asp:Parameter Name="Numero_Resolucion" Type="Int32" />
                    <asp:Parameter Name="Fecha_Resolucion" Type="DateTime" />
                    <asp:Parameter Name="Rut_Firma" Type="String" />
                    <asp:Parameter Name="KeyCertificado" Type="String" />
                    <asp:Parameter Name="Id_Direccion" Type="Int32" />
                    <asp:Parameter Name="Telefono" Type="String" />
                    <asp:Parameter Name="Contrato" Type="Int32" />
                    <asp:Parameter Name="Path_Fe" Type="String" />
                    <asp:Parameter Name="Direccion" Type="String" />
                    <asp:Parameter Name="Comuna" Type="String" />
                    <asp:Parameter Name="Ciudad" Type="String" />
                    <asp:Parameter Name="dte_Compras" Type="String" />
                    <asp:Parameter Name="Correo_Intercambio" Type="String" />
                    <asp:Parameter Name="Password_Intercambio" Type="String" />
                    <asp:Parameter Name="Giro_SII" Type="String" />
                    <asp:Parameter Name="Unidad_SII" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
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



