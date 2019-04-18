<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisEmpresaModRes.aspx.vb" Inherits="FepanPanel.sisEmpresaModRes" %>

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
            <dx:ASPxFormLayout ID="ASPxFormLayout4" runat="server" Width="100%">
                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="500" />
                            <Items>
                                <dx:LayoutGroup ShowCaption="False" Width="100%" ColCount="2" GroupBoxStyle-Border-BorderStyle="None">
                                    <GroupBoxStyle Border-BorderStyle="None"></GroupBoxStyle>
                                    <Items>
                                        <dx:LayoutItem Caption="Fecha Resolucion" Width="50%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxDateEdit ID="txt_FechaResolucion" runat="server"></dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Numero Resolucion" Width="50%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                                    <dx:ASPxTextBox ID="txt_NResolucion" runat="server">
                                                            </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
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
                                                    <dx:ASPxButton ID="btn_Grabar_Resolucion" runat="server" Text="Grabar" Width="100%" RenderOption="Primary" AutoPostBack="false" OnClick="btn_Grabar_Resolucion_Click">
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
                <asp:SqlDataSource ID="sql_ModResolucionEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString3 %>" UpdateCommand="UPDATE sis_Empresa SET Numero_Resolucion = @Numero_Resolucion, Fecha_Resolucion = @Fecha_Resolucion WHERE (Id_Empresa = @Id_Empresa)">
                    <UpdateParameters>
                        <asp:Parameter Name="Numero_Resolucion" />
                        <asp:Parameter Name="Fecha_Resolucion" />
                        <asp:Parameter Name="Id_Empresa" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        </div>
        <!--End DataSources-->
    </form>
</body>
</html>
