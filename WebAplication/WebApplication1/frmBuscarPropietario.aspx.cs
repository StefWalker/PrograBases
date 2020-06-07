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
    public partial class frmBuscarPropietario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtID.Text != "")
            {
                entPropietario obj = negPropietario.BuscarPropietario(txtID.Text);
                if (obj != null )
                {

                    entTipoDoc obj1 = negTipoDoc.BuscarTipoID(obj.ID_TDoc);
                    if (obj1 != null)
                    {
                        ID.Text = Convert.ToString(obj.Identificacion);
                        Nombre.Text = obj.Nombre;
                        Tipo.Text = obj1.Tipo;
                    }
                    else
                    {

                        lbError.Text = "Este propietario no se encuentra en la base de datos Aqui";
                        lbError.Visible = true;
                    }
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