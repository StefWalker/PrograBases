﻿using CapaEntidades;
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
                cmd.Parameters.AddWithValue("@inNombre", nombre);
                cmd.Parameters.AddWithValue("@inPassword", password);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entUsuario();
                dr.Read();
                obj.Nombre = dr["Nombre"].ToString();
                obj.Password = dr["Password"].ToString();
                obj.ID_Usuario = Convert.ToInt32(dr["ID_Usuario"].ToString());
                obj.TipoUsuario = dr["TipoUsuario"].ToString();
                //obj.Activo = Convert.ToInt32(dr["Activo"].ToString());
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
                cmd.Parameters.AddWithValue("@inNombre", obj.Nombre);
                cmd.Parameters.AddWithValue("@inPassword", obj.Password);
                cmd.Parameters.AddWithValue("@inTipoUsuario", obj.TipoUsuario);
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
                cmd.Parameters.AddWithValue("@inNombre", nombre);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entUsuario();
                dr.Read();
                obj.Nombre = dr["Nombre"].ToString();
                obj.Password = dr["Password"].ToString();
                obj.ID_Usuario = Convert.ToInt32(dr["ID_Usuario"].ToString());
                obj.TipoUsuario = dr["TipoUsuario"].ToString();
                

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
                cmd.Parameters.AddWithValue("@inNombre", nombre);
                cmd.Parameters.AddWithValue("@inPassword", password);
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
        public static int ModificarUsuario(entUsuario obj, string nombreviejo, string passwordvieja)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("UsuarioUpdateB", cnx);
                cmd.Parameters.AddWithValue("@inNombre", nombreviejo);
                cmd.Parameters.AddWithValue("@inPassword", passwordvieja);
                cmd.Parameters.AddWithValue("@inNewName", obj.Nombre);
                cmd.Parameters.AddWithValue("@inNewPassword", obj.Password);
                cmd.Parameters.AddWithValue("@inTipoUsuario", obj.TipoUsuario);
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
        public static List<entUsuario> ListarUsuarios(int ID_Propiedad)
        {

            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entUsuario> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarUsuarios", cnx);
                cmd.Parameters.AddWithValue("@inID_Propiedad", ID_Propiedad);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entUsuario>();
                while (dr.Read())
                {
                    entUsuario C = new entUsuario();
                    C.Nombre = dr["Nombre"].ToString();
                    C.Password = dr["Password"].ToString();
                    C.TipoUsuario = dr["TipoUsuario"].ToString();
                    C.ID_Usuario = Convert.ToInt32(dr["ID_Usuario"].ToString());
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

