using DAL;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Negocio
{
    public class TipoContaBLL
    {
        public static TipoConta GetTipoConta(int id)
        {
            string sWhere = "TipoConta_ID = " + id;
            return RepositorioModelo.GetTipoContaDAO().Obter(sWhere);
        }
    }
}
