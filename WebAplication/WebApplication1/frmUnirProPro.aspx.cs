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
    public partial class frmUnirProPro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtProp.Text != "" && txtID.Text != "")
            {
                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtProp.Text));
                entPropietario obj1 = negPropietario.BuscarPropietario(Convert.ToInt32(txtID.Text));
                if (obj != null && obj.Activo == 1 &&  obj1 != null && obj1.Activo == 1)
                {
                    int propietario = obj1.ID_Propietario;
                    int prop = obj.ID_Propiedad;
                    entProPro obj2 = new entProPro();
                    obj2.Propiedad = prop;
                    obj2.Propietario = propietario;

                    if (negProPro.AgregarProPro(obj2) == 1)
                    {
                        Response.Redirect("frmPrincipal.aspx");
                    }
                    else
                    {
                        lblError.Text = "No se unieron correctamente,error del sistema";
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