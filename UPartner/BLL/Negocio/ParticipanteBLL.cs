using DAL;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Negocio
{
    public class ParticipanteBLL
    {
        public static void InserirParticipante(Participante participante)
        {
            RepositorioModelo.GetParticipanteDAO().Inserir(participante);
        }
        public static List<Participante> ListarParticipacoes(int usuarioID)
        {
            string sWhere = string.Format("mUsuario = {0}", usuarioID);
            return RepositorioModelo.GetParticipanteDAO().Listar(sWhere).ToList();
        }

        public static void CancelarParticipacao(int eventoID, int usuarioID)
        {
            string sWhere = string.Format("mUsuario = {0} AND mEvento = {1}", usuarioID, eventoID);
            RepositorioModelo.GetParticipanteDAO().Deletar(sWhere);
        }
    }
}
