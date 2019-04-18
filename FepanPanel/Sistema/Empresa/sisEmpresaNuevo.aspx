<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisEmpresaNuevo.aspx.vb" Inherits="FepanPanel.sisEmpresaNuevo" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxFormLayout ID="ASPxFormLayout5" runat="server" Width="100%" Theme="Moderno">
                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                            <Items>
                                <dx:LayoutGroup Caption="Datos Empresa" Width="100%" ColCount="2">
                                    <GroupBoxStyle></GroupBoxStyle>
                                    <Items>
                                        <dx:LayoutItem Caption="Descripcion" Width="50%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxTextBox ID="txt_DescripcionI" runat="server">
                                                            </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Codigo Actividad" Width="50%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxTextBox ID="txt_ActividadI" runat="server">
                                                            </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Codigo" Width="50%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxTextBox ID="txt_CodigoI" runat="server">
                                                            </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Giro" Width="50%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxTextBox ID="txt_GiroI" runat="server">
                                                            </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Dirección Empresa" Width="100%" ColCount="2">
                                    <GroupBoxStyle></GroupBoxStyle>
                                    <Items>
                                        <dx:LayoutItem Caption="Direccion" Width="50%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxTextBox ID="txt_DireccionI" runat="server">
                                                            </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Comuna" Width="50%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxTextBox ID="txt_ComunaI" runat="server">
                                                            </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Ciudad" Width="50%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxTextBox ID="txtCiudadI" runat="server">
                                                            </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Resolución" Width="100%" ColCount="2">
                                    <GroupBoxStyle></GroupBoxStyle>
                                    <Items>
                                        <dx:LayoutItem Caption="Fecha Resolucion" Width="50%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxDateEdit ID="txt_FechaResolucionI" runat="server"></dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Numero Resolucion" Width="50%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxTextBox ID="txt_ResolucionI" runat="server">
                                                            </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup ShowCaption="False" Width="100%" ColCount="2" GroupBoxStyle-Border-BorderStyle="None">
                                    <GroupBoxStyle Border-BorderStyle="None"></GroupBoxStyle>
                                    <Items>
                                        <dx:LayoutItem ShowCaption="False" Width="75%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <br />
                                                    <div class="alert alert-success" id="dvMensajeS" width="100%" visible="false" runat="server" role="alert">
                                                                            <a class="alert-link">
                                                                                <dx:ASPxLabel CssClass="alert-link" ID="lbl_Mensaje" ForeColor="Green" runat="server">
                                                                                </dx:ASPxLabel>
                                                                            </a>
                                                                        </div>
                                                                        <div class="alert alert-danger" role="alert" id="dvMensajeE" width="100%" visible="false" runat="server">
                                                                            <a class="alert-link">
                                                                                <dx:ASPxLabel CssClass="alert-link" ID="lbl_MensajeE" ForeColor="Red" runat="server">
                                                                                </dx:ASPxLabel>
                                                                            </a>
                                                                        </div>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem ShowCaption="False" Width="25%" HorizontalAlign="Right">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxButton ID="btn_GrabarI" runat="server" Text="Grabar" Width="100%" OnClick="btn_GrabarI_Click">
                                                    </dx:ASPxButton>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                        </dx:ASPxFormLayout>
        </div>
                        <!--DataSources-->
            <div>
                <asp:SqlDataSource ID="sql_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString3 %>" InsertCommand="INSERT INTO sis_Empresa(Codigo, Descripcion, Codigo_Actividad, Giro, Numero_Resolucion, Fecha_Resolucion, Direccion, Comuna, Ciudad) VALUES (@Codigo, @Descripcion, @Codigo_Actividad, @Giro, @Numero_Resolucion, @Fecha_Resolucion, @Direccion, @Comuna, @Ciudad)">
                    <InsertParameters>
                        <asp:Parameter Name="Codigo" />
                        <asp:Parameter Name="Descripcion" />
                        <asp:Parameter Name="Codigo_Actividad" />
                        <asp:Parameter Name="Giro" />
                        <asp:Parameter Name="Numero_Resolucion" />
                        <asp:Parameter Name="Fecha_Resolucion" />
                        <asp:Parameter Name="Direccion" />
                        <asp:Parameter Name="Comuna" />
                        <asp:Parameter Name="Ciudad" />
                    </InsertParameters>
                </asp:SqlDataSource>
        </div>
        <!--End DataSources-->
    </form>
</body>
</html>
