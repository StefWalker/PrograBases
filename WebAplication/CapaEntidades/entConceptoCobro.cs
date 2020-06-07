using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entConceptoCobro
    {
        public int ID_CC { get; set; }
        public string TipoCC { get; set; }
        public string Concepto { get; set; }
        public int FechaVencimiento { get; set; }
        public int Fecha { get; set; }
    }
}
