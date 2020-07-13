using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negRecibos
    {
        public static List<entRecibos> ListarRecibos(int ID_Propiedad)
        {
            return daoRecibos.ListarRecibos(ID_Propiedad);
        }
    }
}
