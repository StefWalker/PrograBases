﻿using CapaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmDeletePropiedad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int delete = negPropiedad.DeletePropiedad(Convert.ToInt32(txtNumPropiedad.Text));
            if (delete == 1)
            {
                Response.Redirect("frmPrincipal.aspx");
            }
            else
            {

                lblerror.Text = "No se logró borrar correctamente el propietario"; //Sino tira error 
                lblerror.Visible = true;
            }
        }
    }
}