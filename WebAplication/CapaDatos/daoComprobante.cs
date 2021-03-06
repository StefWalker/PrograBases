﻿using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class daoComprobante
    {
        public static List<entComprobante> ListarComprobantes(int NumPropiedad)
        {

            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entComprobante> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarComprobantes", cnx);
                cmd.Parameters.AddWithValue("@inNumPropiedad", NumPropiedad);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entComprobante>();
                while (dr.Read())
                {
                    entComprobante C = new entComprobante();
                    C.ID_Comprobante = Convert.ToInt32(dr["ID_Comprobante"].ToString());
                    C.NumFinca = Convert.ToInt32(dr["NumFinca"].ToString());
                    C.Fecha = Convert.ToDateTime(dr["Fecha"].ToString());
                    C.Monto = Convert.ToDouble(dr["Monto"].ToString());
                    C.MedioPago = dr["MedioPago"].ToString();
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
        public static entComprobante ReadComprobante(int id)
        {
            entComprobante obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ComprobanteRead", cnx);
                cmd.Parameters.AddWithValue("@inID_Comprobante", id);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entComprobante();
                dr.Read();
                obj.ID_Comprobante = Convert.ToInt32(dr["ID_Comprobante"].ToString());
                obj.NumFinca = Convert.ToInt32(dr["NumFinca"].ToString());
                obj.Fecha = Convert.ToDateTime(dr["Fecha"].ToString());
                obj.Monto = Convert.ToDouble(dr["Monto"].ToString());
                obj.MedioPago = dr["MedioPago"].ToString();


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

        public static void IniciarTrans()
        {
            Conexion cn = new Conexion();
            SqlConnection cnx = cn.Conectar();
            SqlCommand cmd = new SqlCommand("PagosTransaction", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cnx.Open();
            cn.Conectar();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();

        }
        public static void CancelarTrans()
        {
            Conexion cn = new Conexion();
            SqlConnection cnx = cn.Conectar();
            SqlCommand cmd = new SqlCommand("RollBackPagos", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cnx.Open();
            cn.Conectar();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();

        }

    }
}
