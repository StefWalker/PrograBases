using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entAP
    {
        public int ID_AP { get; set; }
        public int ID_Propiedad { get; set; }
        public int ID_Comprobante { get; set; }
        public double MontoInicial { get; set; }
        public double Saldo { get; set; }
        public double TasaInteres { get; set; }
        public double Cuota { get; set; }
        public int PlazoInicial { get; set; }
        public DateTime FechaCreacion { get; set; }
      
    }
}
