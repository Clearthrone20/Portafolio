<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisListarUsuarios.aspx.vb" Inherits="FepanPanel.sisListarUsuarios" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript">
       var IdUsuario;
       IdUsuario = 0;

       function PopPass() {
           cbCambioPass.PerformCallback('Limpiar');
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
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
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
                                    <dx:ASPxButton ID="btn_Actualizar" runat="server" Text="Consultar" AutoPostBack="False">
                                        <ClientSideEvents Click="function(s, e) {
	grid.PerformCallback();
}" />
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxButton ID="btn_CambioPass" runat="server" Text="Cambio de Password" AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {PopPass();}" />
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                     </Items>
                  </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
        </div> <%--FormLayout Servidores--%>
        <div>
    
        <dx:ASPxGridView ID="grd_Detalle" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False" DataSourceID="sql_Usuario" KeyFieldName="Id_Usuario">
            <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsCommandButton>
            <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
            </SettingsCommandButton>
           <ClientSideEvents RowClick="function(s, e) {visibleIndex = e.visibleIndex;}" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="80px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Usuario" ReadOnly="True" VisibleIndex="1" Caption="Id Usuario" Width="20px">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2" Width="200px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="3" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Contrato_Empresa" VisibleIndex="5" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Tipo" VisibleIndex="4" Width="60px">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Administrador" Value="Administrador" />
                            <dx:ListEditItem Text="Operador" Value="Operador" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Pagina" VisibleIndex="7" Width="60px">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Ventas" Value="~/Ventas/Ventas.aspx" />
                            <dx:ListEditItem Text="Factura Electronica" Value="~/FacturaElectronica/FacturaElectronica.aspx" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Id_Empresa_Default" VisibleIndex="6" Caption="Empresa" Width="250px">
                    <PropertiesComboBox DataSourceID="sql_Empresa" TextField="Descripcion" ValueField="Id_Empresa">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
    
    </div> <%--Gridview Usuarios--%>
        <div>
           <asp:SqlDataSource ID="sql_Usuario" runat="server" 
               ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" 
               DeleteCommand="DELETE FROM [sis_Usuario] WHERE [Id_Usuario] = @Id_Usuario" 
               InsertCommand="INSERT INTO sis_Usuario(Usuario, Descripcion, Password, Tipo, Id_Empresa_Default, Pagina,Contrato_Empresa) VALUES (@Usuario, @Descripcion, pwdencrypt(@Password), @Tipo, @Id_Empresa_Default, @Pagina,@Contrato_Empresa)  SELECT @Id_Usuario = SCOPE_IDENTITY()" 
               SelectCommand="SELECT Id_Usuario, Usuario, Descripcion, Tipo, Contrato_Empresa, Id_Empresa_Default, Pagina FROM sis_Usuario" 
               UpdateCommand="UPDATE [sis_Usuario] SET [Usuario] = @Usuario, [Descripcion] = @Descripcion, [Tipo] = @Tipo, [Contrato_Empresa] = @Contrato_Empresa, [Id_Empresa_Default] = @Id_Empresa_Default, [Pagina] = @Pagina WHERE [Id_Usuario] = @Id_Usuario">
                <DeleteParameters>
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Usuario" />
                    <asp:Parameter Name="Descripcion" />
                    <asp:Parameter Name="Password" />
                    <asp:Parameter Name="Tipo" />
                    <asp:Parameter Name="Id_Empresa_Default" />
                    <asp:Parameter Name="Pagina" />
                    <asp:Parameter DefaultValue="1" Name="Contrato_Empresa" />
                    <asp:Parameter Direction="Output" Name="Id_Usuario" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="Tipo" Type="String" />
                    <asp:Parameter Name="Contrato_Empresa" Type="Int32" />
                    <asp:Parameter Name="Id_Empresa_Default" Type="Int32" />
                    <asp:Parameter Name="Pagina" Type="String" />
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div> <%--SqlUsuario--%>
        <div>

            <asp:SqlDataSource ID="sql_Usuario_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" DeleteCommand="DELETE FROM [sis_Usuario_Empresa] WHERE [Id_Usuario_Empresa] = @Id_Usuario_Empresa" InsertCommand="INSERT INTO [sis_Usuario_Empresa] ([Id_Usuario], [Id_Empresa]) VALUES (@Id_Usuario, @Id_Empresa)" SelectCommand="SELECT * FROM [sis_Usuario_Empresa]" UpdateCommand="UPDATE [sis_Usuario_Empresa] SET [Id_Usuario] = @Id_Usuario, [Id_Empresa] = @Id_Empresa WHERE [Id_Usuario_Empresa] = @Id_Usuario_Empresa">
                <DeleteParameters>
                    <asp:Parameter Name="Id_Usuario_Empresa" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter Name="Id_Usuario_Empresa" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
        <div>
           <asp:SqlDataSource ID="sql_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString2 %>" SelectCommand="SELECT [Id_Empresa], [Descripcion] FROM [sis_Empresa]"></asp:SqlDataSource>
        </div> <%--SqlEmpresa--%>
        <div>
           <asp:SqlDataSource ID="sql_Password" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString1 %>" SelectCommand="SELECT Id_Usuario, Usuario, Descripcion, Password, Tipo, Contrato_Empresa, Id_Empresa_Default, Pagina FROM sis_Usuario" UpdateCommand="UPDATE sis_Usuario SET Password = pwdencrypt(@Password) WHERE (Id_Usuario = @Id_Usuario)">
               <UpdateParameters>
                   <asp:Parameter Name="Password" />
                   <asp:Parameter Name="Id_Usuario" />
               </UpdateParameters>
           </asp:SqlDataSource>
       </div> <%--DataSource Password--%> 
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
                                                <dx:ASPxButton ID="btn_Guardar" runat="server" Text="Guardar" AutoPostBack="False">
                                                     <ClientSideEvents Click="function(s, e) {var values = grid.GetRowValues(visibleIndex, 'Id_Usuario;Usuario', CambioPassword);}" />
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
       </div> <%--PopUpPass Cambio de Password--%>
        <div>
            <dx:ASPxHiddenField ID="ASPxHiddenField1" runat="server">
            </dx:ASPxHiddenField>
       </div> <%--HiddenField--%>
    </form>
</body>
</html>
