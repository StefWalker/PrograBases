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
    public class negProPro
    {
        public static int AgregarProPro(entProPro obj)
        {
            return daoProPro.AgregarProPro(obj);
        }
        public static int DeleteProPro(int ID_Propiedad, int ID_Propietario)
        {
            return daoProPro.DeleteProPro(ID_Propiedad, ID_Propietario);
        }
        public static entProPro BuscarProPro(int ID_Propiedad, int ID_Propietario)
        {
            return daoProPro.BuscarProPro(ID_Propiedad, ID_Propietario);
        }
        public static int ModificarProPro(entProPro obj)
        {
            return daoProPro.ModificarProPro(obj);
        }
    }
}
