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
    public partial class frmDeleteProJuridicoPro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
           
            entPropJuridico obj = negPropJuridico.BuscarPropJuridico(txtId.Text);
            entPropiedad obj1 = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
            if (obj != null && obj1 != null)
            {
                int delete = negProxProJuridico.DeleteProxProJuridico(obj.ID_Juridico,obj1.ID_Propiedad);
                if (delete == 1)
                {
                    Response.Redirect("frmPrincipal.aspx");
                }
                else
                {

                    lblerror.Text = "No se logró borrar correctamente el propietario"; //Sino tira error 
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