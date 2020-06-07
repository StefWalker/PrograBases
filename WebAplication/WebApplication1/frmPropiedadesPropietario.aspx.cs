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
    public partial class frmPropiedadesPropietario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if(txtID.Text != null)
            {
                entPropietario obj = negPropietario.BuscarPropietario(txtID.Text);
                if(obj != null)
                {
                    grvPropiedades.DataSource = negPropiedad.ListarPropiedades(obj.ID_Propietario);
                    grvPropiedades.DataBind();
                }
                else
                {
                    lblerror.Text = "No se encontro el propietario ingresado";
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "Debe ingresar un propietario a buscar";
                lblerror.Visible = true;
            }
        }
    }
}