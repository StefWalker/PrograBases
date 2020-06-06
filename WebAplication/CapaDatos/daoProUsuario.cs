using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Data;

namespace CapaDatos
{
    public class daoProUsuario
    {
        public static int AgregarProUsuario(entProUsuario obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("Pro_x_UsuarioInsert ", cnx);
                cmd.Parameters.AddWithValue("@ID_Propiedad", obj.ID_Propiedad);
                cmd.Parameters.AddWithValue("@ID_Usuario", obj.ID_Usuario);               
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
        public static int DeleteProUser(int ID_Propiedad, int ID_Usuario )
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("Pro_x_UsuarioDelete", cnx);
                cmd.Parameters.AddWithValue("@ID_Propiedad ", ID_Propiedad);
                cmd.Parameters.AddWithValue("@ID_Usuario ",ID_Usuario);
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
        public static entProUsuario BuscarProUsuario(int ID_Propiedad, int ID_Usuario)
        {
            entProUsuario obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("Pro_x_UsuarioRead", cnx);
                cmd.Parameters.AddWithValue("@ID_Propiedad", ID_Propiedad);
                cmd.Parameters.AddWithValue("@ID_Usuario", ID_Usuario);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entProUsuario();
                dr.Read();
                obj.ID_PxU = Convert.ToInt32(dr["ID_PxU"].ToString());
                obj.ID_Usuario = Convert.ToInt32(dr["ID_Usuario"].ToString());
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
    }
}
