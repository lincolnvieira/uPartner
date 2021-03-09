using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.Modelos
{
    public class Denuncia
    {
        public int Denuncia_ID { get; set; }
        public DateTime DataDenuncia { get; set; }
        public int mPublicacao { get; set; }
        public int mUsuario { get; set; }
        public int mTipoDenuncia { get; set; }
    }
}
