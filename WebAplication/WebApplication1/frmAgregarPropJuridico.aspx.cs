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
                entPropietario obj = negPropietario.BuscarPropietario(IdPropFisico.Text);
                entPropiedad obj3 = negPropiedad.BuscarPropiedad(Convert.ToInt32(NumPropiedad.Text));
                if (obj != null && obj3 != null)
                {
                    entTipoDoc obj2 = negTipoDoc.BuscarTipoDoc(Convert.ToInt32(txtNombre.SelectedValue));

                    entPropJuridico obj1 = new entPropJuridico();

                    obj1.Documento = IdJuridico.Text;
                    obj1.ID_Propietario = obj.ID_Propietario;
                    obj1.ID_TDoc = obj2.ID_TDoc;



                    if (negPropJuridico.AgregarPropJuridico(obj1) == 1) //Si lo crea debe irse a la pagina donde crea el usuario 
                    {
                        entPropJuridico juridico = negPropJuridico.BuscarPropJuridico(IdPropFisico.Text);
                        entProxProJuridico obj4 = new entProxProJuridico();
                        obj4.ID_Propiedad = obj3.ID_Propiedad;
                        obj4.ID_Juridico = juridico.ID_Juridico;
                        if (negProxProJuridico.AgregarProxProJuridico(obj4) == 1) //Si lo crea debe irse a la pagina donde crea el usuario 
                        {
                            Response.Redirect("frmPrincipal.aspx");

                        }
                        else
                        {
                            lblerror.Text = "No se pudo unir el propietario y la propiedad"; //Sino tira error 
                            lblerror.Visible = true;
                            Response.Redirect("frmUnirPJurxPro.aspx");


                        }
                    }
                    else
                    {
                        lblerror.Text = "No se pudo agregar"; //Sino tira error 
                        lblerror.Visible = true;
                    }
                }
                else
                {
                    lblerror.Text = "No se encuentra el propietario fisico o la propiedad"; //Sino tira error 
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
