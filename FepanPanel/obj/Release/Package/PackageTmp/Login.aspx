<%@ Page Theme="Tema1" Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="FepanPanel.LoginDte" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>fePan</title>
</head>
<body>
    <form id="form1" runat="server">
   
    <div>

        <div id="Cabecera">
            <div id="ContenidoCabecera">
                <div id="Logotipo">
                    <img src="/Imagenes/logo.png" alt="FePAN" width="50%" />
                </div>
            </div>    
        </div>

        <div id="Login">
            <div id="Conexion">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2">
                    <Items>
                        <dx:LayoutItem ShowCaption="False" Width="280px" HorizontalAlign="Center">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lbl_Usuarios" runat="server" ForeColor="#333333" 
                                        Text="Acceso a Usuarios" Font-Bold="True" Font-Size="Large">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False" Width="220px" HorizontalAlign="Center">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lbl_Solucion" runat="server" ForeColor="#333333" 
                                        Text="Nuestra Solución" Font-Bold="True" Font-Size="Large">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutGroup ColCount="2" GroupBoxDecoration="None" RowSpan="4" 
                            Width="220px">
                            <BorderLeft BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
                            <Items>
                                <dx:LayoutItem ShowCaption="False" Height="24px" Width="15px">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxImage ID="ASPxFormLayout1_E3" runat="server" 
                                                ImageUrl="~/Imagenes/viñeta1.png">
                                            </dx:ASPxImage>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" Width="205px">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E4" runat="server" 
                                                Text="Clientes, Productos y Precios" ForeColor="#666666">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" Height="24px">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                            <dx:ASPxImage ID="ASPxImage1" runat="server" 
                                                ImageUrl="~/Imagenes/viñeta1.png">
                                            </dx:ASPxImage>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" 
                                                Text="Programación de Despachos" ForeColor="#666666">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" Height="24px">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                            <dx:ASPxImage ID="ASPxImage2" runat="server" 
                                                ImageUrl="~/Imagenes/viñeta1.png">
                                            </dx:ASPxImage>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" 
                                                Text="Cuenta Corriente Clientes" ForeColor="#666666">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" Height="24px">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                            <dx:ASPxImage ID="ASPxImage3" runat="server" 
                                                ImageUrl="~/Imagenes/viñeta1.png">
                                            </dx:ASPxImage>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server">
                                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" 
                                                Text="Facturación Masiva de Guías" ForeColor="#666666">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" Height="24px">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                            <dx:ASPxImage ID="ASPxImage4" runat="server" 
                                                ImageUrl="~/Imagenes/viñeta1.png">
                                            </dx:ASPxImage>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server">
                                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" 
                                                Text="Suite Electrónica" ForeColor="#3366FF" Font-Bold="True">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutItem Caption="Correo">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txt_Usuario" runat="server" Theme="MetropolisBlue" Width="100%">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Password">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txt_Password" runat="server" Theme="MetropolisBlue" Width="100%" Password="True">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutGroup ColCount="2" GroupBoxDecoration="None">
                            <Items>
                                <dx:EmptyLayoutItem Width="180px">
                                </dx:EmptyLayoutItem>
                                <dx:LayoutItem ShowCaption="False" Width="120px">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxButton ID="btn_Aceptar" runat="server" Height="32px" Text="Ingresar" 
                                                Theme="SoftOrange" Width="120px">
                                            </dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutItem HorizontalAlign="Center" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E2" runat="server" 
                                        Text="¿Olvidaste tu Contraseña?">
                                    </dx:ASPxHyperLink>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lbl_Mensaje" runat="server" ForeColor="#CC3300">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </div>
            <div id="Presentacion">
                <img src="/Imagenes/softscreen.png" alt="FePAN" width="100%" />
            </div>
        </div>

        <div id="Sitio">
            <div id="ColIzquierda">
                
            </div>
            <div id="ColumnaA">
                <dx:ASPxButton ID="btn_Registro" runat="server" RenderMode="Link" 
                    PostBackUrl="~/Regsitro.aspx"> 
                    <Image Url="~/Imagenes/registrate.png" Width="70%">
                    </Image>
                </dx:ASPxButton>
                <h2>Registrate</h2>
                <span>¿Mas información? Dejanos tu correo y te contactaremos</span>
            </div>
            <div id="ColumnaB">
                <dx:ASPxButton ID="btn_Cotiza" runat="server" RenderMode="Link" 
                    PostBackUrl="~/Cotizar.aspx"> 
                    <Image Url="~/Imagenes/cotiza.png" Width="70%">
                    </Image>
                </dx:ASPxButton>
                <h2>Cotizar</h2>
                <span>Encuentra el mejor precio, según el volumen de facturación</span>
            </div>
            <div id="ColumnaC">
                <dx:ASPxButton ID="btn_Demo" runat="server" RenderMode="Link" 
                    PostBackUrl="http://200.6.117.164/TestAsoft/login.aspx"> 
                    <Image Url="~/Imagenes/demo.png" Width="70%">
                    </Image>
                </dx:ASPxButton>
                <h2>Ver Demo</h2>
                <span>Si ya estas registrado, prueba nuestra solución en linea</span>
            </div>
            <div id="ColumnaD">
                <dx:ASPxButton ID="btn_Clientes" runat="server" RenderMode="Link" 
                    PostBackUrl="~/Clientes.aspx"> 
                    <Image Url="~/Imagenes/clientes.png" Width="70%">
                    </Image>
                </dx:ASPxButton>
                <h2>Clientes</h2>
                <span>Conoce la experiencia de nuestros clientes</span>
            </div>
            <div id="ColDerecha">
                
            </div>
        </div>
        <div id="Pie">
            <span>Web Diseño Richard Ibañez - Asoft</span>
        </div>
    </div>
    </form>
</body>
</html>
