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
            if (txtUser.Text != null && TextBox1.Text != null && lista.SelectedValue != null)
            {

                GridView1.DataSource = negBitacora.ListarBitacora(Convert.ToInt32(lista.SelectedValue),Convert.ToDateTime(txtUser.Text), Convert.ToDateTime(TextBox1.Text));
                GridView1.DataBind();
                
            }
            else
            {
                lblerror.Text = "Debe ingresar un propietario a buscar";
                lblerror.Visible = true;
            }
        }

        
    }
}