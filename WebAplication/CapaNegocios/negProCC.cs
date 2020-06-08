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
    public class negProCC
    {
        public static entProCC BuscarProCC(int id, int id2)
        {
            return daoProCC.BuscarProCC(id, id2);
        }
        public static int DeleteProxCC(int concepto, int propiedad)
        {
            return daoProCC.DeleteProxCC(concepto, propiedad);
        }
        public static int AgregarProCC(entProCC obj)
        {
            return daoProCC.AgregarProCC(obj);
        }
        public static int ModificarProCC(entProCC obj)
        {
            return daoProCC.ModificarProCC(obj);
        }
    }
}
