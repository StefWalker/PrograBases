using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negPropietario
    {
        public static int AgregarPropietario(entPropietario obj)
        {
            return daoPropietario.AgregarPropietario(obj);
        }
        public static entPropietario BuscarPropietario(string id)
        {
            return daoPropietario.BuscarPropietario(id);
        }
        public static int DeletePropietario(int identificacion, string nombre)
        {
            return daoPropietario.DeletePropietario(identificacion, nombre);
        }
        public static entPropietario BuscarPropietarioID(int id)
        {
            return daoPropietario.BuscarPropietarioID(id);
        }
        public static int ModificarPropietario(entPropietario obj, int idVieja)
        {
            return daoPropietario.ModificarPropietario(obj, idVieja);
        }
        public static List<entPropietario> ListarPropietariosFisicos(int ID_Propiedad)
        {
            return daoPropietario.ListarPropietariosFisicos(ID_Propiedad);
        }
     }
}
