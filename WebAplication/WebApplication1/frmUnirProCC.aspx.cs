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
    public partial class frmUnirProCC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "" && NumPropiedad.Text != "")
            {
                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(NumPropiedad.Text));
                entConceptoCobro obj1 = negConceptoCobro.BuscarConcepto(Convert.ToInt32(TextBox1.Text));
                if (obj != null && obj1 != null)
                {
                    int concepto = obj1.ID_CC;
                    int prop = obj.ID_Propiedad;
                    entProCC obj2 = new entProCC();
                    obj2.ID_Propiedad = prop;
                    obj2.ID_CC = concepto;
                   

                    if (negProCC.AgregarProCC(obj2) == 1)
                    {
                        Response.Redirect("frmPrincipal.aspx");
                    }
                    else
                    {
                        lblError.Text = "No se unieron correctamente,error del sistema";
                        lblError.Visible = true;
                    }
                }
                else
                {
                    lblError.Text = "Datos incorrectos";
                    lblError.Visible = true;
                }
            }
            else
            {
                lblError.Text = "Faltan datos por ingresar";
                lblError.Visible = true;
            }

        }

    }
}