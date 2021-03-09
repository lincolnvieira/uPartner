using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.Visao
{
    public class V_UsuarioDenunciados
    {
        public int Usuario_ID { get; set; }
        public byte[] Foto { get; set; }
        public string Mimetype { get; set; }
        public string Nome { get; set; }
        public int Publicacao { get; set; }
        public int Quantidade_Denuncia { get; set; }
    }
}
