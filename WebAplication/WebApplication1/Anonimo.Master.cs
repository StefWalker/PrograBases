using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Anonimo : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            entUsuario obj = (entUsuario)Session["nombre"];
            if(obj != null)
            {
                NombreUsuario.Text = obj.Nombre;

            }
            else
            {
               // Response.Redirect("frmLogin.aspx");
            }
        }

        protected void lbtlogout_Click(object sender, EventArgs e)
        {
            Session.Remove("nombre");
            Response.Redirect("frmLogin.aspx");
        }

        protected void AgregarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAgregarUsuario.aspx");
        }
        protected void BuscarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarUsuario.aspx");
        }

        protected void AgregarPropiedad_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskPropiedad.aspx");
        }

        protected void BuscarPropiedad_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarPropiedad.aspx");
        }

        protected void AgregarPropietario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskPropietario.aspx");
        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskDelete.aspx");
        }

        protected void BuscarPropietario_Click1(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarPropietario.aspx");
        }

        protected void UnirProUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmUnirUserPro.aspx");
        }

        protected void UnirProPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmUnirProPro.aspx");
        }

        protected void ReadProPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarProPro.aspx");
        }

        protected void ReadProUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarProUser.aspx");
        }

        protected void Modificar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskModificar.aspx");
        }
    }
}