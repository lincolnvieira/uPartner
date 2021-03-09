using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.VisaoDAO
{
    public class V_EventosFocoDAO : DAO<V_EventosFoco, string>
    {
        public override void Alterar(V_EventosFoco item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(V_EventosFoco item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<V_EventosFoco> Listar(string chave = null)
        {
            try
            {
                List<V_EventosFoco> lsAtuacoes = new List<V_EventosFoco>();
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM v_EventosFoco WHERE " + chave;
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    V_EventosFoco v_eventosFoco = new V_EventosFoco();
                    v_eventosFoco.Evento_ID = (int)reader["Evento_ID"];
                    v_eventosFoco.Foco = (int)reader["Foco"];
                    v_eventosFoco.Descricao = (string)reader["Descricao"];

                    lsAtuacoes.Add(v_eventosFoco);
                }
                return lsAtuacoes;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                FecharConexao();
            }
        }

        public override V_EventosFoco Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
