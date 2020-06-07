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
    public partial class frmPropietariosPropiedad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnBuscarFisicos_Click(object sender, EventArgs e)
        {
            if (txtNum.Text != null)
            {
                entPropiedad obj = negPropiedad.BuscarPropiedad(Int32.Parse(txtNum.Text));
                if (obj != null)
                {
                    grvPropietarioFisico.DataSource = negPropietario.ListarPropietariosFisicos(obj.ID_Propiedad);
                    grvPropietarioFisico.DataBind();
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

        protected void btnBuscarJuridicos_Click(object sender, EventArgs e)
        {
            if (txtNum.Text != null)
            {
                entPropiedad obj = negPropiedad.BuscarPropiedad(Int32.Parse(txtNum.Text));
                if (obj != null)
                {
                    PropietariosJur.DataSource = negPropJuridico.ListarPropietariosJuridicos(obj.ID_Propiedad);
                    PropietariosJur.DataBind();
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