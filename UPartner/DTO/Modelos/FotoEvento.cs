using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.Modelos
{
    public class FotoEvento
    {
        public byte[] Foto { get; set; }
        public string MimeType { get; set; }
        public int mEvento { get; set; }
    }
}
