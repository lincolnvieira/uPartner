using DAL;
using DTO.Modelos;

namespace BLL.Negocio
{
    public class DenunciaBLL
    {
        public static void Inserir(Denuncia denuncia)
        {
            RepositorioModelo.GetDenunciaDAO().Inserir(denuncia);
        }
    }
}
