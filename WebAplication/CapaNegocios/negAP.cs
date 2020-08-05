using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negAP
    {
        public static void ConfirmacionAP(int monto, int idPropiedad , int plazo )
        {
            daoAP.ConfirmacionAP(monto, idPropiedad, plazo);
        }
    }
}
