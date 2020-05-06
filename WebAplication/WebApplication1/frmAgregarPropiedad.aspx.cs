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

            if (txtDescripcion.Text != "" && txtNumeroPropiedad.Text != "" && txtValor.Text != "" && txtFecha.Text != "" && txtDireccion.Text != "" && txtNumeroPropiedad.Text != "" && TextBox1.Text != "")
            {
                entPropiedad obj = new entPropiedad();
                obj.NumPropiedad = Int32.Parse(txtNumeroPropiedad.Text);
                obj.Valor = decimal.Parse(txtValor.Text);
                obj.Direccion = txtDireccion.Text;
                obj.Descripcion = txtDescripcion.Text;
                obj.Fecha_Creacion = DateTime.Parse(txtFecha.Text);

                entProPro obj2 = new entProPro();
                obj2.Propiedad = Int32.Parse(txtNumeroPropiedad.Text);
                obj2.Propietario = Int32.Parse(TextBox1.Text);

                if ((negPropiedad.AgregarPropiedad(obj) == 1)&&(negProPro.AgregarProPro(obj2) == 1)) //Si lo crea debe irse a la pagina donde crea el usuario 
                {
                    Response.Redirect("frmPrincipal.aspx");
                }
                else
                {
                    lblerror.Text = "No se pudo agregar"; //Sino tira error 
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