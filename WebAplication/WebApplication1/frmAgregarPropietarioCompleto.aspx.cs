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
    public partial class frmAgregarPropietarioCompleto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {


            if (txtNumeroPropiedad.Text != "" && txtValor.Text != "" && txtDireccion.Text != "" && txtNumeroPropiedad.Text != "" && NomProp.Text != "" && IdProp.Text != "")
            {
                entTipoDoc objTipo = negTipoDoc.BuscarTipoDoc(2);
                if (objTipo == null)
                {
                    lblerror.Text = "No se pudo agregar, verifique el tipo"; //Sino tira error 
                    lblerror.Visible = true;
                   
                }
                else if (objTipo != null)
                {
                    entPropietario obj2 = new entPropietario();
                    obj2.Identificacion = Int32.Parse(IdProp.Text);
                    obj2.Nombre = NomProp.Text;
                    obj2.ID_TDoc = objTipo.ID_TDoc;

                    if (negPropietario.AgregarPropietario(obj2) == 1)
                    {
                        entPropiedad obj = new entPropiedad();
                        obj.NumPropiedad = Int32.Parse(txtNumeroPropiedad.Text);
                        obj.Valor = int.Parse(txtValor.Text);
                        obj.Direccion = txtDireccion.Text;
                        if (negPropiedad.AgregarPropiedad(obj) == 1)
                        {
                            entPropiedad obj3 = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtNumeroPropiedad.Text));
                            entPropietario obj4 = negPropietario.BuscarPropietario(Convert.ToInt32(IdProp.Text));

                            if (obj3 != null && obj4 != null)
                            {
                                entProPro obj5 = new entProPro();
                                obj5.ID_Propiedad = obj3.ID_Propiedad;
                                obj5.ID_Propietario = obj4.ID_Propietario;
                                if (negProPro.AgregarProPro(obj5) == 1)
                                {
                                    Response.Redirect("frmPrincipal.aspx");
                                }

                                else
                                {
                                    lblerror.Text = "No se pudo unir correctamente"; //Enviar a la pagina de unir PRO PRO 
                                    lblerror.Visible = true;
                                    Response.Redirect("frmUnirProPro.aspx");
                                }
                            }
                            else
                            {
                                lblerror.Text = "No se encontro ni propietario o propiedad"; //Enviar a la pagina de unir PRO PRO 
                                lblerror.Visible = true;
                            }   
                           
                            
                        }
                        else
                        {
                            lblerror.Text = "No se pudo agregar la propiedad"; //Enviar a la pagina de unir PRO PRO 
                            lblerror.Visible = true;
                            Response.Redirect("frmAgregarPropiedad.aspx");  //tirar a propiedad con propietario ya que propietario si y propiedad no se agrego 
                        }

                    }
                else
                 {
                     lblerror.Text = "No se pudo agregar correctamente "; //Sino tira error 
                     lblerror.Visible = true;
                 }
                   
                        
                    }
                    else
                    {
                        lblerror.Text = "No se pudo agregar correctamente ni propietario ni propiedad"; //Sino tira error 
                        lblerror.Visible = true;
                    }
                }
                else
                {
                    lblerror.Text = "No se permite dejar espacios vacios"; //Sino tira error 
                    lblerror.Visible = true;
                }
            
        }
    }
}