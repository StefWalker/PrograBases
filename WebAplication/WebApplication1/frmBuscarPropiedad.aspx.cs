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
    public partial class BuscarPropiedad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtNumero.Text != "")
            {
                entPropiedad obj = negPropiedad.BuscarPropiedad(Convert.ToInt32(txtNumero.Text));
                if (obj != null )
                {

                    Numero.Text = Convert.ToString(obj.NumPropiedad);
                    Valor.Text = Convert.ToString(obj.Valor);
                    Direccion.Text = obj.Direccion;
                    Fecha.Text = Convert.ToString(obj.Fecha);
                    Acumulados.Text = Convert.ToString(obj.M3Acumulados);
                    UltimosAcumulados.Text = Convert.ToString(obj.M3AcumuladosUltimoRecibo);


                }
                else
                {
                    lbError.Text = "Esta propiedad no se encuentra en la base de datos";
                    lbError.Visible = true;
                }
            }
            else
            {
                lbError.Text = "Faltan ingresar campos";
                lbError.Visible = true;
            }

        }
    }
}