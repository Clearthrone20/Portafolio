<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="fae_FolioEmpresas.aspx.vb" Inherits="Fepan.fae_FolioEmpresas" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Folios Empresas" Theme="iOS">
        </dx:ASPxLabel>

    </div>
    <div>

        <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" ColCount="2">
            <Items>
                <dx:LayoutGroup Caption="Parametro" ColCount="3">
                    <Items>
                        <dx:LayoutItem Caption="Servidor">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cmb_Servidor" runat="server" SelectedIndex="0">
                                        <Items>
                                            <dx:ListEditItem Text="Servidor Z1" Value="Z1" Selected="True" />
                                            <dx:ListEditItem Text="Servidor Z2" Value="Z2" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="True" Caption="Cantidad">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txt_Cantidad" runat="server" Text="100" Width="170px">
                                    </dx:ASPxTextBox>
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
                </dx:LayoutGroup>
            </Items>
        </dx:ASPxFormLayout>

    </div>
    
    <div>

        <dx:ASPxGridView ID="grd_fae_FolioEmpresas" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="sql_fae_FolioEmpresas">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Documento" VisibleIndex="0" Width="200px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Codigo" VisibleIndex="1" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Empresa" VisibleIndex="2" Width="300px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" ReadOnly="True" VisibleIndex="3" Width="100px">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" />
        </dx:ASPxGridView>

    </div>

    <div>

        <asp:SqlDataSource ID="sql_fae_FolioEmpresas" runat="server" ConnectionString="<%$ ConnectionStrings:MindFullErpConnectionString %>" SelectCommand="fae_Folios_Empresa" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="Cantidad" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

    <div>

    </div>
</asp:Content>
