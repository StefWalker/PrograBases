using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
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
                cmd = new SqlCommand("PropietarioInsert", cnx);
                cmd.Parameters.AddWithValue("@inIdentificacion", obj.Identificacion);
                cmd.Parameters.AddWithValue("@inNombre", obj.Nombre);
                cmd.Parameters.AddWithValue("@inID_TDoc", obj.ID_TDoc);
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
        public static entPropietario BuscarPropietario(string id)
        {
            entPropietario obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropietarioSearch", cnx);
                cmd.Parameters.AddWithValue("@inIdentificacion", id);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entPropietario();
                dr.Read();
                obj.ID_Propietario = Convert.ToInt32(dr["ID_Propietario"].ToString());
                obj.Identificacion =dr["Identificacion"].ToString();
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
                cmd.Parameters.AddWithValue("@inIdentificacion ", identificacion);
                cmd.Parameters.AddWithValue("@inNombre ", nombre);
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
                cmd = new SqlCommand("PropietarioRead", cnx);
                cmd.Parameters.AddWithValue("@inID_Propietario", id);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entPropietario();
                dr.Read();
                obj.ID_Propietario = Convert.ToInt32(dr["ID_Propietario"].ToString());
                obj.Identificacion = dr["Identificacion"].ToString();
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
        public static int ModificarPropietario(entPropietario obj, int idVieja)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropietarioUpdateB", cnx);
                cmd.Parameters.AddWithValue("@inIdentificacion", idVieja);
                cmd.Parameters.AddWithValue("@inNewNombre", obj.Nombre);
                cmd.Parameters.AddWithValue("@inNewIdentificacion", obj.Identificacion);
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
        public static List<entPropietario> ListarPropietariosFisicos(int ID_Propiedad)
        {

            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entPropietario> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarPropietariosFisicos", cnx);
                cmd.Parameters.AddWithValue("@inID_Propiedad", ID_Propiedad);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entPropietario>();
                while (dr.Read())
                {
                    entPropietario C = new entPropietario();
                    C.ID_Propietario= Convert.ToInt32(dr["ID_Propietario"].ToString());
                    C.Nombre= dr["Nombre"].ToString();
                    C.Identificacion = dr["Identificacion"].ToString();
                    C.ID_TDoc = Convert.ToInt32(dr["ID_TDoc"].ToString());
                    lista.Add(C);
                }
            }
            catch (Exception e)
            {
                lista = null;
            }
            finally
            {
                cmd.Connection.Close();

            }
            return lista;
        }

    }
}
