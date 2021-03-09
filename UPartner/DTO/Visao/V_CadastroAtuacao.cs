using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.Visao
{
    public class V_CadastroAtuacao
    {
        public int CadastroAtuacao_ID { get; set; }
        public int Usuario_ID { get; set; }
        public string Nome { get; set; }
        public string Sobrenome { get; set; }
        public string Area { get; set; }
        public DateTime DataSolicitacao { get; set; }
    }
}
