﻿using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Data;
using System.Globalization;

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
                cmd = new SqlCommand("PropiedadInsert", cnx);
                cmd.Parameters.AddWithValue("@inNumPropiedad", obj.NumPropiedad);
                cmd.Parameters.AddWithValue("@inValor", obj.Valor);
                cmd.Parameters.AddWithValue("@inDireccion", obj.Direccion);
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
                cmd = new SqlCommand("PropiedadSearch", cnx);
                cmd.Parameters.AddWithValue("@inNumPropiedad", numero);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entPropiedad();
                dr.Read();
                obj.NumPropiedad = Convert.ToInt32(dr["NumPropiedad"].ToString());
                obj.Valor = Convert.ToDouble(dr["Valor"].ToString());
                obj.ID_Propiedad = Convert.ToInt32(dr["ID_Propiedad"].ToString());
                obj.Direccion = dr["Direccion"].ToString();
                obj.Fecha = Convert.ToDateTime(dr["Fecha"].ToString());
                obj.M3Acumulados = Convert.ToInt32(dr["M3Acumulados"].ToString());
                obj.M3AcumuladosUltimoRecibo = Convert.ToInt32(dr["M3AcumuladosUltimoRecibo"].ToString());

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
        public static entPropiedad BuscarPropiedadID(int id)
        {
            entPropiedad obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropiedadRead", cnx);
                cmd.Parameters.AddWithValue("@inID_Propiedad", id);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entPropiedad();
                dr.Read();
                obj.NumPropiedad = Convert.ToInt32(dr["NumPropiedad"].ToString());
                obj.Valor = Convert.ToDouble(dr["Valor"].ToString());
                obj.ID_Propiedad = Convert.ToInt32(dr["ID_Propiedad"].ToString());
                obj.Direccion = dr["Direccion"].ToString();
                obj.Fecha = Convert.ToDateTime(dr["Fecha"].ToString());
                obj.M3Acumulados = Convert.ToInt32(dr["M3Acumulados"].ToString());
                obj.M3AcumuladosUltimoRecibo = Convert.ToInt32(dr["M3AcumuladosUltimoRecibo"].ToString());

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
        public static int DeletePropiedad(int numero )
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropiedadDeleteByNum ", cnx);
                cmd.Parameters.AddWithValue("@inNumPropiedad", numero);
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
        public static int ModificarPropiedad(entPropiedad obj,int numViejo)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropiedadUpdateB", cnx);
                cmd.Parameters.AddWithValue("@inNumPropiedad", numViejo);
                cmd.Parameters.AddWithValue("@inNewNumPropiedad", obj.NumPropiedad);
                cmd.Parameters.AddWithValue("@inValor", obj.Valor);
                cmd.Parameters.AddWithValue("@inDireccion", obj.Direccion);
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

        public static List<entPropiedad> ListarPropiedades(int ID_Propietario)
        {
           
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entPropiedad> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarPropiedades", cnx);
                cmd.Parameters.AddWithValue("@inID_Propietario", ID_Propietario);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entPropiedad>();
                while(dr.Read())
                {
                    entPropiedad C = new entPropiedad();
                    C.NumPropiedad = Convert.ToInt32(dr["NumPropiedad"].ToString());
                    C.ID_Propiedad = Convert.ToInt32(dr["ID_Propiedad"].ToString());
                    C.Direccion = dr["Direccion"].ToString();
                    C.Fecha = Convert.ToDateTime(dr["Fecha"].ToString());
                    C.Valor = Convert.ToDouble(dr["Valor"].ToString());
                    C.M3Acumulados = Convert.ToInt32(dr["M3Acumulados"].ToString());
                    C.M3AcumuladosUltimoRecibo = Convert.ToInt32(dr["M3AcumuladosUltimoRecibo"].ToString());
                    lista.Add(C);
                }
            }
            catch(Exception e)
            {
                lista = null;
            }
            finally
            {
                cmd.Connection.Close();

            }
            return lista;
        }
        public static List<entPropiedad> ListarPropiedadesUser(int ID_Usuario)
        {

            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entPropiedad> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarPropiedadesUser", cnx);
                cmd.Parameters.AddWithValue("@inID_Usuario", ID_Usuario);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entPropiedad>();
                while (dr.Read())
                {
                    entPropiedad C = new entPropiedad();
                    C.NumPropiedad = Convert.ToInt32(dr["NumPropiedad"].ToString());
                    C.ID_Propiedad = Convert.ToInt32(dr["ID_Propiedad"].ToString());
                    C.Direccion = dr["Direccion"].ToString();
                    C.Fecha = Convert.ToDateTime(dr["Fecha"].ToString());
                    C.Valor = Convert.ToDouble(dr["Valor"].ToString());
                    C.M3Acumulados = Convert.ToInt32(dr["M3Acumulados"].ToString());
                    C.M3AcumuladosUltimoRecibo = Convert.ToInt32(dr["M3AcumuladosUltimoRecibo"].ToString());
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
