using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negPropJuridico
    {
        public static int AgregarPropJuridico(entPropJuridico obj)
        {
            return daoPropJuridico.AgregarPropJuridico(obj);
        }
        public static entPropJuridico BuscarPropJuridico(int documento)
        {
            return daoPropJuridico.BuscarPropJuridico(documento);
        }
        
    }
}
