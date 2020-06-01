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
        public decimal Valor { get; set; }
        public string Descripcion { get; set; }
        public string Direccion { get; set; }
        public int  Activo { get; set; }
    }
}
