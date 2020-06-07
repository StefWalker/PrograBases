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
    public partial class frmModificarProUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (txtUser.Text != "" && txtPropiedad.Text != "")
            {
                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
                entUsuario obj1 = negUsuario.BuscarUsuario(txtUser.Text);
                if (obj != null && obj1 != null)
                {
                    entProUsuario obj2 = negProUsuario.BuscarProUsuario(obj.ID_Propiedad, obj1.ID_Usuario);
                    if (obj2 != null)
                    {
                        entProUsuario obj3 = new entProUsuario();
                        obj3.ID_PxU = obj2.ID_PxU;
                        if (txtNuevoUser.Text != "")
                        {
                            entUsuario obj4 = negUsuario.BuscarUsuario(txtNuevoUser.Text);
                            if (obj4 != null)
                            {
                                obj3.ID_Usuario = obj4.ID_Usuario;
                                if (txtNumeroProp.Text != "")
                                {
                                    entPropiedad obj5 = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
                                    if (obj5 != null)
                                    {
                                        obj3.ID_Propiedad = obj5.ID_Propiedad;
                                        if (negProUsuario.ModificarProUsuario(obj3) == 1)
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
                                        lblerror.Text = "No se pudo encontrar la propiedad nueva";
                                        lblerror.Visible = true;
                                    }
                                }
                                else
                                {
                                    obj3.ID_Propiedad = obj.ID_Propiedad;
                                    if (negProUsuario.ModificarProUsuario(obj3) == 1)
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
                                lblerror.Text = "No se encuentra el nuevo usuario";
                                lblerror.Visible = true;
                            }
                        }

                        else
                        {
                            obj3.ID_Usuario = obj1.ID_Usuario;
                            if (txtNumeroProp.Text != "")
                            {
                                entPropiedad obj5 = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
                                if (obj5 != null)
                                {
                                    obj3.ID_Propiedad = obj5.ID_Propiedad;
                                    if (negProUsuario.ModificarProUsuario(obj3) == 1)
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
                                    lblerror.Text = "No se encuentra la nueva propiedad";
                                    lblerror.Visible = true;
                                }
                            }
                            else
                            {
                                obj3.ID_Propiedad = obj.ID_Propiedad;
                                if (negProUsuario.ModificarProUsuario(obj3) == 1)
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
                lblerror.Text = "Ingrese un numero de propiedad y el nombre del usuario";
                lblerror.Visible = true;
            }
        }
    }
}