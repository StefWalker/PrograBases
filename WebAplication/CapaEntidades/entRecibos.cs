using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entRecibos
    {
        public int ID_Recibo { get; set; }
        public int ID_Propiedad { get; set; }
        public int ID_Concepto { get; set; }
        public DateTime Fecha { get; set; }
        public int Estado { get; set; }
    }
}
