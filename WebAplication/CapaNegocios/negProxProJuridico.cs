using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negProxProJuridico
    {
        public static int AgregarProxProJuridico(entProxProJuridico obj)
        {
            return daoProxProJuridico.AgregarProxProJuridico(obj);
        }
        public static int DeleteProxProJuridico(int ID_Juridico, int ID_Propiedad)
        {
            return daoProxProJuridico.DeleteProxProJuridico(ID_Juridico, ID_Propiedad);
        }
        public static entProxProJuridico BuscarProxProJuridico(int ID_Juridico, int ID_Propiedad)
        {
            return daoProxProJuridico.BuscarProxProJuridico(ID_Juridico, ID_Propiedad);
        }
        public static int ModificarProxProJuridico(entProxProJuridico obj)
        {
            return daoProxProJuridico.ModificarProxProJuridico(obj);
        }
    }
}