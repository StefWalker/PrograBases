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
    public partial class frmBuscarProUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtPropiedad.Text != "" && txtUser.Text != "")
            {

                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
                entUsuario obj1 = negUsuario.BuscarUsuario(txtUser.Text);
                if (obj != null && obj1 != null)
                {
                    entProUsuario obj2 = negProUsuario.BuscarProUsuario(obj.ID_Propiedad, obj1.ID_Usuario);
                    if (obj2 != null )
                    {
                        Numero.Text = Convert.ToString(obj.NumPropiedad);
                        Valor.Text = Convert.ToString(obj.Valor);
                        Direccion.Text = obj.Direccion;
                        Nombre.Text = obj1.Nombre;
                        Password.Text = obj1.Password;
                        Nombre.Text = obj1.Nombre;
                        TipoUsuario.Text = obj1.TipoUsuario;

                    }
                    else
                    {

                        lblerror.Text = "No se logró encontrar esta union "; //Sino tira error 
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