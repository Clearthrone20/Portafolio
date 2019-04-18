<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisListarUsuarios.aspx.vb" Inherits="FepanPanel.sisListarUsuarios" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>


<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Listar Usuarios</title>


    <!--Script Grilla responsive-->
    <script type="text/javascript">
        function UpdateGridHeight() {
            sampleGrid.SetHeight(0);
            var containerHeight = ASPxClientUtils.GetDocumentClientHeight();
            if (document.body.scrollHeight > containerHeight)
                containerHeight = document.body.scrollHeight;
            sampleGrid.SetHeight(containerHeight);
        }
    </script>
    <script type="text/javascript">
        var IdUsuario;
        IdUsuario = 0;

        function CambioPassword(values) {
            IdUsuario = values[0];
            cbCambioPass.PerformCallback('CambioPass;' + IdUsuario);
            grid.PerformCallback('Actualizar');
        }

    </script>

    <!--End Script Grilla responsive-->
</head>

<body>
    <form id="formListarUsuarios" runat="server">
        <div class="content-wrapper">
            <div class="container-fluid">
                <br />
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="sisMenuPanelB.aspx">Inicio</a>
                    </li>
                    <li class="breadcrumb-item active">Listar Usuarios</li>
                </ol>
                <!--Contenedor Pagina-->

                        <div id="panelUsuario" runat="server" style="display: block">
                            <div runat="server">
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                                    <Items>
                                        <dx:LayoutGroup ShowCaption="False" Width="100%" GroupBoxStyle-Border-BorderStyle="None">
<GroupBoxStyle Border-BorderStyle="None"></GroupBoxStyle>
                                            <Items>
                                                <dx:LayoutItem ShowCaption="False" Width="100%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                            <dx:ASPxGridView ID="grd_Detalle" Width="100%" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="sql_Usuario" EnableRowsCache="False" KeyFieldName="Id_Usuario">
                                                                <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                                                                <SettingsEditing EditFormColumnCount="1" Mode="EditForm">
                                                                </SettingsEditing>
                                                                <SettingsCommandButton>
                                                                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                                </SettingsCommandButton>
                                                                <ClientSideEvents RowClick="function(s, e) {visibleIndex = e.visibleIndex;}" />

                                                                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                                                <EditFormLayoutProperties>
                                                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" />
                                                                </EditFormLayoutProperties>
                                                                <SettingsEditing Mode="EditForm"></SettingsEditing>
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" AdaptivePriority="1"  Caption="Mantenedores">
                                                                          <CellStyle Wrap="true">
                                                                                </CellStyle>
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Id_Usuario" ReadOnly="True" VisibleIndex="4" Caption="Id Usuario" AdaptivePriority="2">
                                                                        <EditFormSettings Visible="False" />
                                                                          <CellStyle Wrap="true">
                                                                                </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="2" AdaptivePriority="2" Caption="Usuario">
                                                                          <CellStyle Wrap="true">
                                                                                </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Contrato_Empresa" VisibleIndex="5" Visible="False" AdaptivePriority="2" Caption="Contrato empresa">
                                                                          <CellStyle Wrap="true">
                                                                                </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataComboBoxColumn FieldName="Tipo" VisibleIndex="3" AdaptivePriority="2">
                                                                          <CellStyle Wrap="true">
                                                                                </CellStyle>
                                                                        <PropertiesComboBox Width="100%">
                                                                            <Items>
                                                                                <dx:ListEditItem Selected="True" Text="Administrador" Value="Administrador" />
                                                                                <dx:ListEditItem Text="Operador" Value="Operador" />
                                                                            </Items>
                                                                        </PropertiesComboBox>
                                                                    </dx:GridViewDataComboBoxColumn>
                                                                    <dx:GridViewDataComboBoxColumn FieldName="Pagina" VisibleIndex="7" AdaptivePriority="2" Caption="Pagina">
                                                                          <CellStyle Wrap="true">
                                                                                </CellStyle>
                                                                        <PropertiesComboBox Width="100%"> 
                                                                            <Items>
                                                                                <dx:ListEditItem Selected="True" Text="Ventas" Value="~/Ventas/Ventas.aspx" />
                                                                                <dx:ListEditItem Text="Factura Electronica" Value="~/FacturaElectronica/FacturaElectronica.aspx" />
                                                                            </Items>
                                                                        </PropertiesComboBox>
                                                                    </dx:GridViewDataComboBoxColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="1" AdaptivePriority="3" Caption="Mail usuario">
                                                                          <CellStyle Wrap="true">
                                                                                </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataComboBoxColumn FieldName="Id_Empresa_Default" VisibleIndex="6" Caption="Empresa" AdaptivePriority="2">
                                                                          <CellStyle Wrap="true">
                                                                                </CellStyle>
                                                                        <PropertiesComboBox Width="100%" DataSourceID="sql_Empresa" TextField="Descripcion" ValueField="Id_Empresa"></PropertiesComboBox>
                                                                    </dx:GridViewDataComboBoxColumn>
                                                                </Columns>
                                                                               <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                     <Settings VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" ShowFilterRow="True" />
                                                                <Styles>
                                                                    <Header BackColor="#99CCFF" Font-Bold="False" ForeColor="Black">
                                                                    </Header>
                                                                    <SelectedRow BackColor="#FFFF99">
                                                                    </SelectedRow>
                                                                    <FocusedRow BackColor="#FFFF99">
                                                                    </FocusedRow>
                                                                    <Cell Wrap="False"></Cell>
                                                                </Styles>
                                                            </dx:ASPxGridView>
                                                            <br />
                                                            <dx:BootstrapButton ID="btn_CambioPass" runat="server" Text="Cambio de Password" Width="100%" RenderOption="Primary" OnClick="btn_CambioPass_Click">
                                                            </dx:BootstrapButton>
                                                            <br />
                                                            <br />
                                                            <div id="lbl_ErrorCambioContraseña" visible="false" runat="server" class="alert alert-danger" role="alert" style="Width: 100%" >
                                                            <a class="alert-link" runat="server" >Debe seleccionar a un usuario de la lista!</a>
                                                             </div>
                                                                       <div class="alert alert-success" id="lbl_Mensaje" width="100%" visible="false" runat="server" role="alert">
                                                                       <a href="#" class="alert-link"><dx:ASPxLabel CssClass="alert-link" ID="lbl_MensajeS" runat="server"></dx:ASPxLabel></a>
                            </div>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:LayoutGroup>
                                    </Items>
                                </dx:ASPxFormLayout>
                            </div>
                            <%--FormLayout Servidores--%>
                        </div>
                        <%--Gridview Usuarios--%>
                        <div id="panelCambiarContraseña" runat="server" style="display: none">


                    <div class="container">

                        <div class="form-group">
                             <label for="txt_Mail">Mail usuario</label> 
                            <dx:BootstrapTextBox ID="txt_Mail" runat="server" ReadOnly="true">
                            </dx:BootstrapTextBox>
                        </div>
                        <div class="form-group">
                               <label for="txt_Usuario">Usuario</label> 
                            <dx:BootstrapTextBox ID="txt_Usuario" runat="server" ReadOnly="true">
                            </dx:BootstrapTextBox>
                        </div>
                        <div class="form-group">
                            <label for="txt_Password">Password</label> 
                                <div class="input-group">
                                   <input type="password" class="form-control" id="txt_Password" placeholder="Ingrese una nueva contraseña" runat="server"/>
                                    <div class="input-group-append">
                                        <button id="show_password" class="btn btn-primary" type="button">
                                            <span class="fa fa-eye-slash icon"></span>
                                        </button>
                                    </div>
                                </div>
                        </div>
                        <div class="form-group" style="float: right;">
                            <dx:BootstrapButton ID="btn_Guardar" runat="server" Text="Guardar" RenderOption="Primary" OnClick="btn_Guardar_Click">
                            </dx:BootstrapButton>
                      
                            <dx:BootstrapButton ID="btn_Cancelar" runat="server" Text="Cancelar"  OnClick="btn_Cancelar_Click" RenderOption="Danger">
                            </dx:BootstrapButton>
                        
                        </div>
                    </div>
  

                </div>
           
                <%--Cambio de Password--%>
                <div>
                    <dx:ASPxHiddenField ID="ASPxHiddenField1" runat="server">
                    </dx:ASPxHiddenField>
                </div>
                <%--HiddenField--%>
                <!--End Contenedor Pagina-->
            </div>

        </div>
        <!--DataSources-->
        <div>
            <asp:SqlDataSource ID="sql_Usuario" runat="server"
                ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>"
                DeleteCommand="DELETE FROM [sis_Usuario] WHERE [Id_Usuario] = @Id_Usuario"
                InsertCommand="INSERT INTO sis_Usuario(Usuario, Descripcion, Password, Tipo, Id_Empresa_Default, Pagina,Contrato_Empresa,Categoria) VALUES (@Usuario, @Descripcion, pwdencrypt(@Password), @Tipo, @Id_Empresa_Default, @Pagina,@Contrato_Empresa,@Categoria)  SELECT @Id_Usuario = SCOPE_IDENTITY()"
                SelectCommand="SELECT Id_Usuario, Usuario, Descripcion, Tipo, Contrato_Empresa, Id_Empresa_Default, Pagina FROM sis_Usuario"
                UpdateCommand="UPDATE [sis_Usuario] SET [Usuario] = @Usuario, [Descripcion] = @Descripcion, [Tipo] = @Tipo, [Contrato_Empresa] = @Contrato_Empresa, [Id_Empresa_Default] = @Id_Empresa_Default, [Pagina] = @Pagina , [Categoria]= @Categoria WHERE [Id_Usuario] = @Id_Usuario">
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
                    <asp:Parameter Name="Categoria" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="Tipo" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="Contrato_Empresa" Type="Int32" />
                    <asp:Parameter Name="Id_Empresa_Default" Type="Int32" />
                    <asp:Parameter Name="Pagina" Type="String" />
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                     <asp:Parameter Name="Categoria" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
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
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Password" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString1 %>" SelectCommand="SELECT Id_Usuario, Usuario, Descripcion, Password, Tipo, Contrato_Empresa, Id_Empresa_Default, Pagina FROM sis_Usuario" 
                UpdateCommand="UPDATE sis_Usuario SET Password = pwdencrypt(@Password) WHERE (Id_Usuario = @Id_Usuario)">
                <UpdateParameters>
                    <asp:Parameter Name="Password" />
                    <asp:Parameter Name="Id_Usuario" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <!--End DataSources-->
    </form>
    <!--Ascx Menu-->
    <div>

        <bot:Menu runat="server" ID="Menu" />
             
          <script type="text/javascript">
              $(document).ready(function () {
                  $('#show_password').hover(function show() {
                      //Cambiar el atributo a texto
                      $('#txt_Password').attr('type', 'text');
                      $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
                  },
                      function () {
                          //Cambiar el atributo a contraseña
                          $('#txt_Password').attr('type', 'password');
                          $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                      });
                  //CheckBox mostrar contraseña
                  $('#ShowPassword').click(function () {
                      $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
                  });
              });
    </script>
    </div>
    <!--End Ascx Menu-->
</body>
</html>



