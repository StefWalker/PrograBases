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
    public class daoRecibos
    {
        public static List<entRecibos> ListarRecibos(int ID_Propiedad)
        {

            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entRecibos> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarRecibos", cnx);
                cmd.Parameters.AddWithValue("@inID_Propiedad", ID_Propiedad);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entRecibos>();
                while (dr.Read())
                {
                    entRecibos C = new entRecibos();
                    C.ID_Recibo = Convert.ToInt32(dr["ID_Recibo"].ToString());
                    C.ID_Propiedad = Convert.ToInt32(dr["ID_Propiedad"].ToString());
                    C.ID_Concepto = Convert.ToInt32(dr["ID_Concepto"].ToString());
                    C.Fecha = Convert.ToDateTime(dr["Fecha"].ToString());
                    C.Monto = Convert.ToDouble(dr["Monto"].ToString());
                    C.Estado = Convert.ToInt32(dr["Estado"].ToString());
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
        public static List<entRecibos> ListarRecibosPagos(int ID_Propiedad)
        {

            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entRecibos> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarRecibosPagos", cnx);
                cmd.Parameters.AddWithValue("@inID_Propiedad", ID_Propiedad);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entRecibos>();
                while (dr.Read())
                {
                    entRecibos C = new entRecibos();
                    C.ID_Recibo = Convert.ToInt32(dr["ID_Recibo"].ToString());
                    C.ID_Propiedad = Convert.ToInt32(dr["ID_Propiedad"].ToString());
                    C.ID_Concepto = Convert.ToInt32(dr["ID_Concepto"].ToString());
                    C.Fecha = Convert.ToDateTime(dr["Fecha"].ToString());
                    C.Monto = Convert.ToDouble(dr["Monto"].ToString());
                    C.Estado = Convert.ToInt32(dr["Estado"].ToString());
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
