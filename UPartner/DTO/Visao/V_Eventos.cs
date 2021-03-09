using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.Visao
{
    public class V_Eventos
    {
        public int Evento_ID { get; set; }
        public string Titulo { get; set; }
        public string Descricao { get; set; }
        public string TipoEvento { get; set; }
        public string StatusEvento { get; set; }
        public DateTime DataEvento { get; set; }
        public DateTime DataCriacao { get; set; }
        public string Bairro { get; set; }
        public string CEP { get; set; }
        public string Cidade { get; set; }
        public string Rua { get; set; }
        public string Estado { get; set; }
        public int Numero { get; set; }
        public int Usuario_ID { get; set; }
        public string Nome { get; set; }
        public string Sobrenome { get; set; }
        public string Atuacao { get; set; }
    }
}
