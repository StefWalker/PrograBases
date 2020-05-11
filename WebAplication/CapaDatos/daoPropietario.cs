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
    public class daoPropietario
    {
        public static int AgregarPropietario(entPropietario obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropietarioInsert ", cnx);
                cmd.Parameters.AddWithValue("@Identificacion", obj.Identificacion);
                cmd.Parameters.AddWithValue("@Nombre", obj.Nombre);
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
        public static entPropietario BuscarPropietario(int id)
        {
            entPropietario obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("BuscarPropietario", cnx);
                cmd.Parameters.AddWithValue("@Identificacion", id);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entPropietario();
                dr.Read();
                obj.Identificacion = Convert.ToInt32(dr["Identificacion"].ToString());
                obj.Nombre = dr["Nombre"].ToString();

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
