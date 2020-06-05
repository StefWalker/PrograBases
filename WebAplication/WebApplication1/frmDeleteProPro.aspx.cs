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
    public partial class frmDeleteProPro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (txtPropiedad.Text != "" && txtId.Text != "")
            {


                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
                entPropietario obj1 = negPropietario.BuscarPropietario(Convert.ToInt32(txtId.Text));
                if (obj != null && obj1 != null)
                {
                    int delete = negProPro.DeleteProPro(obj.ID_Propiedad, obj1.ID_Propietario);
                    if (delete == 1)
                    {
                        Response.Redirect("frmPrincipal.aspx");
                    }
                    else
                    {

                        lblerror.Text = "No se logró borrar correctamente "; //Sino tira error 
                        lblerror.Visible = true;
                    }
                }
                else
                {
                    lblerror.Text = "No se encontraron los datos ingresados "; //Sino tira error 
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "Debe ingresar todos los datos solicitados "; //Sino tira error 
                lblerror.Visible = true;
            }
        }
    }
}