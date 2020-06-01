﻿using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocios;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Nombre"] != null)
            {
                Response.Redirect("frmPrincipal.aspx");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            //dos condiciones una que este vacio o
            if (txtUsuario.Text != "" && txtpass.Text != "")
            {
                entUsuario obj = negUsuario.Login(txtUsuario.Text, txtpass.Text);
                if (obj != null && obj.Activo == 1  && obj.TipoUsuario == "Administrador")
                {
                    Session["Nombre"] = obj;
                    Response.Redirect("frmPrincipal.aspx");
                }
                else
                {
                    lbError.Text = "Usuario o contraseña invalido";
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