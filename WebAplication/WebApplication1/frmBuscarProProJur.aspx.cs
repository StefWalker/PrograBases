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
    public partial class frmBuscarProProJur : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtPropiedad.Text != "" && txtId.Text != "")
            {


                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
                entPropJuridico obj1 = negPropJuridico.BuscarPropJuridico(txtId.Text);
                if (obj != null && obj1 != null)
                {
                    entTipoDoc obj3 = negTipoDoc.BuscarTipoID(obj1.ID_TDoc);
                    entProxProJuridico obj2 = negProxProJuridico.BuscarProxProJuridico(obj.ID_Propiedad, obj1.ID_Juridico);
                    if (obj2 != null && obj3 != null)
                    {
                        Numero.Text = Convert.ToString(obj.NumPropiedad);
                        //Valor.Text = Convert.ToString(obj.Valor);
                        Direccion.Text = obj.Direccion;
                        ID.Text = Convert.ToString(obj1.Documento);
                        Tipo.Text = obj3.Tipo;
                      

                    }
                    else
                    {

                        lblerror.Text = "No se logró encontrar esta union "; //Sino tira error 
                        lblerror.Visible = true;
                    }
                }
                else
                {
                    lblerror.Text = "No se encontraron los datos ingresados "; //Sino tira error 
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "Debe ingresar todos los datos solicitados "; //Sino tira error 
                lblerror.Visible = true;
            }
        }
    }
}