using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Data;


namespace CapaDatos
{
    public class daoProCC
    {
        public static entProCC BuscarProCC(int id, int id2)
        {
            entProCC obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("Pro_x_CCRead", cnx);
                cmd.Parameters.AddWithValue("@ID_Propiedad", id);
                cmd.Parameters.AddWithValue("@ID_CC", id2);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entProCC();
                dr.Read();
                obj.ID_PxC = Convert.ToInt32(dr["ID_PxC"].ToString());
                obj.ID_CC = Convert.ToInt32(dr["ID_CC"].ToString());
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
        public static int DeleteProxCC(int concepto, int  propiedad)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("Pro_x_CCDelete", cnx);
                cmd.Parameters.AddWithValue("@ID_Propiedad", propiedad);
                cmd.Parameters.AddWithValue("@ID_CC",concepto );
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
        public static int AgregarProCC(entProCC obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ProxCCInsert", cnx);
                cmd.Parameters.AddWithValue("@ID_Propiedad", obj.ID_Propiedad);
                cmd.Parameters.AddWithValue("@ID_CC", obj.ID_CC);
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
        public static int ModificarProCC(entProCC obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("Pro_x_CCUpdate", cnx);
                cmd.Parameters.AddWithValue("@ID_PxC", obj.ID_PxC);
                cmd.Parameters.AddWithValue("@ID_Propiedad", obj.ID_Propiedad);
                cmd.Parameters.AddWithValue("@ID_CC", obj.ID_CC);
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
