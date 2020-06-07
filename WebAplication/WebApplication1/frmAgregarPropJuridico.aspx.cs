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
    public partial class frmAgregarPropJuridico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click2(object sender, EventArgs e)
        {
            if (IdPropFisico.Text != "" && IdJuridico.Text != "" && txtNombre.Text != "" && NumPropiedad.Text != "")
            {
                entPropietario obj = negPropietario.BuscarPropietario(Convert.ToInt32(IdPropFisico.Text));
                if (obj != null)
                {
                    entTipoDoc obj2 = negTipoDoc.BuscarTipoDoc(Convert.ToInt32(txtNombre.SelectedValue));

                    entPropJuridico obj1 = new entPropJuridico();

                    obj1.Documento = Int32.Parse(IdJuridico.Text);
                    obj1.ID_Propietario = obj.ID_Propietario;
                    obj1.ID_TDoc = obj2.ID_TDoc;



                    if (negPropJuridico.AgregarPropJuridico(obj1) == 1) //Si lo crea debe irse a la pagina donde crea el usuario 
                    {
                        Response.Redirect("frmPrincipal.aspx");
                    }
                    else
                    {
                        lblerror.Text = "No se pudo agregar"; //Sino tira error 
                        lblerror.Visible = true;
                    }
                }
                else
                {
                    lblerror.Text = "No se encuentra el propietario fisico"; //Sino tira error 
                    lblerror.Visible = true;
                }
            }

            else
            {
                lblerror.Text = "Faltan ingresar campos"; // En caso de que falten datos 
                lblerror.Visible = true;
            }
        }
    }
}
