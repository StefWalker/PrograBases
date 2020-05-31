using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negTipoDoc
    {
       
        public static entTipoDoc BuscarTipoDoc(int tipo)
        {
            return daoTipoDoc.BuscarTipoDoc(tipo);
        }
    }
}
