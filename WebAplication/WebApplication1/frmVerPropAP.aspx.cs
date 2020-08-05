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
    public partial class frmVerPropAP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            entUsuario obj = (entUsuario)Session["nombre"];
            if (obj != null)
            {
                grvPropiedades.DataSource = negPropiedad.ListarPropiedadesUser(obj.ID_Usuario);
                grvPropiedades.DataBind();

            }
            else
            {
                lblerror.Text = "Se produjo un error al sacar las propiedades";
                lblerror.Visible = true;
            }
        }

        protected void grvPropiedades_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("frmVerAP.aspx?ID_Propiedad=" + grvPropiedades.Rows[grvPropiedades.SelectedIndex].Cells[0].Text);
        }
    }
}