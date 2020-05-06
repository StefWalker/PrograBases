using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Data;

namespace CapaDatos
{
    public class daoPropiedad
    {
        public static int AgregarPropiedad(entPropiedad obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropiedadInsert ", cnx);
                cmd.Parameters.AddWithValue("@NumPropiedad", obj.NumPropiedad);
                cmd.Parameters.AddWithValue("@Valor", obj.Valor);
                cmd.Parameters.AddWithValue("@Descripcion", obj.Descripcion);
                cmd.Parameters.AddWithValue("@Direccion", obj.Direccion);
                cmd.Parameters.AddWithValue("@Fecha_Creacion", obj.Fecha_Creacion);
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
        public static entPropiedad BuscarPropiedad(int numero)
        {
            entPropiedad obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("BuscarPropiedad", cnx);
                cmd.Parameters.AddWithValue("@NumPropiedad", numero);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entPropiedad();
                dr.Read();
                obj.NumPropiedad = Convert.ToInt32(dr["NumPropiedad"].ToString());
                obj.Valor = Convert.ToDecimal(dr["Valor"].ToString());
                obj.ID_Propiedad = Convert.ToInt32(dr["ID_Propiedad"].ToString());
                obj.Descripcion = dr["Descripcion"].ToString();
                obj.Fecha_Creacion = Convert.ToDateTime(dr["Fecha_Creacion"].ToString());
                obj.Direccion = dr["Direccion"].ToString();
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
    }
}
