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
        public static entTemporal IniciarTrans()
        {
            return daoTemporal.IniciarTrans();
        }
        public static int FinalTrans(int num)
        {
            return daoTemporal.FinalTrans(num);
        }
    }
}
