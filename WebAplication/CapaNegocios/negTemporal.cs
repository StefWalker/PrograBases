using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negTemporal
    {
        public static int AgregarTemporal(int id)
        {
            return daoTemporal.AgregarTemporal(id);
        }
        public static int DeleteTemp(int id)
        {
            return daoTemporal.DeleteTemp(id);
        }
    }
}
