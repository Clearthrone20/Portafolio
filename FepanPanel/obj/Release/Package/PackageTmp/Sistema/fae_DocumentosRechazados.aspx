<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="fae_DocumentosRechazados.aspx.vb" Inherits="Fepan.fae_DocumentosRechazados" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>

        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Documentos Rechazados" Theme="iOS">
        </dx:ASPxLabel>

    </div>

    <div>

        <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server">
            <Items>
                <dx:LayoutGroup Caption="Parametro" ColCount="3">
                    <Items>
                        <dx:LayoutItem Caption="Servidor">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cmb_Servidor" runat="server" AutoPostBack="True" SelectedIndex="0">
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="Servidor Z1" Value="Z1" />
                                            <dx:ListEditItem Text="Servidor Z2" Value="Z2" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Empresa:">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cmb_Empresa" runat="server" DataSourceID="sql_Empresas" Height="21px" TextField="Descripcion" ValueField="Id_Empresa" Width="183px">
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
                </dx:LayoutGroup>
            </Items>
        </dx:ASPxFormLayout>

    </div>

    <div>

        <dx:ASPxGridView ID="grd_DocumentosRechazados" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="sql_DocumentosRechazados" KeyFieldName="id_documento">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="id_empresa" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="tipo_dte" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="folio" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="fecha_emision" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="razon_social_emisor" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estado_Documento" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="observacion_sii" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="trackid" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="rut_Emisor" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="rut_receptor" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="id_documento" ReadOnly="True" VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>

    </div>

    <div>

        <asp:SqlDataSource ID="sql_DocumentosRechazados" runat="server" ConnectionString="<%$ ConnectionStrings:MindFullErpConnectionString %>" SelectCommand="fae_DocumentosRechazados" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="Id_Empresa" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    
    <div>

        <asp:SqlDataSource ID="sql_Empresas" runat="server" ConnectionString="<%$ ConnectionStrings:Z1ConnectionString %>" SelectCommand="Select 'TODAS' as [Descripcion],0 as [Id_Empresa] union 
SELECT [Descripcion], [Id_Empresa] FROM [sis_Empresa]
"></asp:SqlDataSource>

    </div> 

</asp:Content>
