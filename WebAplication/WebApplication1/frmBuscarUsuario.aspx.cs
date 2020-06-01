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
    public partial class frmBuscar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            
            if (txtNombre.Text != "")
            {
                entUsuario obj = negUsuario.BuscarUsuario(txtNombre.Text);
                if (obj != null && obj.Activo == 1)
                {
                  
                    Nombre.Text = obj.Nombre;
                    Password.Text = obj.Password;
                    TipoUsuario.Text = obj.TipoUsuario;    

                }
                else
                {
                    lbError.Text = "Este Usuario no existe";
                    lbError.Visible = true;
                }
            }
            else
            {
                lbError.Text = "Faltan ingresar campos";
                lbError.Visible = true;
            }
           
        }
    }
}