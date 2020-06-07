using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negConceptoCobro
    {
        public static entConceptoCobro BuscarConcepto(string id)
        {
            return daoConceptoCobro.BuscarConcepto(id);
        }
    }
}
