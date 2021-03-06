﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Almacen2._0.Models;

namespace Almacen2._0.Views.Trabajador.Componentes
{
    public partial class Productos : System.Web.UI.Page
    {
        almacen_avance2Entities1 context = new almacen_avance2Entities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //GridView1.DataSource = context.Producto.ToList();
                //GridView1.DataBind();
                GridView1.VirtualItemCount = Count();
                CargarData(1, 2);

            };
        }

        //se llama al metodo creado para los productos, correspondiente a cargar datos de la lista de productos
        private void CargarData(int starIndex, int maxRows)
        {
            GridView1.DataSource = new MetodoProducto().GetPaginacion(starIndex, maxRows, txtDesc.Text);
            GridView1.DataBind();
        }

        //se crea el metodo Count,
        private int Count()
        {
            var desc = txtDesc.Text;
            return new MetodoProducto().GetPaginacionCount(desc);

        }
        //Carga los datos en un gridview, con contador de paginas
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            CargarData(e.NewPageIndex + 1, 2);
        }
        //Servicio para buscar el producto
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GridView1.VirtualItemCount = Count();
            CargarData(1, 2);
            panel_mensaje3.Visible = true;
            panel_mensaje3.CssClass = "alert alert-success";
            lbmensaje3.Text = "Producto encontrado";
        }

        //Servicio para poder ingresar un producto en el sistema
        protected void idaddproducto_Click(object sender, EventArgs e)
        {
            try
            {
                Producto nuevo = new Producto { id_producto = tidproductoagregar.Text, nombre = tnombreproducto.Text, precio = Convert.ToInt32(tprecioproducto.Text), stock = Convert.ToInt32(tstockproducto.Text) };

                context.Producto.Add(nuevo);
                context.SaveChanges();

                tidproductoagregar.Text = "";
                tnombreproducto.Text = "";
                tprecioproducto.Text = "";
                tstockproducto.Text = "";

                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-success";
                lbAlerta.Text = "Producto Agregado ";

                GridView1.DataSource = context.Producto.ToList();
                GridView1.DataBind();
            }
            catch (Exception)
            {
                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-danger";
                lbAlerta.Text = "Producto NO! Agregado ";
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int filaSeleccionada = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "IdVer")
            {
                //string id = "";
                string nombre = "";
                int stock = 0;

                //id = GridView1.Rows[filaSeleccionada].Cells[0].Text;
                nombre = GridView1.Rows[filaSeleccionada].Cells[1].Text;
                double precio = 0;
                string[] IngresiFinal = GridView1.Rows[filaSeleccionada].Cells[2].Text.Split('$');
                double.TryParse(IngresiFinal[1], out precio);
                int.TryParse(GridView1.Rows[filaSeleccionada].Cells[3].Text, out stock);

                //consulto por el id del producto a la base de datos y lo guardo en una variable
                var id3 = from c in context.Producto
                          where c.nombre.Equals(nombre)
                          select new { c.id_producto };
                //guardo el id de la variable consultada en un nuevo id tipo string
                string id4 = id3.ToList()[0].id_producto;
                //Carga la informacion del producto en los siguientes entradas de textos.
                tidproductoagregar.Text = id4.ToString();
                tnombreproducto.Text = nombre.ToString();
                tprecioproducto.Text = precio.ToString();
                tstockproducto.Text = stock.ToString();

                panel_mensaje3.Visible = true;
                panel_mensaje3.CssClass = "alert alert-success";
                lbmensaje3.Text = "Datos Del Producto Seleccionado";
            }

            if (e.CommandName.Equals("IdEliminar"))
            {
                string nombre = "";
                nombre = GridView1.Rows[filaSeleccionada].Cells[1].Text;

                Producto nuevo = new Producto();


                var listNombre = from litpr in context.Producto
                                 where litpr.nombre.StartsWith(nombre)
                                 select litpr;
                string id = listNombre.ToList()[0].id_producto;

                context.Producto.Remove(context.Producto.Find(id));
                context.SaveChanges();

                panel_mensaje3.Visible = true;
                panel_mensaje3.CssClass = "alert alert-success";
                lbmensaje3.Text = "Producto Eliminado!!";

                GridView1.DataSource = context.Producto.ToList();
                GridView1.DataBind();
            }
            if (e.CommandName.Equals("IdActualizar"))
            {

                try
                {
                    string id2 = tidproductoagregar.Text;
                    //id2 = GridView1.Rows[filaSeleccionada].Cells[0].Text;

                    Producto nuevo2 = new Producto();

                    var listNombre22 = from litpr in context.Producto
                                       where litpr.id_producto.Equals(id2)
                                       select litpr;
                    string idactualizar = listNombre22.ToList()[0].id_producto;

                    nuevo2 = context.Producto.Find(idactualizar);
                    nuevo2.nombre = tnombreproducto.Text;
                    nuevo2.precio = Convert.ToInt32(tprecioproducto.Text);
                    nuevo2.stock = Convert.ToInt32(tstockproducto.Text);
                    context.SaveChanges();

                    panel_mensaje3.Visible = true;
                    panel_mensaje3.CssClass = "alert alert-success";
                    lbmensaje3.Text = "Producto Editado!!";


                    GridView1.DataSource = context.Producto.ToList();
                    GridView1.DataBind();


                }
                catch (Exception)
                {
                    panel_mensaje3.Visible = true;
                    panel_mensaje3.CssClass = "alert alert-danger";
                    lbmensaje3.Text = "Error, verifique los campos";


                }

            }

        }
    }
}