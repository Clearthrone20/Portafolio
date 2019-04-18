<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisEmpresa.aspx.vb" Inherits="FepanPanel.sisEmpresa" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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
             <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" 
            ClientInstanceName="cbpri" Width="100">
             <ClientSideEvents EndCallback="function(s, e) {Imprimir(s)}" />
        <PanelCollection>
            <dx:PanelContent runat="server">
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
                <Items>
                    <dx:LayoutGroup Caption="Seleccionar Servidor" ColCount="2" Width="400px">
                        <Items>
                            <dx:LayoutItem Caption="Servidor">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="cmb_Servidor" runat="server">
                                         <Items>
                                            <dx:ListEditItem Selected="True" Text="Z1" Value="FepanConnectionString1" />
                                            <dx:ListEditItem Text="Z2" Value="FepanConnectionString2" />
                                            <dx:ListEditItem Text="Z3" Value="FepanConnectionString3" />
                                         </Items>
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxButton ID="btn_Consultar" runat="server" Text="Consultar" AutoPostBack="False">
                                            <ClientSideEvents Click="function(s, e) {
	grid.PerformCallback();
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
<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Codigo" FieldName="Codigo" VisibleIndex="0" Width="70px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Empresa" FieldName="Descripcion" VisibleIndex="1" Width="200px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Codigo Actividad" FieldName="Codigo_Actividad" VisibleIndex="2" Width="70px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Giro" FieldName="Giro" VisibleIndex="3" Width="200px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="N° Resolucion" FieldName="Numero_Resolucion" VisibleIndex="5" Width="30px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Fecha Resolucion" FieldName="Fecha_Resolucion" VisibleIndex="6" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Direccion" FieldName="Direccion" VisibleIndex="7" Width="150px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Comuna" FieldName="Comuna" VisibleIndex="8" Width="80px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ciudad" FieldName="Ciudad" VisibleIndex="9" Width="80px">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="SELECT * FROM [sis_Empresa]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
