using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negUsuario
    {
        public static entUsuario Login(String nombre, String password)
        {
            return daoUsuario.Login(nombre, password);
        }
        public static int AgregarUsuario(entUsuario obj)
        {
            return daoUsuario.AgregarUsuario(obj);
        }
        public static entUsuario BuscarUsuario(String nombre)
        {
            return daoUsuario.BuscarUsuario(nombre);
        }
        public static int DeleteUsuario(string nombre, string password)
        {
            return daoUsuario.DeleteUsuario(nombre, password);
        }
    }
}
