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
                cmd = new SqlCommand("InsertPropietario", cnx);
                cmd.Parameters.AddWithValue("@Identificacion", obj.Identificacion);
                cmd.Parameters.AddWithValue("@Nombre", obj.Nombre);
                cmd.Parameters.AddWithValue("@ID_TDoc", obj.ID_TDoc);
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
                cmd = new SqlCommand("PropietarioSearch", cnx);
                cmd.Parameters.AddWithValue("@Identificacion", id);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entPropietario();
                dr.Read();
                obj.ID_Propietario = Convert.ToInt32(dr["ID_Propietario"].ToString());
                obj.Identificacion = Convert.ToInt32(dr["Identificacion"].ToString());
                obj.Nombre = dr["Nombre"].ToString();
                obj.ID_TDoc = Convert.ToInt32(dr["ID_TDoc"].ToString());

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
        public static int DeletePropietario(int identificacion , string nombre )
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropietarioDeleteByName ", cnx);
                cmd.Parameters.AddWithValue("@Identificacion ", identificacion);
                cmd.Parameters.AddWithValue("@Nombre ", nombre);
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
        public static entPropietario BuscarPropietarioID(int id)
        {
            entPropietario obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ReadPropietario", cnx);
                cmd.Parameters.AddWithValue("@ID_Propietario", id);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entPropietario();
                dr.Read();
                obj.ID_Propietario = Convert.ToInt32(dr["ID_Propietario"].ToString());
                obj.Identificacion = Convert.ToInt32(dr["Identificacion"].ToString());
                obj.Nombre = dr["Nombre"].ToString();
                obj.ID_TDoc = Convert.ToInt32(dr["ID_TDoc"].ToString());

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
