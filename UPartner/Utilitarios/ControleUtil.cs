using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using static System.Net.Mime.MediaTypeNames;

namespace Utilitarios
{
    public class ControleUtil
    {
        public static string GetMd5Hash(string texto)
        {
            MD5 md5 = MD5.Create();
            byte[] data = md5.ComputeHash(Encoding.UTF8.GetBytes(texto));
            StringBuilder buider = new StringBuilder();

            for (int i = 0; i < data.Length; i++)
            {
                buider.Append(data[i].ToString("x2"));
            }
            return buider.ToString();
        }

        public static bool ValidarMaiorIdade(DateTime idade)
        {
            return (idade.AddYears(18) > DateTime.Now);
        }

        public void MensagemPadrao(int mensagem)
        {

        }

        public static byte[] GetImageByte()
        {
            return System.IO.File.ReadAllBytes("C:/inetpub/wwwroot/UPartner/Imagens/iconfinder_profle_1055000.png");
        }

        public static string GetUrlAtual()
        {
            return HttpContext.Current.Request.Url.AbsoluteUri;
        }
    }
}
