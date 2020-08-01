using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class daoTemporal
    {
        public static int AgregarTemporal(int id)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PagosInsert", cnx);
                cmd.Parameters.AddWithValue("@Recibo",id);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                cmd.ExecuteNonQuery();
                Indicador = 1;
            }
            catch (Exception e)
            {
                Indicador = 0;
            }
            finally
            {
                cmd.Connection.Close();

            }
            return Indicador;
        }
        public static entTemporal IniciarTrans()
        {
            entTemporal obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropiedadRead", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entTemporal();
                dr.Read();
                obj.idRecibo = Convert.ToInt32(dr["@idComprobante"].ToString());
            }
            catch
            {
                obj = null;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return obj;
        }

    }
}
