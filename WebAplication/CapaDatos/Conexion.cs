using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class Conexion
    {
        public SqlConnection Conectar()
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = @"Data Source= DESKTOP-4133A9M ; Initial Catalog = ProyectoBases; Integrated Security=true";
            return cn;
        }
    }
}
