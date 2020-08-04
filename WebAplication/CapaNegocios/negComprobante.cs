using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negComprobante
    {
        public static List<entComprobante> ListarComprobantes(int NumPropiedad)
        {
            return daoComprobante.ListarComprobantes(NumPropiedad);
        }
        public static entComprobante ReadComprobante(int id)
        {
            return daoComprobante.ReadComprobante(id);
        }
        public static void IniciarTrans()
        {
           daoComprobante .IniciarTrans();
        }
        public static void CancelarTrans()
        {
            daoComprobante.CancelarTrans();
        }

    }
}
