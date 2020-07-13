using CapaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmBitacora : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (lista.SelectedValue != null && txtFinal.Text != null && txtInicio.Text != null)
            {
             
                        Bitacora.DataSource = negBitacora.ListarBitacora(Convert.ToInt32(lista.SelectedValue),txtInicio.Text,txtFinal.Text);
                        Bitacora.DataBind();
            }
            else
            {
                lblError.Text = "Debe ingresar una entidad";
                lblError.Visible = true;
            }
        }
    }
}