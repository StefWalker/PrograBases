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
                    C.ID_Recibo = Convert.ToInt32(dr["ID_Recibo"].ToString());
                    C.NumPropiedad = Convert.ToInt32(dr["NumPropiedad"].ToString());
                    C.TipoRecibo = Convert.ToInt32(dr["TipoRecibo"].ToString());
                    C.Fecha = Convert.ToDateTime(dr["Fecha"].ToString());
                    C.Cobro = Convert.ToDouble(dr["Cobro"].ToString());
                    C.MontoInteres = Convert.ToDouble(dr["MontoInteres"].ToString());
                    C.MontoPagado = Convert.ToDouble(dr["MontoPagado"].ToString());
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
        public static entComprobante BuscarComprobante(int id)
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
                obj.ID_Recibo = Convert.ToInt32(dr["ID_Recibo"].ToString());
                obj.NumPropiedad = Convert.ToInt32(dr["NumPropiedad"].ToString());
                obj.TipoRecibo = Convert.ToInt32(dr["TipoRecibo"].ToString());
                obj.Fecha = Convert.ToDateTime(dr["Fecha"].ToString());
                obj.Cobro = Convert.ToDouble(dr["Cobro"].ToString());
                obj.MontoInteres = Convert.ToDouble(dr["MontoInteres"].ToString());
                obj.MontoPagado = Convert.ToDouble(dr["MontoPagado"].ToString());

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
