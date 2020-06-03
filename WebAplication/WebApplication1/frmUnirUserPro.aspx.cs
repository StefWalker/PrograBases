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
    public partial class frmUnirUserPro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if(txtProp.Text != "" && txtUsuario.Text!= "")
            {
                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtProp.Text));
                entUsuario obj1 = negUsuario.BuscarUsuario(txtUsuario.Text);
                if (obj != null && obj.Activo == 1  && obj1 != null ) // quite activo usuario
                { 
                    int user = obj1.ID_Usuario;
                    int prop = obj.ID_Propiedad;
                    entProUsuario obj2 = new entProUsuario();
                    obj2.ID_Usuario = user;
                    obj2.ID_Propiedad = prop;

                    if(negProUsuario.AgregarProUsuario(obj2) == 1)
                    {
                        Response.Redirect("frmPrincipal.aspx");
                    }
                    else
                    {
                        lblError.Text = "No se unieron correctamente, error del sistema";
                        lblError.Visible = true;
                    }
                }
                else
                {
                    lblError.Text = "Datos incorrectos";
                    lblError.Visible = true;
                }
            }
            else
            {
                lblError.Text = "Faltan datos por ingresar";
                lblError.Visible = true;
            }
        }
          
    }
}