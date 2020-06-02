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
    public class negPropiedad
    {
        public static int AgregarPropiedad(entPropiedad obj)
        {
            return daoPropiedad.AgregarPropiedad(obj);
        }
        public static entPropiedad BuscarPropiedad(int numero)
        {
            return daoPropiedad.BuscarPropiedad(numero);
        }
        public static int DeletePropiedad(int numero)
        {
            return daoPropiedad.DeletePropiedad(numero);
        }
    }
}

