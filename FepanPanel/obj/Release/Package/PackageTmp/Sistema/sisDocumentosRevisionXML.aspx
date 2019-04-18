<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisDocumentosRevisionXML.aspx.vb" Inherits="FepanPanel.sisDocumentosRevisionXML" %>
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
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
            <Items>
                <dx:LayoutGroup ColCount="5" Caption="Seleccionar Servidor">
                    <Items>
                        <dx:LayoutItem Caption="Servidor">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cmb_Servidor" runat="server" SelectedIndex="0">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
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
                        <dx:LayoutItem Caption="Año">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cmb_Ano" runat="server">
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Mes">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cmb_Mes" runat="server">
                                        <Items>
                                            <dx:ListEditItem Text="ENERO" Value="1" />
                                            <dx:ListEditItem Text="FEBRERO" Value="2" />
                                            <dx:ListEditItem Text="MARZO" Value="3" />
                                            <dx:ListEditItem Text="ABRIL" Value="4" />
                                            <dx:ListEditItem Text="MAYO" Value="5" />
                                            <dx:ListEditItem Text="JUNIO" Value="6" />
                                            <dx:ListEditItem Text="JULIO" Value="7" />
                                            <dx:ListEditItem Text="AGOSTO" Value="8" />
                                            <dx:ListEditItem Text="SEPTIEMBRE" Value="9" />
                                            <dx:ListEditItem Text="OCTUBRE" Value="10" />
                                            <dx:ListEditItem Text="NOVIEMBRE" Value="11" />
                                            <dx:ListEditItem Text="DICIEMBRE" Value="12" />
                                        </Items>
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
            </Items>
        </dx:ASPxFormLayout>
            </dx:PanelContent>
            </PanelCollection>
             </dx:ASPxCallbackPanel>
    </div>
    <div>
        <dx:ASPxGridView ID="grid_Detalle" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid">
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
                <dx:GridViewDataTextColumn Caption="ID Empresa" FieldName="Id_empresa" VisibleIndex="5" Width="50px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo" FieldName="tipo_dte" VisibleIndex="1" Width="50px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cliente" FieldName="Razon_Social_Emisor" VisibleIndex="2" Width="250px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Emisor" FieldName="Rut_Emisor" VisibleIndex="6" Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Cantidad" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fecha" FieldName="Fecha" VisibleIndex="10">
                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <div>
        <asp:SqlDataSource ID="sql_Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString2 %>" SelectCommand="fae_DocumentosRevisionXML" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="Ano" Type="Int32" />
                <asp:Parameter Name="Mes" Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="Id_Empresa" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
