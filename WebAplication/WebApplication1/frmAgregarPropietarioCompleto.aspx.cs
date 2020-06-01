﻿using CapaEntidades;
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


            if (txtDescripcion.Text != "" && txtNumeroPropiedad.Text != "" && txtValor.Text != "" && txtDireccion.Text != "" && txtNumeroPropiedad.Text != "" && NomProp.Text != "" && IdProp.Text != "")
            {
                entTipoDoc objTipo = negTipoDoc.BuscarTipoDoc(Convert.ToInt32(lista.SelectedValue));
                if (objTipo != null)
                {
                    entPropiedad obj = new entPropiedad();
                    obj.NumPropiedad = Int32.Parse(txtNumeroPropiedad.Text);
                    obj.Valor = decimal.Parse(txtValor.Text);
                    obj.Direccion = txtDireccion.Text;
                    obj.Descripcion = txtDescripcion.Text;


                    entPropietario obj2 = new entPropietario();
                    obj2.Identificacion = Int32.Parse(IdProp.Text);
                    obj2.Nombre = NomProp.Text;
                    obj2.ID_TDoc = objTipo.ID_TDoc;

                    if ((negPropiedad.AgregarPropiedad(obj) == 1) && (negPropietario.AgregarPropietario(obj2) == 1))
                    {
                        entProPro obj3 = new entProPro();
                        obj3.Propiedad = obj.ID_Propiedad;
                        obj3.Propietario = obj2.ID_Propietario;

                        if (negProPro.AgregarProPro(obj3) == 1)
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
                        lblerror.Text = "No se pudo agregar, verifique los datos de la propiedad y el propietario"; //Sino tira error 
                        lblerror.Visible = true;
                        Response.Redirect("frmUnirProPro.aspx");
                    }
                }
                else
                {
                    lblerror.Text = "Seleccione un tipo de identificacion"; //Sino tira error 
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