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
    public partial class frmBuscarProCC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtPropiedad.Text != "" && txtId.Text != "")
            {
                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtPropiedad.Text));
                entConceptoCobro obj1 = negConceptoCobro.BuscarConcepto(txtId.Text);
                if (obj != null && obj1 != null)
                {
                    entProCC obj2 = negProCC.BuscarProCC(obj.ID_Propiedad, obj1.ID_CC);
                    if (obj2 != null)
                    {
                        Numero.Text = Convert.ToString(obj.NumPropiedad);
                        //Valor.Text = Convert.ToString(obj.Valor);
                        Direccion.Text = obj.Direccion;
                        Tipo.Text = Convert.ToString(obj1.TipoCC);
                        Concepto.Text = obj1.Concepto;
                        FechaVencimiento.Text = Convert.ToString(obj1.FechaVencimiento);
                        Fecha.Text = Convert.ToString(obj1.Fecha);

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