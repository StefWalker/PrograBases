﻿using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class negRecibos
    {
        public static List<entRecibos> ListarRecibos(int ID_Propiedad)
        {
            return daoRecibos.ListarRecibos(ID_Propiedad);
        }
        public static List<entRecibos> ListarRecibosPagos(int ID_Propiedad)
        { 
            return daoRecibos.ListarRecibosPagos(ID_Propiedad);
        }
        public static List<entRecibos> ListarConfirmados()
        {
            return daoRecibos.ListarConfirmados();
        }
        public static List<entRecibos> ListarReciboxCom(int id)
        {
            return daoRecibos.ListarReciboxCom(id);
        }
        public static void GenerarMoratorios()
        {
            daoRecibos.GenerarMoratorios();
        }
    }
}
