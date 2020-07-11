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
    public class daoProxProJuridico
    {
        public static int AgregarProxProJuridico(entProxProJuridico obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PJurxProInsert", cnx);
                cmd.Parameters.AddWithValue("@inID_Propiedad", obj.ID_Propiedad);
                cmd.Parameters.AddWithValue("@inID_Juridico", obj.ID_Juridico);
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
        public static int DeleteProxProJuridico(int ID_Juridico, int ID_Propiedad)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PJur_x_ProDelete", cnx);
                cmd.Parameters.AddWithValue("@inID_Juridico ", ID_Juridico);
                cmd.Parameters.AddWithValue("@inID_Propiedad ", ID_Propiedad);
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
        public static entProxProJuridico BuscarProxProJuridico(int ID_Juridico, int ID_Propiedad)
        {
            entProxProJuridico obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PJur_x_ProRead", cnx);
                cmd.Parameters.AddWithValue("@inID_Juridico", ID_Juridico);
                cmd.Parameters.AddWithValue("@inID_Propiedad", ID_Propiedad);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entProxProJuridico();
                dr.Read();
                obj.ID_JxP = Convert.ToInt32(dr["ID_JxP"].ToString());
                obj.ID_Propiedad = Convert.ToInt32(dr["ID_Propiedad"].ToString());
                obj.ID_Juridico = Convert.ToInt32(dr["ID_Juridico"].ToString());

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
        public static int ModificarProxProJuridico(entProxProJuridico obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PJur_x_ProUpdate", cnx);
                cmd.Parameters.AddWithValue("@inID_JxP", obj.ID_JxP);
                cmd.Parameters.AddWithValue("@inID_Propiedad", obj.ID_Propiedad);
                cmd.Parameters.AddWithValue("@inID_Juridico", obj.ID_Juridico);
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
