<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisUsuario.aspx.vb" Inherits="FepanPanel.sisUsuario" %>
<%@ Register Src="~/fepanPrincipal.ascx" TagPrefix="uc1" TagName="fepanPrincipal" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript">
       var IdUsuario;
       IdUsuario = 0;

       function OnClickCargar() {
          grid.PerformCallback('Actualizar');
       }

       function PopPass() {
           PopUpPass.Show();
       }
        
       function CambioPassword(values) {
           IdUsuario = values[0];
           cbCambioPass.PerformCallback('CambioPass;' + IdUsuario);
           grid.PerformCallback('Actualizar');
           
       }
    </script>
</head>
<body>
    <form id="form1" runat="server">
       <div>
        <uc1:fepanPrincipal runat="server" ID="fepanPrincipal" />
       </div> <%--//FepanPrincipal--%>
       <div>
           <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server">
            <Items>
                <dx:LayoutGroup ColCount="3" Caption="Seleccionar Servidor">
                    <Items>
                        <dx:LayoutItem Caption="Servidor">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cmb_Servidor" runat="server" SelectedIndex="0">
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
	OnClickCargar();
}" />
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxButton ID="btn_CambioPass" runat="server" Text="Cambio de Password">
                                    <ClientSideEvents Click="function(s, e) {
	PopPass();
}" />
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                     </Items>
                </dx:LayoutGroup>
            </Items>
        </dx:ASPxFormLayout>
       </div> <%--//FormLayout Servidores--%>
       <div>
         <dx:ASPxGridView ID="grid_Detalle" runat="server" AutoGenerateColumns="False" KeyFieldName="Id_Usuario" ClientInstanceName="grid">
            <Settings ShowFilterRow="True" />
            <ClientSideEvents RowClick="function(s, e) {visibleIndex = e.visibleIndex;}" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Usuario" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Tipo" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Empresa_Default" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Pagina" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
          </dx:ASPxGridView>
       </div> <%--//GridView Usuarios--%>
       <div>
            <asp:SqlDataSource ID="sql_Usuario" runat="server" 
                DeleteCommand="DELETE FROM [sis_Usuario] WHERE [Id_Usuario] = @Id_Usuario" 
                InsertCommand="INSERT INTO [sis_Usuario] ([Usuario], [Descripcion], [Password], [Tipo], [Id_Empresa_Default], [Pagina]) VALUES (@Usuario, @Descripcion, pwdencrypt('123456'), @Tipo, @Id_Empresa_Default, @Pagina)" 
                SelectCommand="SELECT Id_Usuario, Usuario, Descripcion, Tipo, Contrato_Empresa, Id_Empresa_Default, Pagina FROM sis_Usuario" 
                UpdateCommand="UPDATE sis_Usuario SET Usuario = @Usuario, Descripcion = @Descripcion, Tipo = @Tipo, Id_Empresa_Default = @Id_Empresa_Default, Pagina = @Pagina WHERE (Id_Usuario = @Id_Usuario)" ProviderName="<%$ ConnectionStrings:FepanConnectionString.ProviderName %>">
                <DeleteParameters>
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="Tipo" Type="String" />
                    <asp:Parameter Name="Id_Empresa_Default" Type="Int32" />
                    <asp:Parameter Name="Pagina" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="Tipo" Type="String" />
                    <asp:Parameter Name="Id_Empresa_Default" Type="Int32" />
                    <asp:Parameter Name="Pagina" Type="String" />
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div> <%--//DataSource Usuarios--%>
       <div>
           <asp:SqlDataSource ID="sql_Password" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString1 %>" SelectCommand="SELECT Id_Usuario, Usuario, Descripcion, Password, Tipo, Contrato_Empresa, Id_Empresa_Default, Pagina FROM sis_Usuario" UpdateCommand="UPDATE sis_Usuario SET Password = pwdencrypt(@Password) WHERE (Id_Usuario = @Id_Usuario)">
               <UpdateParameters>
                   <asp:Parameter Name="Password" />
                   <asp:Parameter Name="Id_Usuario" />
               </UpdateParameters>
           </asp:SqlDataSource>
       </div> <%--//DataSource Password--%>    
       <div>
           <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True"
                ClientInstanceName="PopUpPass" HeaderText="Cambio de Password" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                Width="500px">
                <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                  <dx:ASPxCallbackPanel ID="ASPxCallbackPanelCambioPassword" runat="server" Width="100%" 
                      ClientInstanceName="cbCambioPass"> 
                  <PanelCollection>
                  <dx:PanelContent runat="server">
                    <dx:ASPxFormLayout runat="server">
		                <Items>
                            <dx:LayoutGroup Caption="" ColCount="2">
                                <Items>
                                    <dx:LayoutItem Caption="Password">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="txt_Password" runat="server">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxButton ID="btn_Guardar" runat="server" Text="Guardar">
                                                     <ClientSideEvents Click="function(s, e) {var values = grid.GetRowValues(visibleIndex, 'Id_Usuario;Password', CambioPassword);}" />
                                                </dx:ASPxButton>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="" ColSpan="2">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxLabel ID="lbl_Mensaje" runat="server" ForeColor="Red" Text="PASSWORD CAMBIADO CORRECTAMENTE!">
                                                </dx:ASPxLabel>
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
                </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
       </div> <%--//PopUpPass Cambio de Password--%>
       <div>
            <dx:ASPxHiddenField ID="ASPxHiddenField1" runat="server">
            </dx:ASPxHiddenField>
       </div> <%--HiddenField--%>
    </form>
</body>
</html>
