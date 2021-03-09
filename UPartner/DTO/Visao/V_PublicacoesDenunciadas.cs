﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.Visao
{
    public class V_PublicacoesDenunciadas
    {
        public int Publicacao_ID { get; set; }
        public string Titulo { get; set; }
        public string Descricao { get; set; }
        public int Quantidade_Denuncia { get; set; }
        public int Usuario_ID { get; set; }
        public string Nome { get; set; }
        public string Sobrenome { get; set; }
        public DateTime Data_Publicacao { get; set; }
        public byte[] Foto_Publicacao { get; set; }
        public string MimeType { get; set; }
    }
}