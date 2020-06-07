using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Data;

namespace CapaDatos
{
    public class daoProPro
    {
        public static int AgregarProPro(entProPro obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ProxProInsert", cnx);
                cmd.Parameters.AddWithValue("@ID_Propiedad", obj.ID_Propiedad);
                cmd.Parameters.AddWithValue("@ID_Propietario", obj.ID_Propietario);
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
        public static int DeleteProPro(int ID_Propiedad, int ID_Propietario)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("Pro_x_ProDelete", cnx);
                cmd.Parameters.AddWithValue("@ID_Propiedad ", ID_Propiedad);
                cmd.Parameters.AddWithValue("@ID_Propietario ", ID_Propietario);
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
        public static entProPro BuscarProPro(int ID_Propiedad , int ID_Propietario)
        {
            entProPro obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("Pro_x_ProRead", cnx);
                cmd.Parameters.AddWithValue("@ID_Propiedad", ID_Propiedad);
                cmd.Parameters.AddWithValue("@ID_Propietario",ID_Propietario);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entProPro();
                dr.Read();
                obj.ID_PxP = Convert.ToInt32(dr["ID_PxP"].ToString());
                obj.ID_Propietario = Convert.ToInt32(dr["ID_Propietario"].ToString());
                obj.ID_Propiedad = Convert.ToInt32(dr["ID_Propiedad"].ToString());

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
        public static int ModificarProPro(entProPro obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("Pro_x_ProUpdate", cnx);
                cmd.Parameters.AddWithValue("@ID_PxP", obj.ID_PxP);
                cmd.Parameters.AddWithValue("@ID_Propiedad", obj.ID_Propiedad);
                cmd.Parameters.AddWithValue("@ID_Propietario", obj.ID_Propietario);
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
