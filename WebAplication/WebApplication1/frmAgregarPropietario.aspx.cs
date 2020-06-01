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
    public partial class frmAgregarPropietario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click2(object sender, EventArgs e)
        {

            if (NumPropiedad.Text != "" && txtIdentificacion.Text != "" && txtNombre.Text != "")
            {
                entTipoDoc objDOC = negTipoDoc.BuscarTipoDoc(Convert.ToInt32(lista.SelectedValue));

                if (objDOC != null)
                {
                    entPropietario obj1 = new entPropietario();
                    obj1.Identificacion = Int32.Parse(txtIdentificacion.Text);
                    obj1.Nombre = txtNombre.Text;
                    obj1.ID_TDoc = objDOC.ID_TDoc;
                    if (negPropietario.AgregarPropietario(obj1) == 1)
                    {
                        entPropiedad objPropiedad = negPropiedad.BuscarPropiedad(Convert.ToInt32(NumPropiedad.Text));
                        entPropietario objPropietario = negPropietario.BuscarPropietario(Convert.ToInt32(txtIdentificacion.Text));
                        if (objPropiedad != null && objPropiedad.Activo == 1 && objPropietario != null && objPropietario.Activo == 1)
                        {
                            entProPro obj2 = new entProPro();
                            obj2.Propiedad = objPropiedad.ID_Propiedad;
                            obj2.Propietario = objPropietario.ID_Propietario;
                            if (negProPro.AgregarProPro(obj2) == 1)
                            {
                                Response.Redirect("frmPrincipal.aspx");
                            }
                            else
                            {
                                lblerror.Text = "No se pudo unir Propiedad con Propietario"; //Sino tira error 
                                lblerror.Visible = true; // tirar a la de unir 
                            }
                        }
                        else
                        {
                            lblerror.Text = "No se pudo unir Propiedad con Propietario, verifique el numero de propiedad"; //Sino tira error 
                            lblerror.Visible = true; // tirar a la de unir 
                        }
                    }
                    else
                    {
                        lblerror.Text = "No se pudo agregar, verifique los datos del Propietario"; //Sino tira error 
                        lblerror.Visible = true;
                    }
                }
                else
                {

                    lblerror.Text = "No se encuentra el tipo de documento"; //Sino tira error 
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "No se permite dejar espacios sin llenar"; //Sino tira error 
                lblerror.Visible = true;
            }
        }
    }
}