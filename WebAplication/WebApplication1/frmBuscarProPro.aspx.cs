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
    public partial class frmBuscarProPro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtPropiedad.Text != "" && txtId.Text != "")
            {


                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
                entPropietario obj1 = negPropietario.BuscarPropietario(Convert.ToInt32(txtId.Text));
                if (obj != null && obj1 != null)
                {
                    entTipoDoc obj3 = negTipoDoc.BuscarTipoID(obj1.ID_TDoc);
                    entProPro obj2 = negProPro.BuscarProPro(obj.ID_Propiedad,obj1.ID_Propietario);
                    if (obj2 != null  && obj3 != null )
                    {
                        Numero.Text = Convert.ToString(obj.NumPropiedad);
                        Valor.Text = Convert.ToString(obj.Valor);
                        Direccion.Text = obj.Direccion;
                        Descripcion.Text = obj.Descripcion;
                        ID.Text = Convert.ToString(obj1.Identificacion);
                        Tipo.Text = obj3.Tipo;
                        Nombre.Text = obj1.Nombre;
                        
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