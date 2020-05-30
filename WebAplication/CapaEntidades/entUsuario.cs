using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entUsuario
    {
        public int ID_Usuario { get; set; }
        public string Nombre { get; set; }
        public string Password { get; set; }
        public string TipoUsuario { get; set; }
        public DateTime Fecha_Creacion { get; set; }
        public int Activo { get; set; }

    }
}
