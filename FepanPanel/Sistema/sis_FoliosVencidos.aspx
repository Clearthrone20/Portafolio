<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sis_FoliosVencidos.aspx.vb" Inherits="FepanPanel.sis_FoliosVencidos" %>

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
     <script type="text/javascript">
         var visibleIndex, Id, dte;
         visibleIndex = 0;
         Id = 0;
         dte = 0;
         function Menu(e) {
             switch (e.item.name) {
                 case 'Anular':
                     var values = grid.GetRowValues(visibleIndex, 'Id_Empresa;Tipo_Dte', Anular);
                     break;
                 case 'Actualizar':
                     grid.PerformCallback();
                     break;
             }
         }
         function Actualizar() {
             grid.PerformCallback();
         }
         function ModAnular(s) {
             s.SetContentUrl('sis_FoliosVencidosAnular.aspx?Id_Empresa=' + Id +'&Tipo_Dte=' + dte);
             s.RefreshContentUrl();
         }
         function Anular(values) {
             Id = values[0];
             dte = values[1];
             popupAnular.Show();
         }
    </script>
</head>

<body>

    <form id="form1" runat="server">

        <div class="content-wrapper">
            <div class="container-fluid">
                <!--Contenedor Pagina-->
                        <div>
                              <dx:ASPxRibbon ID="ASPxRibbon1" runat="server"
                    EnableTheming="True" ShowFileTab="False" ShowGroupLabels="False">
                    <Tabs>
                        <dx:RibbonTab Text="Folios Vencidos" Name="rib_AnularFolios">
                            <Groups>
                                <dx:RibbonGroup Name="rbng_Anular" runat="server">
                                    <Items>
                                        <dx:RibbonButtonItem Name="Anular" Size="Large" Text="Anular" >
                                            <LargeImage IconID="actions_cleartablestyle_32x32">
                                            </LargeImage>
                                        </dx:RibbonButtonItem>
                                         <dx:RibbonButtonItem Name="Actualizar" Size="Large" Text="Actualizar" >
                                            <LargeImage IconID="actions_refresh_32x32">
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
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                                <Items>
                                    <dx:LayoutGroup ShowCaption="False" GroupBoxStyle-Border-BorderStyle="None" Width="100%" ColCount="2">
<GroupBoxStyle Border-BorderStyle="None"></GroupBoxStyle>
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False" Width="100%">
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
                                            <dx:LayoutItem ShowCaption="False" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer Width="100%" runat="server">
                                                        <dx:ASPxGridView ID="grd_FoliosVencidos" Width="100%" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="sql_FoliosVencidos" EnableRowsCache="False" KeyFieldName="Id_Empresa" SettingsBehavior-AllowFocusedRow="False" SettingsBehavior-ProcessFocusedRowChangedOnServer="False">
                                                            <Settings ShowFilterRow="True" />
                                                            <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                            <EditFormLayoutProperties>
                                                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                                                            </EditFormLayoutProperties>
                                                            <SettingsEditing EditFormColumnCount="1" Mode="EditForm"></SettingsEditing>
                                                            <ClientSideEvents RowClick="function(s, e) {visibleIndex = e.visibleIndex;}" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="Id_Empresa" Visible="false" Caption="Empresa" VisibleIndex="0" AdaptivePriority="1" Width="10%">
                                                                </dx:GridViewDataTextColumn>
                                                                  <dx:GridViewDataTextColumn FieldName="empresa" Caption="Empresa" VisibleIndex="1" AdaptivePriority="1" Width="20%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Tipo_Dte" Visible="false" Caption="Tipo Dte" VisibleIndex="2" AdaptivePriority="1" Width="5%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Descripcion" Caption="Tipo Dte" VisibleIndex="3" AdaptivePriority="1" Width="10%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="Folio_Inicial" Caption="Folio Inicial" VisibleIndex="4" AdaptivePriority="1" Width="5%">
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataDateColumn FieldName="Folio_Final" Caption="Folio Final" VisibleIndex="5" AdaptivePriority="1" Width="5%">
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Cantidad" Caption="Cantidad" VisibleIndex="6" AdaptivePriority="1" Width="5%">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                                            <Settings VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" ShowFilterRow="True" />
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
                                        <dx:ASPxPopupControl ID="popupAnular" runat="server" AllowDragging="True"
                ClientInstanceName="popupAnular" HeaderText="Empresa"
                Width="850px" PopupHorizontalAlign="WindowCenter"
                PopupVerticalAlign="WindowCenter" Modal="True" ContentUrl="~/Sistema/sis_FoliosVencidosAnular.aspx?Id_Empresa=0&Tipo_Dte=0" Height="600px" >
                <ClientSideEvents CloseUp="function(s, e) {Actualizar()}" Shown="function(s, e) {ModAnular(s)}"/>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
                        </div>
                <!--End Contenedor Pagina-->
            </div>

        </div>
        <!--DataSources-->
        <div>
            <asp:SqlDataSource ID="sql_FoliosVencidos" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString3 %>" SelectCommand="select * 
into #tmp
from fae_Folio_Electronico
where Fecha_Carga &lt; dateadd(MONTH, -6, GETDATE()) 


alter table #tmp add Id_Tipo_Documento int

update #tmp set Id_Tipo_Documento = b.Id_Tipo_Documento
from #tmp a inner join sis_Tipo_Documento b
	on a.Id_Empresa = b.Id_Empresa 
	and a.Tipo_Dte = b.Codigo_Electronico



select d.Descripcion as empresa,b.Id_Empresa, c.Descripcion,b.Tipo_Dte , b.Folio_Inicial , b.Folio_Final, count(*) as Cantidad
	from sis_Secuencia_Numerica a 
	inner join #tmp b on a.Id_Empresa = b.Id_Empresa 
	inner join fae_Tipo_Dte c on b.Tipo_Dte=c.Tipo_Dte
	inner join sis_Empresa d on b.Id_Empresa=d.Id_Empresa
	and a.Id_Tipo_Documento = b.id_tipo_documento
	and a.Secuencia between b.Folio_Inicial and b.Folio_Final 
	and a.Estado = 1
group by b.Id_Empresa, b.Tipo_Dte , b.Folio_Inicial , b.Folio_Final, c.Descripcion, d.Descripcion"></asp:SqlDataSource>
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



