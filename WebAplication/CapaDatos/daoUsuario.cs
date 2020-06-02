using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Data;

namespace CapaDatos
{
    public class daoUsuario
    {
        public static entUsuario Login(String nombre, String password)
        {
            entUsuario obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("UsuarioSearch", cnx);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entUsuario();
                dr.Read();
                obj.Nombre = dr["Nombre"].ToString();
                obj.Password = dr["Password"].ToString();
                obj.ID_Usuario = Convert.ToInt32(dr["ID_Usuario"].ToString());
                obj.TipoUsuario = dr["TipoUsuario"].ToString();
                obj.Activo = Convert.ToInt32(dr["Activo"].ToString());
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

        public static int AgregarUsuario(entUsuario obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("UsuarioInsert", cnx);
                cmd.Parameters.AddWithValue("@Nombre", obj.Nombre);
                cmd.Parameters.AddWithValue("@Password", obj.Password);
                cmd.Parameters.AddWithValue("@TipoUsuario", obj.TipoUsuario);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                cmd.ExecuteNonQuery();
                Indicador = 1;
            }
            catch(Exception e)
            {
                Indicador = 0;
            }
            finally
            {
                cmd.Connection.Close();

            }
            return Indicador;
        }
        public static entUsuario BuscarUsuario(String nombre)
        {
            entUsuario obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("BuscarUsuario", cnx);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entUsuario();
                dr.Read();
                obj.Nombre = dr["Nombre"].ToString();
                obj.Password = dr["Password"].ToString();
                obj.ID_Usuario = Convert.ToInt32(dr["ID_Usuario"].ToString());
                obj.TipoUsuario = dr["TipoUsuario"].ToString();
                obj.Activo = Convert.ToInt32(dr["Activo"].ToString());

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
        public static int DeleteUsuario(string nombre, string password)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("UsuarioDeleteB", cnx);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Password", password);
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

