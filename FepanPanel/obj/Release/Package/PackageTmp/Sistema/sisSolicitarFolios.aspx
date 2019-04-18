<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisSolicitarFolios.aspx.vb" Inherits="FepanPanel.sisSolicitarFolios" %>

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
                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="400px">
                            <Items>
                                <dx:LayoutGroup Caption="Solicitar Folios" ColCount="2">
                                    <Items>
                                        <dx:LayoutItem Caption="Servidor" ColSpan="2">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxComboBox ID="cmb_Servidor" runat="server" SelectedIndex="0" Width="100%">
                                                        <Items>
                                                            <dx:ListEditItem Selected="True" Text="Z1" Value="FepanConnectionString1" />
                                                            <dx:ListEditItem Text="Z2" Value="FepanConnectionString2" Selected="True" />
                                                            <dx:ListEditItem Text="Z3" Value="FepanConnectionString3" />
                                                        </Items>
                                                    </dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tipo Documento" ColSpan="2">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxComboBox ID="cmb_TipoDocumento" runat="server" SelectedIndex="0" Width="100%">
                                                        <Items>
                                                            <dx:ListEditItem Selected="True" Text="Guias" Value="52" />
                                                            <dx:ListEditItem Text="Facturas" Value="33" />
                                                            <dx:ListEditItem Text="Notas de Credito" Value="61" />
                                                        </Items>
                                                    </dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Todos">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxCheckBox ID="chk_Todos" runat="server" CheckState="Unchecked">
                                                    </dx:ASPxCheckBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxButton ID="btn_Consultar" runat="server" Text="Consultar">
                                                    </dx:ASPxButton>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                        </dx:ASPxFormLayout>
        </div>
        <div>
            <dx:ASPxGridView ID="grid_Detalle" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="sql_Solicitar_Folios">
                <SettingsCommandButton>
                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                </SettingsCommandButton>
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Codigo" FieldName="Codigo" Name="Codigo" VisibleIndex="0" Width="100px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Empresa" FieldName="Empresa" VisibleIndex="1" Width="300px">
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Cantidad" VisibleIndex="2" Width="100px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Solicitar" FieldName="Solicitar" VisibleIndex="4" Width="100px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Promedio" FieldName="Promedio" VisibleIndex="3" Width="100px">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </div>
        <div>

            <asp:SqlDataSource ID="sql_Solicitar_Folios" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="fae_Solicitar_Folios" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Tipo_Dte" Type="Int32" />
                    <asp:Parameter DefaultValue="0" Name="Todos" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
