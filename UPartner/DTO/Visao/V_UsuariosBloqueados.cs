using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.Visao
{
    public class V_UsuariosBloqueados
    {
        public int Usuario_ID { get; set; }
        public string Nome { get; set; }
        public string Sobrenome { get; set; }
        public string Motivo_Bloqueio { get; set; }
        public int Publicacao_ID { get; set; }
        public DateTime Data_Cadastro { get; set; }
        public DateTime Data_Bloqueio { get; set; }
    }
}
