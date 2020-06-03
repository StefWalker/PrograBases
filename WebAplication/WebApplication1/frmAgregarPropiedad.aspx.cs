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
    public partial class frmAgregarPropiedad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click1(object sender, EventArgs e)
        {

            if (txtDescripcion.Text != "" && txtNumeroPropiedad.Text != "" && txtValor.Text != "" && txtFecha.Text != "" && txtDireccion.Text != "" && txtNumeroPropiedad.Text != "" && IdPropietario.Text != "")
            {
                entPropiedad obj = new entPropiedad();
                obj.NumPropiedad = Int32.Parse(txtNumeroPropiedad.Text);
                obj.Valor = decimal.Parse(txtValor.Text);
                obj.Direccion = txtDireccion.Text;
                obj.Descripcion = txtDescripcion.Text;
                if (negPropiedad.AgregarPropiedad(obj) == 1)
                {
                    entPropietario obj1 = negPropietario.BuscarPropietario(Convert.ToInt32(IdPropietario.Text));
                    entPropiedad obj2 = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtNumeroPropiedad.Text));
                    if (obj1 != null  && obj2 != null)
                    {
                        entProPro obj3 = new entProPro();
                        obj3.Propiedad = obj2.ID_Propiedad;
                        obj3.Propietario = obj1.ID_Propietario;
                        if (negProPro.AgregarProPro(obj3) == 1)
                        {
                            Response.Redirect("frmPrincipal.aspx");
                        }
                        else
                        {
                            lblerror.Text = "No se pudo agregar"; //Sino tira error 
                            lblerror.Visible = true;
                            Response.Redirect("frmUnirProPro.aspx");
                        }
                    }
                    else
                    {
                        lblerror.Text = "No se encontro el Propietario"; //Sino tira error 
                        lblerror.Visible = true;
                        Response.Redirect("frmUnirProPro.aspx");
                    }
                }
                else
                {
                    lblerror.Text = "No se pudo agregar la propiedad "; //Sino tira error 
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "Faltan ingresar campos"; // En caso de que falten datos 
                lblerror.Visible = true;
            }
        }
    }
}