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
            if (txtUser.Text != "" && TextBox1.Text != "" )
            {
                Console.WriteLine(txtUser.Text);
                Console.WriteLine(TextBox1.Text);
                
              /*  DateTime dt = new DateTime();
                DateTime dp = new DateTime();
             dt = DateTime.ParseExact(txtUser.Text, "dd-MM-yyyy", null);
                dp = DateTime.ParseExact(TextBox1.Text, "yyyy-MM-dd", null);
                */
               /* Label2.Text = Convert.ToString(dt);
                Console.WriteLine(dt);
                Console.WriteLine(dp);
                Console.WriteLine(lista.SelectedValue);*/
                
                GridView1.DataSource = negBitacora.ListarBitacora(1);
                GridView1.DataBind();
                
            }
            else
            {
                lblerror.Text = "Debe ingresar una fecha a buscar";
                lblerror.Visible = true;
            }
        }

        
    }
}