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
            entUsuario obj0 = (entUsuario)Session["nombre"];
            int ID_Propiedad = Convert.ToInt32(Request.QueryString["ID_Propiedad"]);

            if (obj0 != null)
            {
                if (Request.QueryString["ID_Propiedad"] != null)
                {
                    entProUsuario obj2 = negProUsuario.BuscarProUsuario(ID_Propiedad, obj0.ID_Usuario);
                    entPropiedad objPropiedad = negPropiedad.BuscarPropiedadID(ID_Propiedad);
                    if (obj2 != null)
                    {
                        if (objPropiedad != null)
                        {
                            GridView1.DataSource = negComprobante.ListarComprobantes(objPropiedad.NumPropiedad);
                            GridView1.DataBind();
                        }
                        else
                        {
                            lblerror.Text = "Aqui";
                            lblerror.Visible = true;
                        }
                    }
                    else
                    {
                        lblerror.Text = "Dicha Propiedad no corresponde a este usuario";
                        lblerror.Visible = true;
                    }
                }
                else
                {
                    lblerror.Text = "Error al buscar el ID de la propiedad";
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "Esta vacio el objeto";
                lblerror.Visible = true;
            }
        }
    }
}