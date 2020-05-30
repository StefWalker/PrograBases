using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

 namespace CapaEntidades
{
    public class entPropJuridico
    {
        public int ID_Propietario { get; set; }
        public string Nombre { get; set; }
        public int ID_Juridico { get; set; }
        public int ID_TDoc { get; set; }
        public int Activo { get; set; }
    }
}
