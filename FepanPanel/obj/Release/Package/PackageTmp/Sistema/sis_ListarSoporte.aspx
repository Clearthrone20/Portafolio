<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sis_ListarSoporte.aspx.vb" Inherits="FepanPanel.sis_ListarSoporte" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/fepanPrincipal.ascx" TagPrefix="uc1" TagName="fepanPrincipal" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        var IdSoporte;
        IdSoporte = 0;
        
        function Menu(e) {
            switch (e.item.name) {
                case 'Filtros':
                    PopUpFiltros.Show();
                    break
                case 'Nuevo':
                    cbNue.PerformCallback('Limpiar');
                    PopUpNuevo.Show();
                    break;
                case 'Asignar':
                    cbAsig.PerformCallback('Limpiar');
                    PopUpAsignar.Show();
                    break;
                case 'Cerrar':
                    cbCer.PerformCallback('Limpiar');
                    PopUpCerrar.Show();
                    break;
               case 'Excel':
                    PopUpExcel.Show();
                    break;
           }
        }
       function OnClickCargar() {
           PopUpFiltros.Hide();
           grid.PerformCallback('Actualizar');
        }
       function OnClickExcel() {
           PopUpExcel.Hide();
       }
       function Asignar(values) {
           IdSoporte = values[0];
           cbAsig.PerformCallback('Asignar;' + IdSoporte);
           grid.PerformCallback('Actualizar');
           //PopUpAsignar.Hide();
       }
       function Cerrar(values) {
           IdSoporte = values[0];
           cbCer.PerformCallback('Cerrar;' + IdSoporte);
           grid.PerformCallback('Actualizar');
       }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:fepanPrincipal runat="server" ID="fepanPrincipal" />
    </div>
    <div>
        <dx:ASPxRibbon ID="ASPxRibbon1" runat="server" EnableTheming="True" 
        ShowFileTab="False" Theme="MetropolisBlue" 
        ShowGroupLabels="False">
            <Tabs>
                <dx:RibbonTab Name="Menu" Text="PANEL DE SOPORTE">
                    <Groups>
                    <dx:RibbonGroup Name="Filtros" Text="Seleccion">
                       <Items>
                            <dx:RibbonButtonItem Name="Filtros" Size="Large" Text="Seleccionar Datos">
                                <LargeImage IconID="filter_filter_32x32">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                    
                    <dx:RibbonGroup Name="Editar" Text="Editar">
                        <Items>
                            <dx:RibbonButtonItem Name="Nuevo" Size="Large" Text="Nuevo">
                                <LargeImage IconID="actions_addfile_32x32">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="Asignar" Size="Large" Text="Asignar">
                                <LargeImage IconID="edit_edit_32x32office2013">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="Cerrar" Size="Large" Text="Cerrar">
                                <LargeImage IconID="edit_customization_32x32office2013">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                        
                     <dx:RibbonGroup Name="Reportes" Text="Reportes">
                        <Items>
                            <dx:RibbonButtonItem Name="Excel" Size="Large" Text="Excel">
                                <LargeImage IconID="export_exporttoxls_32x32">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>

                    </Groups>
                </dx:RibbonTab>
            </Tabs>
         <ClientSideEvents CommandExecuted="function(s, e) {Menu(e);}" />
        </dx:ASPxRibbon>
    </div>
    <div>
        <dx:ASPxGridView ID="grid_Detalle" runat="server" AutoGenerateColumns="False" DataSourceID="sql_Detalle" KeyFieldName="Id_Soporte" ClientInstanceName="grid">

            <SettingsBehavior EnableRowHotTrack="True" AllowSelectByRowClick="True"></SettingsBehavior>

         <SettingsDataSecurity AllowDelete="False"></SettingsDataSecurity>

            <ClientSideEvents RowClick="function(s, e) {visibleIndex = e.visibleIndex;}" />
                  
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2" Width="120px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="3" Caption="Fecha Soporte" Width="120px">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Tipo_Soporte" VisibleIndex="4" Caption="Tipo Soporte" Width="80px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Motivo" VisibleIndex="5" Width="150px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Responsable" VisibleIndex="6" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Solucion" VisibleIndex="9" Width="150px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Cierre" VisibleIndex="10" Width="120px" Caption="Fecha Cierre">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="1" Caption="Cliente" Width="200px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Estado" FieldName="Descripcion_Estado" VisibleIndex="8" Width="80px">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
        <div>
            <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True"
                ClientInstanceName="PopUpFiltros" HeaderText="Seleccionar Parametros" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                Width="500px">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                               <dx:ASPxFormLayout runat="server" ColCount="2">
                                        <Items>
                                            <dx:LayoutItem Caption="Empresa" ColSpan="2" Name="Empresa">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxComboBox ID="cmb_Empresa" runat="server" Width="100%" DataSourceID="sql_Empresa" SelectedIndex="0" TextField="Descripcion" ValueField="Id_Empresa">
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Fecha Inicio" Name="Fecha Inicio">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="cmb_FechaIni" runat="server">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Fecha Fin" Name="Fecha Fin">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="cmb_FechaFin" runat="server">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Responsable" ColSpan="2">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxComboBox ID="cmb_ResponsableFiltro" runat="server" Width="100%" DataSourceID="sql_Responsable" TextField="Responsable" ValueField="Responsable">
                                                            <Items>
                                                                <dx:ListEditItem Selected="True" Text="TODOS" Value="TODOS" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Usuario" ColSpan="2">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxComboBox ID="cmb_UsuarioFiltro" runat="server" Width="100%" DataSourceID="sql_Usuario" TextField="Usuario" ValueField="Usuario">
                                                            <Items>
                                                                <dx:ListEditItem Selected="True" Text="TODOS" Value="TODOS" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Estado" Name="Estado">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxComboBox ID="cmb_Estado" runat="server" SelectedIndex="0">
                                                            <Items>
                                                                <dx:ListEditItem Selected="True" Text="TODAS" Value="0" />
                                                                <dx:ListEditItem Text="Pendiente" Value="1" />
                                                                <dx:ListEditItem Text="En Proceso" Value="2" />
                                                                <dx:ListEditItem Text="Terminado" Value="3" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Name="Consultar" ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxButton ID="btn_Consultar" runat="server" Text="Consultar" AutoPostBack="False">
                                                            <ClientSideEvents Click="function(s, e) {OnClickCargar()}" />
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:ASPxFormLayout>
                      </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
        <div>
             <asp:SqlDataSource ID="sql_Empresa2" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" 
                 SelectCommand="SELECT Descripcion, Id_Empresa FROM sis_Empresa " 
                 UpdateCommand="UPDATE sis_Soporte SET Fecha_Cierre = @Fecha_Cierre, Solucion = @Solucion, Estado = @Estado WHERE Id_Soporte = @Id_Soporte">
                  <UpdateParameters>
                    <asp:Parameter Name="Id_Soporte" Type="Int32" />
                    <asp:Parameter Name="Estado" Type="Int32" />
                    <asp:Parameter Name="Fecha_Cierre" Type="String" />
                    <asp:Parameter Name="Solucion" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="SELECT 'TODAS' AS Descripcion, 0 AS Id_Empresa UNION SELECT Descripcion, Id_Empresa FROM sis_Empresa ">
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Responsable" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="SELECT 'RESPONSABLE SIN ASIGNAR' AS Responsable FROM sis_Soporte WHERE (Responsable IS NULL) UNION SELECT 'TODOS' AS Responsable UNION SELECT DISTINCT Responsable FROM sis_Soporte AS sis_Soporte_1 WHERE (Responsable IS NOT NULL)"></asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Usuario" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" SelectCommand="SELECT DISTINCT Usuario FROM sis_Soporte UNION SELECT 'TODOS' AS Usuario"></asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" 
                SelectCommand="sis_ListarSoporte" SelectCommandType="StoredProcedure" 
                InsertCommand="INSERT INTO sis_Soporte(Id_Empresa, Usuario, Fecha, Tipo_Soporte, Motivo, Estado) VALUES (@Id_Empresa,@Usuario,@Fecha,@Tipo_Soporte,@Motivo,@Estado)" 
                UpdateCommand="UPDATE sis_Soporte SET Responsable =@Responsable, Estado =@Estado WHERE Id_Soporte = @Id_Soporte">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter DefaultValue="" Name="Fecha_Ini" Type="String" />
                    <asp:Parameter Name="Fecha_Fin" Type="String" />
                    <asp:Parameter Name="Estado" Type="Int32" />
                    <asp:Parameter Name="Responsable" Type="String" />
                    <asp:Parameter Name="Usuario" Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Fecha" Type="String" />
                    <asp:Parameter Name="Tipo_Soporte" Type="String" />
                    <asp:Parameter Name="Motivo" Type="String" />
                    <asp:Parameter Name="Estado" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Fecha" Type="String" />
                    <asp:Parameter Name="Tipo_Soporte" Type="String" />
                    <asp:Parameter Name="Motivo" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
       
        <div>
             <dx:ASPxHiddenField ID="ASPxHiddenField1" runat="server">
            </dx:ASPxHiddenField>
        </div>
        <div>
            <asp:SqlDataSource ID="sql_Asignar" runat="server" ConnectionString="<%$ ConnectionStrings:FepanConnectionString %>" 
             UpdateCommand="UPDATE sis_Soporte SET Responsable =@Responsable, Estado =@Estado WHERE Id_Soporte = @Id_Soporte">
                <UpdateParameters>
                    <asp:Parameter Name="Responsable" Type="String" />
                    <asp:Parameter Name="Estado" Type="Int32" />
                    <asp:Parameter Name="Id_Soporte" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div>
             <dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" AllowDragging="True"
                ClientInstanceName="PopUpNuevo" HeaderText="Seleccionar Parametros" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                Width="500px">
                 <ClientSideEvents CloseButtonClick="function(s, e) {
	grid.PerformCallback('Actualizar');
}" />
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                            <dx:ASPxCallbackPanel ID="ASPxCallbackPanelNuevo" runat="server" Width="100%" 
                                ClientInstanceName="cbNue"> 
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                         <dx:ASPxFormLayout runat="server" ColCount="2" Width="100%">
                                          <Items>
                                            <dx:LayoutItem Caption="Empresa" ColSpan="2" Name="Empresa">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxComboBox ID="cmb_EmpresaNuevo" runat="server" Width="100%" DataSourceID="sql_Empresa2" SelectedIndex="0" TextField="Descripcion" ValueField="Id_Empresa">
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Usuario" Name="Usuario" ColSpan="2">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="txt_Usuario" runat="server" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Fecha" ColSpan="2" Name="Fecha">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="cmb_Fecha" runat="server" Width="100%">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Tipo Soporte" Name="Tipo_Soporte" ColSpan="2">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxComboBox ID="cmb_TipoSoporte" runat="server" Width="100%" SelectedIndex="0">
                                                            <Items>
                                                                <dx:ListEditItem Selected="True" Text="GENERAL" Value="GENERAL" />
                                                                <dx:ListEditItem Text="LIBROS" Value="LIBROS" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Motivo" Name="Motivo" ColSpan="2">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxMemo ID="txt_Motivo" runat="server" Height="100px" Width="100%">
                                                        </dx:ASPxMemo>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False" Width="75%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxLabel ID="lbl_MensajeNuevo" runat="server" ForeColor="Red" Text="SOPORTE AGREGADO CORRECTAMENTE!">
                                                        </dx:ASPxLabel>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Name="Consultar" ShowCaption="False" Width="25%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxButton ID="btn_Grabar" runat="server" Text="Grabar" AutoPostBack="False">
                                                            <ClientSideEvents Click="function(s, e) {cbNue.PerformCallback('Nuevo');}" />
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:ASPxFormLayout>
                                 </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
        <div>
             <dx:ASPxPopupControl ID="ASPxPopupControl3" runat="server" AllowDragging="True"
                ClientInstanceName="PopUpAsignar" HeaderText="Seleccionar Parametros" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                Width="500px">
                 <ClientSideEvents CloseButtonClick="function(s, e) {
	grid.PerformCallback('Actualizar');
}" />
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                         <dx:ASPxCallbackPanel ID="ASPxCallbackPanelAsignar" runat="server" Width="100%" 
                                ClientInstanceName="cbAsig"> 
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                <dx:ASPxFormLayout runat="server" ColCount="2" Width="100%">
                                        <Items>
                                            <dx:LayoutItem Caption="Asignar Responsable" Name="Responsable" Width="75%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxComboBox ID="cmb_Responsable" runat="server" SelectedIndex="0">
                                                            <Items>
                                                                <dx:ListEditItem Selected="True" Text="Richard Ibanez" Value="Richard Ibanez" />
                                                                <dx:ListEditItem Text="Paulina Jara" Value="Paulina Jara" />
                                                                <dx:ListEditItem Text="Gabriel Guzman" Value="Gabriel Guzman" />
                                                                <dx:ListEditItem Text="Isabel Cabezas" Value="Isabel Cabezas" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Name="AsignarSoporte" ShowCaption="False" Width="25%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxButton ID="btn_Asignar" runat="server" Text="Asignar" AutoPostBack="False">
                                                            <ClientSideEvents Click="function(s, e) {var values = grid.GetRowValues(visibleIndex, 'Id_Soporte;Id_Empresa;Usuario', Asignar);}" />
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ColSpan="2" ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxLabel ID="lbl_MensajeAsignar" runat="server" ForeColor="Red" Text="RESPONSABLE ASIGNADO CORRECTAMENTE!">
                                                        </dx:ASPxLabel>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:ASPxFormLayout>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
        <div>
             <dx:ASPxPopupControl ID="ASPxPopupControl5" runat="server" AllowDragging="True"
                ClientInstanceName="PopUpCerrar" HeaderText="Seleccionar Parametros" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                Width="500px">
                 <ClientSideEvents CloseButtonClick="function(s, e) {
	grid.PerformCallback('Actualizar');
}" />
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanelCerrar" runat="server" Width="100%" 
                                ClientInstanceName="cbCer"> 
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                <dx:ASPxFormLayout runat="server" ColCount="2" Width="100%">
                                        <Items>
                                            <dx:LayoutItem Caption="Fecha de Cierre" Name="Fecha Cierre" Width="75%" ColSpan="2">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="cmb_FechaCierre" runat="server">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Solucion" ColSpan="2" Name="Solucion">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxMemo ID="txt_Solucion" runat="server" Height="100px" Width="100%">
                                                        </dx:ASPxMemo>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False" Width="75%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxLabel ID="lbl_MensajeCerrado" runat="server" ForeColor="Red" Text="SOPORTE CERRADO CORRECTAMENTE!">
                                                        </dx:ASPxLabel>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Name="Cerrar" ShowCaption="False" Width="25%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxButton ID="btn_Cerrar" runat="server" Text="Cerrar" AutoPostBack="False">
                                                            <ClientSideEvents Click="function(s, e) {var values = grid.GetRowValues(visibleIndex, 'Id_Soporte;Id_Empresa;Usuario', Cerrar);}" />
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:ASPxFormLayout>
                               </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
         
        <div>
             <dx:ASPxPopupControl ID="ASPxPopupControl4" runat="server" HeaderText="Exportar Excel" Width="500px" ClientInstanceName="PopUpExcel" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" CloseAction="CloseButton" Modal="True">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">

                        <Items>
                            <dx:LayoutGroup Caption="Exportar Excel" ColCount="2">
                                <Items>
                                    <dx:LayoutItem Caption="Nombre">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="txt_NombreExcel" runat="server" Text="Documentos">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxButton ID="btn_ExportarExcel" runat="server" ImagePosition="Top" Text="Exportar Excel" ClientInstanceName="ExportarExcel" AutoPostBack="False">
                                                    <Image IconID="export_exporttoxls_32x32">
                                                    </Image>
                                                    <ClientSideEvents Click="function(s, e) {OnClickExcel()}" />
                                                </dx:ASPxButton>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                        </Items>

                    </dx:ASPxFormLayout>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        </div>
        <div>
        <dx:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="grid_Detalle">
        </dx:ASPxGridViewExporter>
        </div>
    </form>
</body>
</html>
