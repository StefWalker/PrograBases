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
    public partial class frmAgregarPropietario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click2(object sender, EventArgs e)
        {

            if (TextBox1.Text != "" && txtIdentificacion.Text != "" && txtNombre.Text != "")
            {
                entPropietario obj1 = new entPropietario();
                obj1.Identificacion = Int32.Parse(txtIdentificacion.Text);
                obj1.Nombre = txtNombre.Text;

                entProPro obj2 = new entProPro();
                obj2.Propiedad = Int32.Parse(TextBox1.Text);
                obj2.Propietario = Int32.Parse(txtIdentificacion.Text);

                if ((negPropiedad.AgregarPropietario(obj1) == 1) && (negProPro.AgregarProPro(obj2) == 1)) //Si lo crea debe irse a la pagina donde crea el usuario 
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