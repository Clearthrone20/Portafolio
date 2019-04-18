<%@ Control Language="vb" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<div style="border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000080">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="4" 
        Width="100%">
        <Items>
            <dx:LayoutItem ShowCaption="False" Width="100px" HorizontalAlign="Center" 
                VerticalAlign="Middle">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxImage ID="img_Logo" runat="server" ImageUrl="~/Imagenes/Logo SoftPan.jpg" 
                            Width="110%">
                        </dx:ASPxImage>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Empresa" Width="250px" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxComboBox ID="cmb_Empresa" runat="server" Width="100%" Theme="Moderno" 
                            DataSourceID="sql_Empresa" EnableTheming="True" TextField="Descripcion" 
                            ValueField="Id_Empresa">
                        </dx:ASPxComboBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False" Width="90%">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxMenu ID="ASPxMenu1" runat="server" EnableTheming="True" Theme="Moderno">
                            <Items>
                                <dx:MenuItem Text="Módulo" NavigateUrl="#">
                                    <Items>
                                        <dx:MenuItem Text="Inventarios" NavigateUrl="~/SinAcceso.aspx">
                                            <Image Url="~/Imagenes/IconoMovtoStock24.png">
                                            </Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Text="Compras" NavigateUrl="~/SinAcceso.aspx">
                                            <Image Url="~/Imagenes/IconoPedidos24.png">
                                            </Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Text="Ventas" NavigateUrl="~/Ventas/Ventas.aspx">
                                            <Image Url="~/Imagenes/IconoAplicar24.png">
                                            </Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem BeginGroup="True" Text="Factura Electrónica" NavigateUrl="~/FacturaElectronica/FacturaElectronica.aspx">
                                            <Image Url="~/Imagenes/IconoVentas24.png">
                                            </Image>
                                        </dx:MenuItem>
                                    </Items>
                                </dx:MenuItem>
                                <dx:MenuItem Text="Seguridad" NavigateUrl="#">
                                    <Items>
                                        <dx:MenuItem Text="Crear Usuario" NavigateUrl="~/Sistema/Configuracion/Usuarios.aspx">
                                            <Image Url="~/Imagenes/IconoUsuarios24.png">
                                            </Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Text="Perfil de Usuario" BeginGroup="True" NavigateUrl="~/Sistema/Configuracion/AccesoProgramas.aspx">
                                            <Image Url="~/Imagenes/IconoPerfil24.png">
                                            </Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Text="Cambiar Password" BeginGroup="True" NavigateUrl="~/Sistema/Configuracion/CambioPassword.aspx">
                                            <Image Url="~/Imagenes/IconoSeguridad24.png">
                                            </Image>
                                        </dx:MenuItem>
                                    </Items>
                                </dx:MenuItem>
                                <dx:MenuItem Text="Configurar" NavigateUrl="#">
                                    <Items>
                                        <dx:MenuItem Text="Parametros Generales" NavigateUrl="~/Sistema/Sistema.aspx" Visible="False">
                                            <Image Url="~/Imagenes/IconoConfigurar24.png">
                                            </Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Text="Empresas" NavigateUrl="~/Sistema/Configuracion/Empresas.aspx">
                                            <Image Url="~/Imagenes/IconoEmpresa24.png">
                                            </Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem BeginGroup="True" NavigateUrl="~/Sistema/Configuracion/sisTipoDocumento.aspx"
                                            Text="Tipo de Documentos">
                                            <Image Url="~/Imagenes/IconoTipoDocumento24.png">
                                            </Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem NavigateUrl="~/Sistema/Configuracion/sisSecuenciaNumerica.aspx" Text="Secuencias Numéricas">
                                            <Image Url="~/Imagenes/IconoSecuencia24.png">
                                            </Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem BeginGroup="True" NavigateUrl="~/Sistema/Configuracion/sisFormaPago.aspx"
                                            Text="Formas de Pago">
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
                                    </Items>
                                </dx:MenuItem>
                                <dx:MenuItem Text="Cerrar Sesión" Name="CerrarSesion" NavigateUrl="~/Login.aspx">
                                </dx:MenuItem>
                            </Items>
                        </dx:ASPxMenu>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False" Width="150px">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="lbl_Usuario" runat="server">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
</div>
<div>
        <asp:SqlDataSource ID="sql_Empresa" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" 
            
            SelectCommand="SELECT [Id_Empresa], [Descripcion] FROM [sis_Empresa] WHERE ([Contrato] = @Contrato)">
            <SelectParameters>
                <asp:CookieParameter DefaultValue="0" Name="Contrato" CookieName="Contrato" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>