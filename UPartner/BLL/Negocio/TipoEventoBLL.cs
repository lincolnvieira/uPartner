using DAL;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Negocio
{
    public class TipoEventoBLL
    {
        public static IEnumerable<TipoEvento> ListarTipoEventos()
        {
            return RepositorioModelo.GetTipoEventoDAO().Listar();
        }
    }
}
