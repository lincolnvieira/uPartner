using DAL;
using DTO.Modelos;
using DTO.StoreProcedure;
using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Negocio
{
    public class EventoBLL
    {
        public static void InserirEvento(Evento evento)
        {
            RepositorioModelo.GetEventoDAO().Inserir(evento);
        }

        public static IEnumerable<Sp_Eventos> ListarEventos(int usuarioID)
        {
            string sWhere = usuarioID.ToString();
            return RepositorioProcedure.GetSp_EventosDAO().Listar(sWhere);
        }

        public static int BuscarUltimoID(int id)
        {
            return RepositorioModelo.GetEventoDAO().UltimoID(id);
        }

        public static IEnumerable<V_Eventos> ListarEventosParticipando(IEnumerable<Participante> participantes)
        {
            string sWhere = "Evento_Id IN (";
            int cont = 0;
            foreach (var item in participantes)
            {
                if(cont == 0)
                    sWhere += item.mEvento;
                else
                    sWhere += "," + item.mEvento;

                cont++;
            }
            sWhere += ")";
            return RepositorioVisao.GetV_EventosDAO().Listar(sWhere);

        }

        public static IEnumerable<V_Eventos> ListarEventosCriados(int id)
        {
            string sWhere = string.Format("Usuario_ID = {0}", id);
            return RepositorioVisao.GetV_EventosDAO().Listar(sWhere);
        }

        public static Evento BuscarEventoEdit(int id)
        {
            string sWhere = string.Format("Evento_ID = {0}", id);
            return RepositorioModelo.GetEventoDAO().Obter(sWhere);
        }

        public static void AtualizarEvento(Evento evento)
        {
            string sWhere = string.Format("Evento_ID = {0}",evento.Evento_ID);
            RepositorioModelo.GetEventoDAO().Alterar(evento, sWhere);
        }


        public static void InserirEventoFoco(List<EventoFoco> lsEventoFoco)
        {
            foreach (var item in lsEventoFoco)
            {
                RepositorioModelo.GetEventoFocoDAO().Inserir(item);
            }
        }
        public static IEnumerable<V_EventosFoco> ListarEventoFoco(int eventoID)
        {
            string sWhere = string.Format("Evento_ID = {0}", eventoID.ToString());
            return RepositorioVisao.GetV_EventosFocoDAO().Listar(sWhere);
        }
        public static void DeletarEventoFoco(int eventoID)
        {
            string sWhere = string.Format("mEvento = {0}", eventoID.ToString());
            RepositorioModelo.GetEventoFocoDAO().Deletar(sWhere);
        }
    }
}
