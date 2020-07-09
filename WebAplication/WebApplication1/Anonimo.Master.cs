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

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskDelete.aspx");
        }

        protected void Modificar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskModificar.aspx");
        }

        protected void VerPropiedadesPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPropiedadesPropietario.aspx");
        }

        protected void VerPropiedadesUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPropiedadesUsuario.aspx");
        }

        protected void VerUsuariosPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmUserPropiedades.aspx");
        }

        protected void VerPropietariosPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPropietariosPropiedad.aspx");
        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskBuscar.aspx");
        }

        protected void Agregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskAgregarEntidades.aspx");
        }

        protected void Uniones_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskCrearUniones.aspx");
        }
    }
}