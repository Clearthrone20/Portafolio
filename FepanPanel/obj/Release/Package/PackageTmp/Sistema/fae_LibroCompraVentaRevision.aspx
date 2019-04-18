<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="fae_LibroCompraVentaRevision.aspx.vb" Inherits="FepanPanel.fae_LibroCompraVentaRevision" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/fepanPrincipal.ascx" TagPrefix="uc1" TagName="fepanPrincipal" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:fepanPrincipal runat="server" ID="fepanPrincipal" />
        </div>
        <div>
            <dx:ASPxCallbackPanel ID="CallbackFiltros" runat="server" Width="100%" ClientInstanceName="cbFiltros">
      <PanelCollection>
          <dx:PanelContent runat="server">
		  
              <dx:ASPxFormLayout runat="server" ColCount="5"> 
                  <Items>
                      <dx:LayoutItem Caption="Servidor">
                          <LayoutItemNestedControlCollection>
                              <dx:LayoutItemNestedControlContainer runat="server">
                                  <dx:ASPxComboBox ID="cmb_Servidor" runat="server" SelectedIndex="0">
                                      <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cbFiltros.PerformCallback();
}" />
                                      <Items>
                                          <dx:ListEditItem Selected="True" Text="Z1" Value="FepanConnectionString1" />
                                          <dx:ListEditItem Text="Z2" Value="FepanConnectionString2" />
                                          <dx:ListEditItem Text="Z3" Value="FepanConnectionString3" />
                                      </Items>
                                  </dx:ASPxComboBox>
                              </dx:LayoutItemNestedControlContainer>
                          </LayoutItemNestedControlCollection>
                      </dx:LayoutItem>
                      <dx:LayoutItem Caption="Estado">
                          <LayoutItemNestedControlCollection>
                              <dx:LayoutItemNestedControlContainer runat="server">
                                  <dx:ASPxComboBox ID="cmb_Estado" runat="server">
                                       <Items>
                                          <dx:ListEditItem Text="RECHAZADO" Value="5" />
                                          <dx:ListEditItem Text="ACEPTADO" Value="4" />
                                          <dx:ListEditItem Text="ENVIADO" Value="3" />
                                          <dx:ListEditItem Text="GENERADO" Value="2" />
                                          <dx:ListEditItem Text="SIN GENERAR" Value="1" />
                                          <dx:ListEditItem Selected="True" Text="TODOS" Value="0" />
                                       </Items>
                                  </dx:ASPxComboBox>
                              </dx:LayoutItemNestedControlContainer>
                          </LayoutItemNestedControlCollection>
                      </dx:LayoutItem>
                      <dx:LayoutItem Caption="Tipo Libro">
                          <LayoutItemNestedControlCollection>
                              <dx:LayoutItemNestedControlContainer runat="server">
                                  <dx:ASPxComboBox ID="cmb_TipoLibro" runat="server">
                                      <Items>
                                          <dx:ListEditItem Selected="True" Text="COMPRA" Value="COMPRA" />
                                          <dx:ListEditItem Text="VENTA" Value="VENTA" />
                                      </Items>
                                  </dx:ASPxComboBox>
                              </dx:LayoutItemNestedControlContainer>
                          </LayoutItemNestedControlCollection>
                      </dx:LayoutItem>
                      <dx:LayoutItem Caption="Empresa">
                          <LayoutItemNestedControlCollection>
                              <dx:LayoutItemNestedControlContainer runat="server">
                                  <dx:ASPxComboBox ID="cmb_Empresa" runat="server" DataSourceID="sql_Empresa" SelectedIndex="0" TextField="Descripcion" ValueField="Id_Empresa">
                                  </dx:ASPxComboBox>
                              </dx:LayoutItemNestedControlContainer>
                          </LayoutItemNestedControlCollection>
                      </dx:LayoutItem>
                      <dx:LayoutItem ShowCaption="False">
                          <LayoutItemNestedControlCollection>
                              <dx:LayoutItemNestedControlContainer runat="server">
                                  <dx:ASPxButton ID="btn_Consultar" runat="server" AutoPostBack="False" Text="Consultar">
                                      <ClientSideEvents Click="function(s, e) {
	grid.PerformCallback();
}" />
                                  </dx:ASPxButton>
                              </dx:LayoutItemNestedControlContainer>
                          </LayoutItemNestedControlCollection>
                      </dx:LayoutItem>
                  </Items>
              </dx:ASPxFormLayout>
         
		 </dx:PanelContent> 
     </PanelCollection>
</dx:ASPxCallbackPanel>
        </div>
        <div>
            <dx:ASPxGridView ID="grid_Detalle" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid">
                <Settings ShowFilterRow="True" />
<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
                <Columns>
                    <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn Caption="ID EMPRESA" FieldName="Id_Empresa" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="EMPRESA" FieldName="Descripcion" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="RUT EMISOR" FieldName="Rut_Emisor" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="AÑO" FieldName="Ano" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="MES" FieldName="Mes" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="ESTADO" FieldName="Estado" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="TRACK ID" FieldName="TrackId" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="OBSERVACION" FieldName="Observacion" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="CODIGO RECTIFICAR" FieldName="Codigo_Rectificar" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </div>
        <div>

            <asp:SqlDataSource ID="sql_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString1 %>" SelectCommand="SELECT 'TODAS' AS Descripcion, 0 AS Id_Empresa UNION SELECT Descripcion, Id_Empresa FROM sis_Empresa"></asp:SqlDataSource>

        </div>
        <div>

            <asp:SqlDataSource ID="sql_Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString1 %>" SelectCommand="fae_LibroCompraVenta_Revision" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="COMPRA" Name="Tipo_Operacion" Type="String" />
                    <asp:Parameter DefaultValue="0" Name="Estado" Type="Int32" />
                    <asp:Parameter DefaultValue="0" Name="Id_Empresa" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
