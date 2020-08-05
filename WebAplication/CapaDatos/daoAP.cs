using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class daoAP
    {
        public static void ConfirmacionAP(int monto, int propiedad, int plazo)
        {
            SqlCommand cmd = null;

            Conexion cn = new Conexion();
            SqlConnection cnx = cn.Conectar();
            cmd = new SqlCommand("ConfirmacionAP", cnx);
            cmd.Parameters.AddWithValue("@inMontoTotal", monto);
            cmd.Parameters.AddWithValue("@inID_Propiedad",propiedad);
            cmd.Parameters.AddWithValue("@inPlazo", plazo);
            cmd.CommandType = CommandType.StoredProcedure;
            cnx.Open();
            cmd.ExecuteNonQuery();
        }
    }
}
