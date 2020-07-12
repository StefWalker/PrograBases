using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entBitacora
    {
        public int ID_Bitacora { get; set; }
        public int IdEntityType { get; set; }
        public int EntityId { get; set; }
        public string jsonAntes { get; set; }
        public string jsonDespues { get; set; }
        public DateTime insertedAt { get; set; }
        public String insertedby { get; set; }
        public string insertedIn { get; set; }

    }
}
