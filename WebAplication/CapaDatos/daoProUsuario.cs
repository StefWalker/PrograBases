using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Data;

namespace CapaDatos
{
    public class daoProUsuario
    {
        public static int AgregarProUsuario(entProUsuario obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("Pro_x_UsuarioInsert ", cnx);
                cmd.Parameters.AddWithValue("@ID_Propiedad", obj.ID_Propiedad);
                cmd.Parameters.AddWithValue("@ID_Usuario", obj.ID_Usuario);               
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
