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
    }
}
