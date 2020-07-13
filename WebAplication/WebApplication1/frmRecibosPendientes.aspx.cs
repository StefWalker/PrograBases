using CapaEntidades;
using CapaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmRecibosPendientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtFinca.Text != null)
            {
                entUsuario obj0 = (entUsuario)Session["nombre"];
                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtFinca.Text));
                if (obj0 != null && obj != null)
                {
                    entProUsuario obj2 = negProUsuario.BuscarProUsuario(obj.ID_Propiedad, obj0.ID_Usuario);
                    if (obj2 != null)
                    {
                        recibosPendientes.DataSource = negRecibos.ListarRecibos(obj.ID_Propiedad);
                        recibosPendientes.DataBind();
                    }
                    else
                    {
                        lblerror.Text = "Dicha Propiedad no corresponde a este usuario";
                        lblerror.Visible = true;
                    }
                }
            }
            else
            {
                lblerror.Text = "Debe ingresar un numero de propiedad";
                lblerror.Visible = true;
            }
        }

    }
}
