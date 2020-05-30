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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtID.Text != "")  //cambiar 
            {
                entPropJuridico obj = negPropJuridico.BuscarPropJuridico(Convert.ToInt32(txtID.Text));
                if (obj != null)
                {
                    
                    Nombre.Text = obj.Nombre;

                }
                else
                {
                    lbError.Text = "Este propietario no se encuentra en la base de datos";
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