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
    public partial class frmModificarPropJuridico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (txtID.Text != "")
            {
                entPropJuridico obj1 = negPropJuridico.BuscarPropJuridico(txtID.Text);
                if (obj1 != null)
                {
                    entPropJuridico obj = new entPropJuridico();
                    if (txtFisico.Text != "")
                    {
                        entPropietario obj2 = negPropietario.BuscarPropietario(txtFisico.Text);
                        obj.ID_Propietario = obj2.ID_Propietario;
                        if (txtIdentificacion.Text != "")
                        {
                            obj.Documento = txtIdentificacion.Text;
                            obj.ID_TDoc = obj1.ID_TDoc;
                            if (negPropJuridico.ModificarPropJuridico(obj, txtID.Text) == 1)
                            {
                                Response.Redirect("frmPrincipal.aspx");
                            }
                            else
                            {
                                lblerror.Text = "No se pudo modificar el propietario";
                                lblerror.Visible = true;
                            }
                        }
                        else
                        {
                            obj.Documento = obj1.Documento;
                            obj.ID_TDoc = obj1.ID_TDoc;
                            if (negPropJuridico.ModificarPropJuridico(obj, txtID.Text) == 1)
                            {
                                Response.Redirect("frmPrincipal.aspx");
                            }
                            else
                            {
                                lblerror.Text = "No se pudo modificar el propietario1";
                                lblerror.Visible = true;
                            }
                        }
                    }
                    else
                    {
                        obj.ID_Propietario = obj1.ID_Propietario;
                        if (txtIdentificacion.Text != "")
                        {
                            obj.Documento = txtIdentificacion.Text;
                            obj.ID_TDoc = obj1.ID_TDoc;
                            if (negPropJuridico.ModificarPropJuridico(obj, txtID.Text) == 1)
                            {
                                Response.Redirect("frmPrincipal.aspx");
                            }
                            else
                            {
                                lblerror.Text = "No se pudo modificar el propietario1";
                                lblerror.Visible = true;
                            }
                        }
                        else
                        {
                            obj.Documento = obj1.Documento;
                            obj.ID_TDoc = obj1.ID_TDoc;
                            if (negPropJuridico.ModificarPropJuridico(obj, txtID.Text) == 1)
                            {
                                Response.Redirect("frmPrincipal.aspx");
                            }
                            else
                            {
                                lblerror.Text = "No se pudo modificar el propietario1";
                                lblerror.Visible = true;
                            }
                        }
                    }
                }
                else
                {
                    lblerror.Text = "No se logro encontrar el propietario juridico";
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "Debe ingresar la identificacion para buscar";
                lblerror.Visible = true;
            }
        }
    }
}