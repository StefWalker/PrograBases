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
    public class daoConceptoCobro
    {
        public static entConceptoCobro BuscarConcepto(int id)
        {
            entConceptoCobro obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("CCobroRead", cnx);
                cmd.Parameters.AddWithValue("@inID_CC", id);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entConceptoCobro();
                dr.Read();
                obj.ID_CC = Convert.ToInt32(dr["ID_CC"].ToString());
                obj.DiaCobro = Convert.ToInt32(dr["DiaCobro"].ToString());
                obj.DiaVencimiento = Convert.ToInt32(dr["DiaVencimiento"].ToString());
                obj.Concepto = dr["Concepto"].ToString();
                obj.TipoCC = dr["TipoCC"].ToString();
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
