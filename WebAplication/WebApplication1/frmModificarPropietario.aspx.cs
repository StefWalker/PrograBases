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
    public partial class frmModificarPropietario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (txtID.Text != "")
            {
                entPropietario obj1 = negPropietario.BuscarPropietario(Convert.ToInt32(txtID.Text));
                if (obj1 != null)
                {
                    entPropietario obj = new entPropietario();
                    obj.Nombre = txtNom.Text;
                    if (txtIdentificacion.Text == "")
                    {
                        obj.Identificacion = obj1.Identificacion;
                        if (negPropietario.ModificarPropietario(obj, Int32.Parse(txtID.Text)) == 1)
                        {
                            Response.Redirect("frmPrincipal.aspx");
                        }
                        else
                        {
                            lblerror.Text = "No se pudo modificar el propietario1";
                            lblerror.Visible = true;
                        }
                    }
                    else
                    {
                        obj.Identificacion = txtIdentificacion.Text;
                        if (negPropietario.ModificarPropietario(obj, Int32.Parse(txtID.Text)) == 1)
                        {
                            Response.Redirect("frmPrincipal.aspx");
                        }
                        else
                        {
                            lblerror.Text = "No se pudo modificar el propietario";
                            lblerror.Visible = true;
                        }
                    }
                }
                else
                {
                    lblerror.Text = "No se logro encontrar el propietario";
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "Debe ingresar la identificacion para buscar";
                lblerror.Visible = true;
            }
               
        }
    }
}