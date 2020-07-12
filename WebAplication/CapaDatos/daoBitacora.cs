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
    public class daoBitacora
    {
        public static List<entBitacora> ListarBitacora(int IdEntityType,DateTime FechaInicial , DateTime FechaFinal)
        {

            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entBitacora> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarBitacora", cnx);
                cmd.Parameters.AddWithValue("@inIdEntityType", IdEntityType);
                cmd.Parameters.AddWithValue("@inFechaInicial", FechaInicial);
                cmd.Parameters.AddWithValue("@inFechaFinal", FechaFinal);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entBitacora>();
                while (dr.Read())
                {
                    entBitacora C = new entBitacora();
                    C.ID_Bitacora = Convert.ToInt32(dr["ID_Bitacora"].ToString());
                    C.IdEntityType = Convert.ToInt32(dr["IdEntityType "].ToString());
                    C.EntityId = Convert.ToInt32(dr["Identificacion"].ToString());
                    C.jsonAntes = dr["jsonAntes"].ToString();
                    C.jsonDespues = dr["jsoDespues"].ToString();
                    C.insertedAt = Convert.ToDateTime(dr["insertedAt"].ToString());
                    C.insertedby = dr["insertedby"].ToString();
                    C.insertedIn = dr["insertedIn"].ToString();
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
