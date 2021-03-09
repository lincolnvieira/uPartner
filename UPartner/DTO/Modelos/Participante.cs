using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.Modelos
{
    public class Participante
    {
        public int mEvento { get; set; }
        public int mUsuario { get; set; }
        public DateTime DataParticipacao { get; set; }
    }
}
