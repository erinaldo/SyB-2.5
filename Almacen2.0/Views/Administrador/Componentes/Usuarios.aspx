﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Almacen2._0.Views.Administrador.Componentes.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Almacen | Juanita</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
   <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../../bower_components/bootstrap/dist/css/bootstrap.min.css"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../../bower_components/font-awesome/css/font-awesome.min.css"/>
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../../bower_components/Ionicons/css/ionicons.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="../../../dist/css/AdminLTE.min.css"/>
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../../dist/css/skins/_all-skins.min.css"/>
  <!-- Morris chart -->
  <link rel="stylesheet" href="../../../bower_components/morris.js/morris.css"/>
  <!-- jvectormap -->
  <link rel="stylesheet" href="../../../bower_components/jvectormap/jquery-jvectormap.css"/>
  <!-- Date Picker -->
  <link rel="stylesheet" href="../../../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css"/>
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../../../bower_components/bootstrap-daterangepicker/daterangepicker.css"/>
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="idprincipal" runat="server">
    <br />

<div class="content">
            <div class="row">
				
                <div class="col-md-6">

                    <!-- Profile Image -->
                    <div class="box box-primary " style="border: 1px solid rgba(31, 45, 65, 0.125);">
                        <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;">Crear Trabajador</h3>
                    </div>
                        <div class="box-body box-profile">                            
                                <div class="form-group">
                                    <label for="temail">Email: </label>
                                    <asp:TextBox runat="server" ID="temail" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="temail" Display="Dynamic"
                                        ValidationGroup="add2"> </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="tclave">Clave: </label>
                                    <asp:TextBox runat="server" ID="tclave" TextMode="Password" CssClass="form-control" placeholder="Clave"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tclave" Display="Dynamic"
                                        ValidationGroup="add2"> </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="tnombre">Nombre: </label>
                                    <asp:TextBox runat="server" ID="tnombre" CssClass="form-control" placeholder="Nombre"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tnombre" Display="Dynamic"
                                        ValidationGroup="add2"> </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="tapellido">Apellido: </label>
                                    <asp:TextBox runat="server" ID="tapellido" CssClass="form-control" placeholder="Apellido"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tapellido" Display="Dynamic"
                                        ValidationGroup="add2"> </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="tdireccion">Direccion: </label>
                                    <asp:TextBox runat="server" ID="tdireccion" CssClass="form-control" placeholder="Direccion"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tdireccion" Display="Dynamic"
                                        ValidationGroup="add2"> </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="idrol">Rol</label>
                                    <asp:DropDownList runat="server" ID="idrol" CssClass="form-control" DataTextField="nombre" DataValueField="id_rol"></asp:DropDownList>
                                </div>

                                <asp:Button runat="server" ID="idAdd"  ValidationGroup="add2" CssClass="btn btn-success" OnClick="idAdd_Click" Style="margin-bottom: 10px;" Text="Agregar" />                                
                                <asp:Panel ID="Alerta" runat="server" Visible="false">
                                    <strong role="alert">
                                        <asp:Label ID="lbAlerta" runat="server" Text=""></asp:Label>
                                    </strong>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </asp:Panel>
                            

                        </div>

                    </div>

                </div>




               <div class="col-md-6">

                    <!-- Profile Image -->
                    <div class="box box-primary " style="border: 1px solid rgba(31, 45, 65, 0.125);">
                         <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;">Buscar Trabajador</h3>
                    </div>
                        <div class="box-body box-profile">
						<div class="form-group">
						<label for="t_id_usuario">Nombre Usuario: </label>
						<div class="input-group mb-2">
							<asp:TextBox runat="server" ID="t_id_usuario" CssClass="form-control"  style="margin-bottom: 10px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="t_id_usuario" Display="Dynamic"
                        ValidationGroup="add"> </asp:RequiredFieldValidator>                           
							<div class="input-group-prepend">
								<asp:Button runat="server" ID="idbuscar" ValidationGroup="add" ToolTip="Ingrese Nombre para Buscar" CssClass="btn btn-info" OnClick="idbuscar_Click" style="margin-bottom: 10px;" Text="Buscar"  />
                                <asp:Button runat="server" ID="idEdit" ValidationGroup="add" ToolTip="Ingresar Id para Editar" CssClass="btn btn-warning" OnClick="idEdit_Click" style="margin-bottom: 10px;" Text="Editar" />
					            <asp:Button runat="server" ID="idDelete" ValidationGroup="add" ToolTip="Ingrese Id para Eliminar" CssClass="btn btn-danger" OnClick="idDelete_Click" style="margin-bottom: 10px;" Text="Eliminar" />
							</div>
						</div>
                            <asp:Panel ID="Alerta2" runat="server" Visible="false">
                                    <strong>
                                        <asp:Label ID="lbAlerta2" runat="server" Text=""></asp:Label>
                                    </strong>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </asp:Panel>
							<div class="table-responsive text-center">
							 <asp:GridView runat="server" ID="idtablatrabajador"  OnRowCommand="idtablatrabajador_RowCommand" CssClass="table table-bordered table-condensed">
                        <HeaderStyle CssClass="btn-primary"/>

                        <Columns>
                            
                        </Columns>
                                 <EmptyDataTemplate>
                                     <h4 class="text-primary"><strong>Buscar</strong>Usuario</h4>
                                 </EmptyDataTemplate>
                    </asp:GridView>
                                </div>
                            </div></div>
					</div>
				</div>
			</div>
		</div>
</asp:Content>