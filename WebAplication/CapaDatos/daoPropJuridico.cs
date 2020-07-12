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
    public class daoPropJuridico
    {
        public static int AgregarPropJuridico(entPropJuridico obj)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropJuridicoInsert", cnx);
                cmd.Parameters.AddWithValue("@inDocumento", obj.Documento);
                cmd.Parameters.AddWithValue("@inID_Propietario", obj.ID_Propietario);
                cmd.Parameters.AddWithValue("@inID_TDoc", obj.ID_TDoc);
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
        public static entPropJuridico BuscarPropJuridico(string documento )
        {
            entPropJuridico  obj = null;
            SqlCommand cmd = null;    
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropJuridicoBuscar", cnx);
                cmd.Parameters.AddWithValue("@inDocumento", documento );
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entPropJuridico();
                dr.Read();
                obj.ID_TDoc = Convert.ToInt32(dr["ID_TDoc"].ToString());
                obj.Documento  = dr["Documento"].ToString();
                obj.ID_Propietario = Convert.ToInt32(dr["ID_Propietario"].ToString());
                obj.ID_Juridico = Convert.ToInt32(dr["ID_Juridico"].ToString());
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
        public static int DeletePropJuridico(int documento)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("PropJuricoDeleteB", cnx);
                cmd.Parameters.AddWithValue("@inDocumento ", documento);
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
        public static int ModificarPropJuridico(entPropJuridico obj,string documento)
        {
            int Indicador = 0;
            SqlCommand cmd = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ProJuridicoUpdateB", cnx);
                cmd.Parameters.AddWithValue("@inDocumento", documento);
                cmd.Parameters.AddWithValue("@inNewDocumento", obj.Documento);
                cmd.Parameters.AddWithValue("@inNuevoID_Propietario", obj.ID_Propietario);
                cmd.Parameters.AddWithValue("@inID_TDoc ", obj.ID_TDoc);
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
        public static List<entPropJuridico> ListarPropietariosJuridicos(int ID_Propiedad)
        {

            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entPropJuridico> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarPropietariosJuridicos", cnx);
                cmd.Parameters.AddWithValue("@inID_Propiedad", ID_Propiedad);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entPropJuridico>();
                while (dr.Read())
                {
                    entPropJuridico C = new entPropJuridico();
                    C.ID_Juridico = Convert.ToInt32(dr["ID_Juridico"].ToString());
                    C.ID_Propietario = Convert.ToInt32(dr["ID_Propietario"].ToString());
                    C.Documento = dr["Documento"].ToString();
                    C.ID_TDoc = Convert.ToInt32(dr["ID_TDoc"].ToString());
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
