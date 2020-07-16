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
    public partial class frmaModificarPropiedad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            entPropiedad obj1 = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtNum.Text));
            entPropiedad obj = new entPropiedad();
            if(txtNumero.Text == "")
            {
                obj.NumPropiedad = obj1.NumPropiedad;
                if(txtValor.Text == "")
                {
                    obj.Valor = obj1.Valor;
                    obj.Direccion = txtDireccion.Text;
                    if (negPropiedad.ModificarPropiedad(obj, Int32.Parse(txtNum.Text)) == 1)
                    {
                        Response.Redirect("frmPrincipal.aspx");
                    }
                    else
                    {
                        lblerror.Text = "No se pudo modificar el usuario";
                        lblerror.Visible = true;
                    }
                }
                else
                {
                    obj.Valor = Int32.Parse(txtValor.Text);
                    obj.Direccion = txtDireccion.Text;
                    if (negPropiedad.ModificarPropiedad(obj, Int32.Parse(txtNum.Text)) == 1)
                    {
                        Response.Redirect("frmPrincipal.aspx");
                    }
                    else
                    {
                        lblerror.Text = "No se pudo modificar el usuario";
                        lblerror.Visible = true;
                    }
                }

            }
            else
            {
                obj.NumPropiedad = Int32.Parse(txtNumero.Text);
                if (txtValor.Text == "")
                {
                    double valorp = obj1.Valor;
                    obj.Valor = valorp;
                    obj.Direccion = txtDireccion.Text;
                    if (negPropiedad.ModificarPropiedad(obj, Int32.Parse(txtNum.Text)) == 1)
                    {
                        Response.Redirect("frmPrincipal.aspx");
                    }
                    else
                    {
                        lblerror.Text = "No se pudo modificar el usuario";
                        lblerror.Visible = true;
                    }
                }
                else
                {
                    obj.Valor = Int32.Parse(txtValor.Text);
                    obj.Direccion = txtDireccion.Text;
                    if (negPropiedad.ModificarPropiedad(obj, Int32.Parse(txtNum.Text)) == 1)
                    {
                        Response.Redirect("frmPrincipal.aspx");
                    }
                    else
                    {
                        lblerror.Text = "No se pudo modificar el usuario";
                        lblerror.Visible = true;
                    }
                }
            }
            
        }
    }
}