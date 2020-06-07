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
        public static entProCC BuscarProCC(object id, object id2)
        {
            return daoProCC.BuscarProCC(id, id2);
        }
        public static int DeleteProxCC(object concepto, object propiedad)
        {
            return daoProCC.DeleteProxCC(concepto, propiedad);
        }
        public static int AgregarProCC(object pxc)
        {
            return daoProCC.AgregarProCC(pxc);
        }
        public static int ModificarProCC(object pxc)
        {
            return daoProCC.ModificarProCC(pxc);
        }
    }
}
