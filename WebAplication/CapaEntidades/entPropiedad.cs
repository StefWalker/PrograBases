using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entPropiedad
    {
        public int ID_Propiedad { get; set; }
        public int NumPropiedad { get; set; }
        public int Valor { get; set; }
        public string Direccion { get; set; }
        public DateTime Fecha { get; set; }
        public int M3Acumulados { get; set; }
        public int M3AcumuladosUltimoRecibo { get; set; }


    }
}
