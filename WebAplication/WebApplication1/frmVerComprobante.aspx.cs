﻿using CapaEntidades;
using CapaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmVerComprobante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
            int ID_Comprobante = Convert.ToInt32(Request.QueryString["ID_Comprobante"]);
            if (Request.QueryString["ID_Comprobante"] != null)
            {
               
                entComprobante obj = negComprobante.BuscarComprobante(ID_Comprobante);
                if (obj != null)
                {
                    numero.Text = Convert.ToString(obj.ID_Comprobante);
                    propiedad.Text = Convert.ToString(obj.NumPropiedad);
                    Fecha.Text = Convert.ToString(obj.Fecha);
                    medio.Text = Convert.ToString(obj.MontoPagado);//eSTE DEBO CAMBIARLO
                    monto.Text = Convert.ToString(obj.MontoPagado);

                    GridView1.DataSource = negRecibos.ListarRecibos(52); //Debo cambiar el sp que vayamos a utilizar donde me saque aquellas en que su comprobante es igual
                    GridView1.DataBind();
                    for (int i = 0; i < GridView1.Rows.Count; i++)
                     { 
                        int id = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);
                        entConceptoCobro tipo = negConceptoCobro.BuscarConcepto(id);
                        if (tipo != null)
                        {
                            GridView1.Rows[0].Cells[3].Text = tipo.Concepto;
                            GridView1.Rows[0].Cells[4].Text =Convert.ToString(tipo.DiaVencimiento);
                        }
                        else
                        {
                            lblError.Text = "No se encontro un concepto de cobro asociado.";
                            lblError.Visible = true;
                        }
                     }
                 }
           
                else
                {
                    lblError.Text = "No se encontro el comprobante";
                    lblError.Visible = true;
                }

            }
            else
            {
                lblError.Text = "Error al buscar el ID del comprobante";
                lblError.Visible = true;
            }
            
            
        }
    }
}