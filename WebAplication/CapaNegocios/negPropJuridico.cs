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
        public static entPropJuridico BuscarPropJuridico(string documento)
        {
            return daoPropJuridico.BuscarPropJuridico(documento);
        }
        public static int DeletePropJuridico(int documento)
        {
            return daoPropJuridico.DeletePropJuridico(documento);
        }
        public static int ModificarPropJuridico(entPropJuridico obj, string documento)
        {
            return daoPropJuridico.ModificarPropJuridico(obj, documento);
        }
        public static List<entPropJuridico> ListarPropietariosJuridicos(int ID_Propiedad)
        {
            return daoPropJuridico.ListarPropietariosJuridicos(ID_Propiedad);
        }
    }
}
