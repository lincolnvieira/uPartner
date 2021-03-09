using DAL;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Negocio
{
    public class FotoPublicacaoBLL
    {
        public static void InserirFotoPublicacao(FotoPublicacao fotoPublicacao)
        {
            RepositorioModelo.GetFotoPublicacaoDAO().Inserir(fotoPublicacao);
        }
    }
}
