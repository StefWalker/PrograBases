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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtID.Text != "")  //cambiar 
            {
                entPropJuridico obj = negPropJuridico.BuscarPropJuridico(txtID.Text);
                if (obj != null )
                {
                    entTipoDoc obj1 = negTipoDoc.BuscarTipoID(obj.ID_TDoc);
                    entPropietario obj2 = negPropietario.BuscarPropietarioID(obj.ID_Propietario);
                    if(obj1 != null && obj2 != null)
                    {
                        ID.Text = Convert.ToString(obj.Documento);
                        Tipo.Text = obj1.Tipo;
                        PropFisico.Text = obj2.Nombre;
                        IDProp.Text = Convert.ToString(obj2.Identificacion);
                        entTipoDoc obj3 = negTipoDoc.BuscarTipoID(obj2.ID_TDoc);
                        TipoFisico.Text = obj3.Tipo;
                    }
                    else
                    {
                        lbError.Text = "Este propietario no se encuentra en la base de datos";
                        lbError.Visible = true;
                    }
                    

                }
                else
                {
                    lbError.Text = "Este propietario juridico no se encuentra en la base de datos";
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