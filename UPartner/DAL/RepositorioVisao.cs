using DAL.DAO.VisaoDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class RepositorioVisao
    {
        static V_PublicacoesDAO v_publicacoesDAO;
        static V_PublicacoesDenunciadasDAO v_publicacoesDenunciadasDAO;
        static V_UsuariosBloqueadosDAO v_usuariosBloqueadosDAO;
        static V_EventosDAO v_eventosDAO;
        static V_AtuacoesUsuarioDAO v_atuacoesUsuarioDAO;
        static V_PublicacoesFocoDAO v_publicacoesFocoDAO;
        static V_EventosFocoDAO v_eventosFocoDAO;
        static V_CadastroAtuacaoDAO v_cadastroAtuacaoDAO;



        public static V_CadastroAtuacaoDAO GetV_CadastroAtuacaoDAO()
        {
            if (v_cadastroAtuacaoDAO == null)
            {
                v_cadastroAtuacaoDAO = new V_CadastroAtuacaoDAO();
            }
            return v_cadastroAtuacaoDAO;
        }


        public static V_UsuariosBloqueadosDAO GetV_UsuariosBloqueadosDAO()
        {
            if (v_usuariosBloqueadosDAO == null)
            {
                v_usuariosBloqueadosDAO = new V_UsuariosBloqueadosDAO();
            }
            return v_usuariosBloqueadosDAO;
        }


        public static V_EventosFocoDAO GetV_EventosFocoDAO()
        {
            if (v_eventosFocoDAO == null)
            {
                v_eventosFocoDAO = new V_EventosFocoDAO();
            }
            return v_eventosFocoDAO;
        }

        public static V_PublicacoesFocoDAO GetV_PublicacoesFocoDAO()
        {
            if (v_publicacoesFocoDAO == null)
            {
                v_publicacoesFocoDAO = new V_PublicacoesFocoDAO();
            }
            return v_publicacoesFocoDAO;
        }


        public static V_AtuacoesUsuarioDAO GetV_AtuacoesUsuarioDAO()
        {
            if (v_atuacoesUsuarioDAO == null)
            {
                v_atuacoesUsuarioDAO = new V_AtuacoesUsuarioDAO();
            }
            return v_atuacoesUsuarioDAO;
        }

        public static V_PublicacoesDAO GetV_PublicacoesDAO()
        {
            if (v_publicacoesDAO == null)
            {
                v_publicacoesDAO = new V_PublicacoesDAO();
            }
            return v_publicacoesDAO;
        }

        public static V_PublicacoesDenunciadasDAO GetV_PublicacoesDenunciadasDAO()
        {
            if (v_publicacoesDenunciadasDAO == null)
            {
                v_publicacoesDenunciadasDAO = new V_PublicacoesDenunciadasDAO();
            }
            return v_publicacoesDenunciadasDAO;
        }

        public static V_EventosDAO GetV_EventosDAO()
        {
            if (v_eventosDAO == null)
            {
                v_eventosDAO = new V_EventosDAO();
            }
            return v_eventosDAO;
        }
    }
}
