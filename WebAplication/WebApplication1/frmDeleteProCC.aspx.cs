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
    public partial class frmProCCDelete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            entConceptoCobro obj = negConceptoCobro.BuscarConcepto(Convert.ToInt32(txtId.Text));
            entPropiedad obj1 = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
            if (obj != null && obj1 != null)
            {
                int delete = negProCC.DeleteProxCC(obj.ID_CC, obj1.ID_Propiedad);
                if (delete == 1)
                {
                    Response.Redirect("frmPrincipal.aspx");
                }
                else
                {

                    lblerror.Text = "No se logró borrar correctamente el concepto cobro"; //Sino tira error 
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "No se encuentran los datos ingresados"; //Sino tira error 
                lblerror.Visible = true;
            }
        }
    }
}