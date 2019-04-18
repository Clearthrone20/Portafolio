<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisDocumentosRechazados.aspx.vb" Inherits="FepanPanel.sisDocumentosRechazados" %>

<%@ Register Src="~/fepanPrincipal.ascx" TagPrefix="uc1" TagName="fepanPrincipal" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


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
         <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" 
            ClientInstanceName="cbpri" Width="100">
             <ClientSideEvents EndCallback="function(s, e) {Imprimir(s)}" />
        <PanelCollection>
        <dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="4">
            <Items>
                <dx:LayoutGroup ColCount="2" Caption="Seleccionar Servidor">
                    <Items>
                        <dx:LayoutItem Caption="Servidor">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cmb_Servidor" runat="server" SelectedIndex="0">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cbpri.PerformCallback(&quot;Actualizar&quot;)
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
                     </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Seleccionar Observacion">
                    <Items>
                        <dx:LayoutItem Caption="Observacion">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cmb_Observacion" runat="server" DataSourceID="sql_Observacion" SelectedIndex="8" TextField="Observacion_Sii" ValueField="Observacion_Sii">
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Seleccionar Empresa" ColCount="2">
                    <Items>
                        <dx:LayoutItem Caption="Empresa">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cmb_Empresa" runat="server" DataSourceID="sql_Empresa2" SelectedIndex="0" TextField="Descripcion" ValueField="Id_Empresa">
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxButton ID="btn_Consultar" runat="server" AutoPostBack="False" Text="Consultar">
                                        <ClientSideEvents Click="function(s, e) {
	grid.PerformCallback()
}" />
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Firmar Documentos" ColCount="2" ShowCaption="False">
                    <Items>
                        <dx:LayoutItem Caption="Firmar" ColSpan="2" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxButton ID="btn_Firmar" runat="server" Text="Firmar">
                                    </dx:ASPxButton>
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
    
    <div>
        <dx:ASPxGridView ID="grid_Detalle" runat="server" AutoGenerateColumns="False" KeyFieldName="id_documento" ClientInstanceName="grid">
            <SettingsPager PageSize="15">
            </SettingsPager>
<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <Columns>
                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="ID Empresa" FieldName="id_empresa" VisibleIndex="8" Width="50px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo" FieldName="tipo_dte" VisibleIndex="1" Width="50px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="folio" VisibleIndex="2" Width="50px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fecha" FieldName="fecha_emision" VisibleIndex="3" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cliente" FieldName="razon_social_emisor" VisibleIndex="5" Width="250px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Observacion" FieldName="observacion_sii" VisibleIndex="6" Width="200px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Track Id" FieldName="trackid" VisibleIndex="7" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Emisor" FieldName="rut_Emisor" VisibleIndex="9" Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Receptor" FieldName="rut_receptor" VisibleIndex="10" Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="id_documento" FieldName="id_documento" VisibleIndex="11" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Monto Total" FieldName="Monto_Total" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="#,##0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>

    <div>
        <asp:SqlDataSource ID="sql_Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString1 %>" SelectCommand="fae_DocumentosRechazados" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="Id_Empresa" Type="Int32" />
                <asp:Parameter DefaultValue="TODOS" Name="Observacion" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    
    <div>
        <asp:SqlDataSource ID="sql_Empresa2" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString1 %>" SelectCommand="SELECT 'TODOS' AS Descripcion, 0 AS Id_Empresa UNION SELECT Descripcion, Id_Empresa FROM sis_Empresa"></asp:SqlDataSource>
    </div>

    <div>
        <asp:SqlDataSource ID="sql_Observacion" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString1 %>" SelectCommand="SELECT DISTINCT a.Observacion_Sii FROM fae_Documento AS a INNER JOIN sis_Empresa AS b ON a.Id_Empresa = b.Id_Empresa WHERE (a.Tipo_Operacion = 'VENTA') AND (b.Numero_Resolucion &lt;&gt; 0) AND (a.Estado_Documento = 6) UNION SELECT 'TODOS' AS observacion_sii"></asp:SqlDataSource>
    </div>

    </form>
</body>
</html>
