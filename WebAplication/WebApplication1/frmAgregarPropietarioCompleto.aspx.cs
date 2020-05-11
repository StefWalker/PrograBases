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
    public partial class frmAgregarPropietarioCompleto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            if (txtDescripcion.Text != "" && txtNumeroPropiedad.Text != "" && txtValor.Text != "" && txtFecha.Text != "" && txtDireccion.Text != "" && txtNumeroPropiedad.Text != "" && TextBox1.Text != "")
            {
                entPropiedad obj = new entPropiedad();
                obj.NumPropiedad = Int32.Parse(txtNumeroPropiedad.Text);
                obj.Valor = decimal.Parse(txtValor.Text);
                obj.Direccion = txtDireccion.Text;
                obj.Descripcion = txtDescripcion.Text;
                obj.Fecha_Creacion = DateTime.Parse(txtFecha.Text);

                entPropietario obj2 = new entPropietario();
                obj2.Identificacion = Int32.Parse(TextBox1.Text);
                obj2.Nombre = TextBox2.Text;

                entProPro obj3 = new entProPro();
                obj3.Propiedad = Int32.Parse(txtNumeroPropiedad.Text);
                obj3.Propietario = Int32.Parse(TextBox1.Text);

                if ((negPropiedad.AgregarPropiedad(obj) == 1) && (negPropietario.AgregarPropietario(obj2) == 1) && (negProPro.AgregarProPro(obj3) == 1)) //Si lo crea debe irse a la pagina donde crea el usuario 
                {
                    Response.Redirect("frmPrincipal.aspx");
                }
                else
                {
                    lblerror.Text = "No se pudo agregar"; //Sino tira error 
                    lblerror.Visible = true;
                }
            }
            else //Buscar Usuario y agregarlo a esa propiedad , agregar lo de guardan propiedad 
            {
                Response.Redirect("frmPrincipal.aspx");
            }
        }
    }
}