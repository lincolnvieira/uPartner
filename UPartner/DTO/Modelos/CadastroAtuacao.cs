using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.Modelos
{
    public class CadastroAtuacao
    {
        public int CadastroAtuacao_ID { get; set; }
        public int mUsuario { get; set; }
        public string Area { get; set; }
        public int StatusSolicitacao { get; set; }
        public DateTime DataSolicitacao { get; set; }
    }
}
