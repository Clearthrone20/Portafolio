<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sisPrograma.aspx.vb" Inherits="FepanPanel.sisPrograma" %>

<%@ Register Src="~/Sistema/Menu.ascx" TagPrefix="bot" TagName="Menu" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Fepan - Documentos Rechazados</title>
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
        ASPxClientControl.GetControlCollection().ControlsInitialized.AddHandler(function (s, e) {
            UpdateGridHeight();
        });
        ASPxClientControl.GetControlCollection().BrowserWindowResized.AddHandler(function (s, e) {
            UpdateGridHeight();
        });
    </script>
<!--End Script Grilla responsive-->
</head>

<body>

    <form id="form1" runat="server">

        <div class="content-wrapper">
            <div class="container-fluid">
                <br />
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="sisMenuPanelB.aspx">Inicio</a>
                    </li>
                    <li class="breadcrumb-item active">Documentos Rechazados</li>
                </ol>
                <!--Contenedor Pagina-->
               <div>
                    <dx:ASPxGridView ID="grid_Detalle"  runat="server" Width="100%" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="sql_Detalle" EnableRowsCache="False" KeyFieldName="Id_Programa">
                    <SettingsCommandButton>
                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                    </SettingsCommandButton>
                    <SettingsDataSecurity AllowDelete="False" />
                        <Settings ShowFilterRow="True" />
                    <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>
                    <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                    <EditFormLayoutProperties>
                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="300" />
                    </EditFormLayoutProperties>
                    <SettingsEditing EditFormColumnCount="1" Mode="EditForm"></SettingsEditing>
                    <Columns>
                    <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowClearFilterButton="True" >
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Codigo" VisibleIndex="1" AdaptivePriority="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="2" AdaptivePriority="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Sistema" VisibleIndex="3" AdaptivePriority="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Id_Programa" ReadOnly="True" VisibleIndex="4" AdaptivePriority="2">
                    <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SubSistema" VisibleIndex="5" AdaptivePriority="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Ejecutar" VisibleIndex="6" AdaptivePriority="2">
                    </dx:GridViewDataCheckColumn>
                    </Columns>
                    <SettingsPager PageSize="20" NumericButtonCount="6" />
                    <Styles>
                    <Cell Wrap="False"></Cell>
                    <Header BackColor="#99CCFF" Font-Bold="False" ForeColor="Black">
                    </Header>
                    <SelectedRow BackColor="#FFFF99">
                    </SelectedRow>
                    <FocusedRow BackColor="#FFFF99">
                    </FocusedRow>
                    </Styles>
                </dx:ASPxGridView>
        </div>
                <!--End Contenedor Pagina-->
            </div>

        </div>
<!--DataSources-->
        <div>
            <asp:SqlDataSource ID="sql_Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" DeleteCommand="DELETE FROM [sis_Programa] WHERE [Id_Programa] = @Id_Programa" InsertCommand="INSERT INTO [sis_Programa] ([Codigo], [Descripcion], [Sistema], [SubSistema], [Ejecutar]) VALUES (@Codigo, @Descripcion, @Sistema, @SubSistema, @Ejecutar)" SelectCommand="SELECT * FROM [sis_Programa]" UpdateCommand="UPDATE [sis_Programa] SET [Codigo] = @Codigo, [Descripcion] = @Descripcion, [Sistema] = @Sistema, [SubSistema] = @SubSistema, [Ejecutar] = @Ejecutar WHERE [Id_Programa] = @Id_Programa">
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
<!--End DataSources-->
    </form>
<!--Ascx Menu-->
    <div>

        <bot:Menu runat="server" ID="Menu" />

    </div>
<!--End Ascx Menu-->
</body>
</html>



