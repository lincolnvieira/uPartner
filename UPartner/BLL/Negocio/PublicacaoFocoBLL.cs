using DAL;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Negocio
{
    public class PublicacaoFocoBLL
    {
        public static void InserirPublicacaoFoco(List<PublicacaoFoco> lsPublicacaoFoco)
        {
            foreach (var item in lsPublicacaoFoco)
            {
                RepositorioModelo.GetPublicacaoFocoDAO().Inserir(item);
            }
        }
    }
}