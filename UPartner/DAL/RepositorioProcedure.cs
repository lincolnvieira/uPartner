using DAL.DAO.StoreProcedureDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class RepositorioProcedure
    {
        static Sp_EventosDAO sp_eventosDAO;
        static Sp_PublicacoesDAO sp_publicacoesDAO;

        public static Sp_EventosDAO GetSp_EventosDAO()
        {
            if (sp_eventosDAO == null)
            {
                sp_eventosDAO = new Sp_EventosDAO();
            }
            return sp_eventosDAO;
        }

        public static Sp_PublicacoesDAO GetSp_PublicacoesDAO()
        {
            if (sp_publicacoesDAO == null)
            {
                sp_publicacoesDAO = new Sp_PublicacoesDAO();
            }
            return sp_publicacoesDAO;
        }


    }
}
