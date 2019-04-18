<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisPrograma.aspx.vb" Inherits="FepanPanel.sisPrograma" %>

<%@ Register Src="~/fepanPrincipal.ascx" TagPrefix="uc1" TagName="fepanPrincipal" %>
<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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
        <br />
        <div>
            <dx:ASPxGridView ID="grid_Detalle" runat="server" AutoGenerateColumns="False" DataSourceID="sql_Detalle" KeyFieldName="Id_Programa">
<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
                <SettingsDataSecurity AllowDelete="False" />
                <Columns>
                    <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Id_Programa" ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Codigo" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Sistema" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SubSistema" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Ejecutar" VisibleIndex="6">
                    </dx:GridViewDataCheckColumn>
                </Columns>
            </dx:ASPxGridView>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionStringDesarrollo %>" DeleteCommand="DELETE FROM [sis_Programa] WHERE [Id_Programa] = @Id_Programa" InsertCommand="INSERT INTO [sis_Programa] ([Codigo], [Descripcion], [Sistema], [SubSistema], [Ejecutar]) VALUES (@Codigo, @Descripcion, @Sistema, @SubSistema, @Ejecutar)" SelectCommand="SELECT * FROM [sis_Programa]" UpdateCommand="UPDATE [sis_Programa] SET [Codigo] = @Codigo, [Descripcion] = @Descripcion, [Sistema] = @Sistema, [SubSistema] = @SubSistema, [Ejecutar] = @Ejecutar WHERE [Id_Programa] = @Id_Programa">
                <DeleteParameters>
                    <asp:Parameter Name="Id_Programa" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Codigo" Type="String" />
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="Sistema" Type="String" />
                    <asp:Parameter Name="SubSistema" Type="String" />
                    <asp:Parameter Name="Ejecutar" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Codigo" Type="String" />
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="Sistema" Type="String" />
                    <asp:Parameter Name="SubSistema" Type="String" />
                    <asp:Parameter Name="Ejecutar" Type="Boolean" />
                    <asp:Parameter Name="Id_Programa" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
