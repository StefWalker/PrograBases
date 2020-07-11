using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace CapaDatos
{
    public class daoTipoDoc
    {
       
        public static entTipoDoc BuscarTipoDoc(int tipo)
        {
            entTipoDoc obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("TipoDocSearch", cnx);
                cmd.Parameters.AddWithValue("@inTipoDoc", tipo);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entTipoDoc();
                dr.Read();
                obj.ID_TDoc = Convert.ToInt32(dr["ID_TDoc"].ToString());
                obj.TipoDoc = Convert.ToInt32(dr["TipoDoc"].ToString());
                obj.Tipo = dr["Tipo"].ToString();

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
        public static entTipoDoc BuscarTipoID(int id)
        {
            entTipoDoc obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("TipoDocRead", cnx);
                cmd.Parameters.AddWithValue("@inID_TDoc",id);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entTipoDoc();
                dr.Read();
                obj.TipoDoc = Convert.ToInt32(dr["TipoDoc"].ToString());
                obj.Tipo = dr["Tipo"].ToString();
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

    }
}
