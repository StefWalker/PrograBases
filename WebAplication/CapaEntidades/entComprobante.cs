using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entComprobante
    {
        public int ID_Comprobante { get; set; }
        public int ID_Recibo { get; set; }
        public int NumPropiedad { get; set; }
        public int TipoRecibo { get; set; }
        public DateTime Fecha { get; set; }
        
    }
}
