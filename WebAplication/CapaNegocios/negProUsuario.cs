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
    public class negProUsuario
    {
        public static int AgregarProUsuario(entProUsuario obj)
        {
            return daoProUsuario.AgregarProUsuario(obj);
        }
     }
}
