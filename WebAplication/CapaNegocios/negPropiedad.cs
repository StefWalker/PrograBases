using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negPropiedad
    {
        public static int AgregarPropiedad(entPropiedad obj)
        {
            return daoPropiedad.AgregarPropiedad(obj);
        }
        public static entPropiedad BuscarPropiedad(int numero)
        {
            return daoPropiedad.BuscarPropiedad(numero);
        }
        public static int DeletePropiedad(int numero)
        {
            return daoPropiedad.DeletePropiedad(numero);
        }
        public static int ModificarPropiedad(entPropiedad obj, int numViejo)
        {
            return daoPropiedad.ModificarPropiedad(obj, numViejo);
        }
        public static List<entPropiedad> ListarPropiedades(int ID_Propietario)
        {
            return daoPropiedad.ListarPropiedades(ID_Propietario);
        }
        public static List<entPropiedad> ListarPropiedadesUser(int ID_Usuario)
        {
            return daoPropiedad.ListarPropiedadesUser(ID_Usuario);
        }
    }
}

