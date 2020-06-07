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
    public partial class frmModificarProCC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (txtID.Text != "" && txtPropiedad.Text != "")
            {
                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
                entConceptoCobro obj1 = negConceptoCobro.BuscarConcepto(txtID.Text);
                if (obj != null && obj1 != null)
                {
                    entProCC obj2 = negProCC.BuscarProCC(obj.ID_Propiedad, obj1.ID_CC);
                    if (obj2 != null)
                    {
                        entProCC obj3 = new entProCC();
                        obj3.ID_PxC = obj2.ID_PxC;
                        if (txtConcepto.Text != "")
                        {
                            entConceptoCobro obj4 = negConceptoCobro.BuscarConcepto(txtConcepto.Text);
                            if (obj4 != null)
                            {
                                obj3.ID_CC = obj4.ID_CC;
                                if (txtNumeroProp.Text != "")
                                {
                                    entPropiedad obj5 = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
                                    if (obj5 != null)
                                    {
                                        obj3.ID_Propiedad = obj5.ID_Propiedad;
                                        if (negProCC.ModificarProCC(obj3) == 1)
                                        {
                                            Response.Redirect("frmPrincipal.aspx");
                                        }
                                        else
                                        {
                                            lblerror.Text = "No se pudo modificar la union";
                                            lblerror.Visible = true;
                                        }
                                    }
                                    else
                                    {
                                        lblerror.Text = "No se encontro la propiedad";
                                        lblerror.Visible = true;
                                    }
                                }
                                else
                                {
                                    obj3.ID_Propiedad = obj.ID_Propiedad;
                                    if (negProCC.ModificarProCC(obj3) == 1)
                                    {
                                        Response.Redirect("frmPrincipal.aspx");
                                    }
                                    else
                                    {
                                        lblerror.Text = "No se pudo modificar la union";
                                        lblerror.Visible = true;
                                    }
                                }
                            }
                            else
                            {
                                lblerror.Text = "No se encontro el propietario";
                                lblerror.Visible = true;
                            }

                        }
                        else
                        {
                            obj3.ID_CC = obj1.ID_CC;
                            if (txtNumeroProp.Text != "")
                            {
                                entPropiedad obj5 = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
                                if (obj5 != null)
                                {
                                    obj3.ID_Propiedad = obj5.ID_Propiedad;
                                    if (negProCC.ModificarProCC(obj3) == 1)
                                    {
                                        Response.Redirect("frmPrincipal.aspx");
                                    }
                                    else
                                    {
                                        lblerror.Text = "No se pudo modificar la union";
                                        lblerror.Visible = true;
                                    }
                                }
                                else
                                {
                                    lblerror.Text = "No se pudo enocontrar la propiedad";
                                    lblerror.Visible = true;
                                }
                            }
                            else
                            {
                                obj3.ID_Propiedad = obj.ID_Propiedad;
                                if (negProCC.ModificarProCC(obj3) == 1)
                                {
                                    Response.Redirect("frmPrincipal.aspx");
                                }
                                else
                                {
                                    lblerror.Text = "No se pudo modificar la union";
                                    lblerror.Visible = true;
                                }
                            }
                        }
                    }
                    else
                    {
                        lblerror.Text = "No se encuentra una union entre ellos";
                        lblerror.Visible = true;
                    }
                }
                else
                {
                    lblerror.Text = "Datos incorrectos";
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "Ingrese un numero de propiedad y un propietario";
                lblerror.Visible = true;
            }
        }
    }
}