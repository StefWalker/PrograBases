using CapaEntidades;
using CapaNegocios;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{

    public partial class frmPendientes : System.Web.UI.Page
    {
        Lista lista = new Lista();
        protected void Page_Load(object sender, EventArgs e)
        {

            entUsuario obj0 = (entUsuario)Session["nombre"];
            int ID_Propiedad = Convert.ToInt32(Request.QueryString["ID_Propiedad"]);

            if (obj0 != null)
            {
                if (Request.QueryString["ID_Propiedad"] != null)
                {
                    entProUsuario obj2 = negProUsuario.BuscarProUsuario(ID_Propiedad, obj0.ID_Usuario);
                    if (obj2 != null)
                    {

                        GridView1.DataSource = negRecibos.ListarRecibos(ID_Propiedad);
                        GridView1.DataBind();
                    }
                    else
                    {
                        lblerror.Text = "Dicha Propiedad no corresponde a este usuario";
                        lblerror.Visible = true;
                    }
                }
                else
                {
                    lblerror.Text = "Error al buscar el ID de la propiedad";
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "Esta vacio el objeto";
                lblerror.Visible = true;

            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            List<string> selectedValues = CheckBoxList1.Items.Cast<ListItem>().Where(li => li.Selected).Select(li => li.Value).ToList();
            lblerror.Text = selectedValues[0];
            lblerror.Visible = true;
            Response.Redirect("frmAskRecibos.aspx?ID_Propiedad=" + selectedValues);

        }
           
            

    /*   protected void recibosPendientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            lista.Record("1");

            lblerror.Visible = true;
            lista.Record(GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text);
            lblerror.Text = Convert.ToString(lista.tamano());
        }*/
    }
}