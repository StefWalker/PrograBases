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
    public partial class frmAgregarPropiedadUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click1(object sender, EventArgs e)
        {
            if (txtDescripcion.Text != "" && txtNumeroPropiedad.Text != "" && txtValor.Text != "" && txtFecha.Text != "" && txtDireccion.Text != "" && txtNumeroPropiedad.Text != "" && NomUsuario.Text != "")
            {
                entPropiedad obj = new entPropiedad();
                obj.NumPropiedad = Int32.Parse(txtNumeroPropiedad.Text);
                obj.Valor = decimal.Parse(txtValor.Text);
                obj.Direccion = txtDireccion.Text;
                obj.Descripcion = txtDescripcion.Text;
                if (negPropiedad.AgregarPropiedad(obj) == 1)
                {
                    entUsuario obj1 = negUsuario.BuscarUsuario(NomUsuario.Text);
                    entPropiedad obj2 = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtNumeroPropiedad.Text));
                    if (obj1.Activo == 1 && obj1 != null && obj2.Activo == 1 && obj2 != null)
                    {
                       
                        entProUsuario obj3 = new entProUsuario();
                        obj3.ID_Propiedad = obj2.ID_Propiedad;
                        obj3.ID_Usuario = obj1.ID_Usuario;

                        if (negProUsuario.AgregarProUsuario(obj3) == 1)
                        {
                            Response.Redirect("frmPrincipal.aspx");
                        }
                        else
                        {
                            lblerror.Text = "No se pudo unir la propiedad y el usuario "; //Sino tira error 
                            lblerror.Visible = true;
                            Response.Redirect("frmUnirUserPro .aspx");
                        }
                    }
                    else
                    {
                        lblerror.Text = "No se encontra el usuario "; //Sino tira error 
                        lblerror.Visible = true;
                        Response.Redirect("frmUnirUserPro .aspx");
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