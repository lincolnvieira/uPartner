using DAL.DAO;
using DAL.DAO.ModeloDAO;
using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class RepositorioModelo
    {
        static UsuarioDAO usuarioDAO;
        static AdministradorDAO administradorDAO;
        static PublicacaoDAO publicacaoDAO;
        static FotoPublicacaoDAO fotoPublicacaoDAO;
        static AtuacaoDAO atuacaoDAO;
        static TipoContaDAO tipoContaDAO;
        static EventoDAO eventoDAO;
        static TipoEventoDAO tipoEventoDAO;
        static TipoDenunciaDAO tipoDenunciaDAO;
        static FotoEventoDAO fotoEventoDAO;
        static ParticipanteDAO participanteDAO;
        static UsuarioAtuacaoDAO usuarioAtuacaoDAO;
        static PublicacaoFocoDAO publicacaoFocoDAO;
        static EventoFocoDAO eventoFocoDAO;
        static DenunciaDAO denunciaDAO;
        static CadastroAtuacaoDAO cadastroAtuacaoDAO;


        public static CadastroAtuacaoDAO GetCadastroAtuacaoDAO()
        {
            if (cadastroAtuacaoDAO == null)
            {
                cadastroAtuacaoDAO = new CadastroAtuacaoDAO();
            }
            return cadastroAtuacaoDAO;
        }

        public static AdministradorDAO GetAdministradorDAO()
        {
            if (administradorDAO == null)
            {
                administradorDAO = new AdministradorDAO();
            }
            return administradorDAO;
        } 

        public static EventoFocoDAO GetEventoFocoDAO()
        {
            if (eventoFocoDAO == null)
            {
                eventoFocoDAO = new EventoFocoDAO();
            }
            return eventoFocoDAO;
        }


        public static PublicacaoFocoDAO GetPublicacaoFocoDAO()
        {
            if (publicacaoFocoDAO == null)
            {
                publicacaoFocoDAO = new PublicacaoFocoDAO();
            }
            return publicacaoFocoDAO;
        }


        public static FotoEventoDAO GetFotoEventoDAO()
        {
            if (fotoEventoDAO == null)
            {
                fotoEventoDAO = new FotoEventoDAO();
            }
            return fotoEventoDAO;
        }


        public static UsuarioDAO GetUsuarioDAO()
        {
            if(usuarioDAO == null)
            {
                usuarioDAO = new UsuarioDAO();
            }
            return usuarioDAO;
        }

        public static ParticipanteDAO GetParticipanteDAO()
        {
            if (participanteDAO == null)
            {
                participanteDAO = new ParticipanteDAO();
            }
            return participanteDAO;
        }

        public static PublicacaoDAO GetPublicacaoDAO()
        {
            if (publicacaoDAO == null)
            {
                publicacaoDAO = new PublicacaoDAO();
            }
            return publicacaoDAO;
        }

        public static FotoPublicacaoDAO GetFotoPublicacaoDAO()
        {
            if (fotoPublicacaoDAO == null)
            {
                fotoPublicacaoDAO = new FotoPublicacaoDAO();
            }
            return fotoPublicacaoDAO;
        }

        public static AtuacaoDAO GetAtuacaoDAO()
        {
            if (atuacaoDAO == null)
            {
                atuacaoDAO = new AtuacaoDAO();
            }
            return atuacaoDAO;
        }

        public static EventoDAO GetEventoDAO()
        {
            if (eventoDAO == null)
            {
                eventoDAO = new EventoDAO();
            }
            return eventoDAO;
        }

        public static TipoEventoDAO GetTipoEventoDAO()
        {
            if (tipoEventoDAO == null)
            {
                tipoEventoDAO = new TipoEventoDAO();
            }
            return tipoEventoDAO;
        }

        public static TipoDenunciaDAO GetTipoDenunciaDAO()
        {
            if (tipoDenunciaDAO == null)
            {
                tipoDenunciaDAO = new TipoDenunciaDAO();
            }
            return tipoDenunciaDAO;
        }

        public static TipoContaDAO GetTipoContaDAO()
        {
            if (tipoContaDAO == null)
            {
                tipoContaDAO = new TipoContaDAO();
            }
            return tipoContaDAO;
        }

        public static UsuarioAtuacaoDAO GetUsuarioAtuacaoDAO()
        {
            if(usuarioAtuacaoDAO == null)
            {
                usuarioAtuacaoDAO = new UsuarioAtuacaoDAO();
            }
            return usuarioAtuacaoDAO;
        }
        public static DenunciaDAO GetDenunciaDAO()
        {
            if (denunciaDAO == null)
            {
                denunciaDAO = new DenunciaDAO();
            }
            return denunciaDAO;
        }

    }
}
