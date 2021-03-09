using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.Modelos
{
    public class Publicacao
    {
        public int Publicacao_ID { get; set; }
        public string Titulo { get; set; }
        public string Descricao { get; set; }
        public DateTime DataPublicacao { get; set; }
        public bool FlagAtiva { get; set; }
        public int mUsuario { get; set; }
    }
}
