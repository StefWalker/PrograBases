﻿using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
   public class negBitacora
    {
        public static List<entBitacora> ListarBitacora(int IdEntityType)
        {
            return daoBitacora.ListarBitacora(IdEntityType);
        }
    }
}