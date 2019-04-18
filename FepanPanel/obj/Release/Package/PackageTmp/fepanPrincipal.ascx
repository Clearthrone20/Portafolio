<%@ Control Language="vb" AutoEventWireup="false" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<script runat="server">
    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cmb_Empresa.SelectedIndex = 0
            Buscar_Empresa()
            ASPxHyperLink1.NavigateUrl = Session("Modulo")
        End If

    End Sub
    Sub cmb_Empresa_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmb_Empresa.SelectedIndexChanged
        Session("IdEmpresa") = cmb_Empresa.Value
        Response.Redirect(Session("Modulo"))
    End Sub

    Sub Buscar_Empresa()
        cmb_Empresa.DataBind()
        For i As Integer = 0 To cmb_Empresa.Items.Count - 1
            If cmb_Empresa.Items(i).Value = Session("IdEmpresa") Then
                cmb_Empresa.SelectedIndex = i
            End If
        Next
    End Sub

</script>
 <div>

        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="4" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False" Width="50px">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" ImageUrl="~/Imagenes/Flecha_Volver48.png">
                            </dx:ASPxHyperLink>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Empresa" ShowCaption="False" Width="250px">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxComboBox ID="cmb_Empresa" runat="server" AutoPostBack="True" DataSourceID="sql_Empresa" EnableCallbackMode="True" TextField="Descripcion" Theme="Moderno" ValueField="Id_Empresa" Width="100%">
                            </dx:ASPxComboBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False" Width="600px">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxMenu ID="ASPxMenu2" runat="server" EnableCallBacks="True" EnableTheming="True" ShowPopOutImages="True" Theme="Moderno">
                                <Items>
                                    <dx:MenuItem Text="Módulo">
                                        <Items>
                                            <dx:MenuItem NavigateUrl="~/Compras/Compras.aspx" Text="Compras">
                                                <Image IconID="actions_buy_32x32devav">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem NavigateUrl="~/Ventas/Ventas.aspx" Text="Ventas">
                                                <Image IconID="programming_tag_32x32office2013">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem NavigateUrl="~/Cobranza/Cobranza.aspx" Text="Cobranzas">
                                                <Image IconID="programming_project_32x32office2013">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem BeginGroup="True" NavigateUrl="~/FacturaElectronica/FacturaElectronica.aspx" Text="Factura Electrónica">
                                                <Image IconID="programming_project_32x32office2013">
                                                </Image>
                                                <Image IconID="mail_emailtemplate_32x32office2013">
                                                </Image>
                                            </dx:MenuItem>
                                        </Items>
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Seguridad">
                                        <Items>
                                            <dx:MenuItem NavigateUrl="~/Sistema/Configuracion/Usuarios.aspx" Text="Crear Usuario">
                                                <Image Url="~/Imagenes/IconoUsuarios24.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem BeginGroup="True" NavigateUrl="~/Sistema/Configuracion/AccesoProgramas.aspx" Text="Perfil de Usuario">
                                                <Image Url="~/Imagenes/IconoPerfil24.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem BeginGroup="True" NavigateUrl="~/Sistema/Configuracion/CambioPassword.aspx" Text="Cambiar Password">
                                                <Image Url="~/Imagenes/IconoSeguridad24.png">
                                                </Image>
                                            </dx:MenuItem>
                                        </Items>
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Configurar">
                                        <Items>
                                            <dx:MenuItem BeginGroup="True" NavigateUrl="~/Sistema/Configuracion/sisTipoDocumento.aspx" Text="Tipo de Documentos">
                                                <Image Url="~/Imagenes/IconoTipoDocumento24.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem NavigateUrl="~/Sistema/Configuracion/sisSecuenciaNumerica.aspx" Text="Secuencias Numéricas">
                                                <Image Url="~/Imagenes/IconoSecuencia24.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem BeginGroup="True" NavigateUrl="~/Sistema/Configuracion/sisFormaPago.aspx" Text="Formas de Pago">
                                                <Image Url="~/Imagenes/IconoFormaPago24.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem NavigateUrl="~/Sistema/Configuracion/sisPlazoPago.aspx" Text="Plazos de Pago">
                                                <Image Url="~/Imagenes/IconoPlazoPago24.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem Text="Impuestos" Visible="False">
                                                <Image Url="~/Imagenes/IconoImpuesto24.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem BeginGroup="True" NavigateUrl="~/Ventas/Configuracion/vtaDiasCaja.aspx" Text="Dias Caja">
                                                <Image Url="~/Imagenes/IconoCalendario24.png">
                                                </Image>
                                            </dx:MenuItem>
                                        </Items>
                                    </dx:MenuItem>
                                    <dx:MenuItem Name="CerrarSesion" NavigateUrl="~/Login.aspx" Text="Cerrar Sesión">
                                    </dx:MenuItem>
                                </Items>
                            </dx:ASPxMenu>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxLabel ID="lbl_Usuario" runat="server" ForeColor="#0033CC" Text="Usuario" Width="100%">
                            </dx:ASPxLabel>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ColSpan="4" ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxLabel ID="lbl_Mensaje" runat="server" BackColor="#FFFF99" Font-Bold="True" ForeColor="#CC3300">
                            </dx:ASPxLabel>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
            <Paddings Padding="0px" />
            <Styles>
                <LayoutItem>
                    <Paddings Padding="0px" />
                </LayoutItem>
            </Styles>
            <BorderBottom BorderColor="#3399FF" BorderStyle="Solid" BorderWidth="2px" />
        </dx:ASPxFormLayout>

    </div> 
<div>
        <asp:SqlDataSource ID="sql_Empresa" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" 
            
            SelectCommand="sis_Usuario_Empresa_List" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Usuario" SessionField="Usuario" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
        <div>
            <asp:SqlDataSource ID="sql_Mensaje" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="SELECT * FROM [sis_Mensaje]"></asp:SqlDataSource>
        </div>