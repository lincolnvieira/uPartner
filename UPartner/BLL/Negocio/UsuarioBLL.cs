using DAL;
using DAL.DAO;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using Utilitarios;

namespace BLL.Negocio
{
    public class UsuarioBLL
    {
        public static Usuario Login(string email, string senha)
        {
            senha = ControleUtil.GetMd5Hash(senha);
            //Monta o where da busca
            string sWhere = "Email = " + "'" + email + "'" + " AND Senha = " + "'" + senha + "'";

            return RepositorioModelo.GetUsuarioDAO().Obter(sWhere);
        }

        public static Usuario BuscarUsuario(int id)
        {
            string sWhere = string.Format("Usuario_ID = {0}", id);
            return RepositorioModelo.GetUsuarioDAO().Obter(sWhere);
        }

        public static void EsqueceuSenha(string email)
        {
            if (!string.IsNullOrEmpty(email))
            {
                string emailCadastrado = RepositorioModelo.GetUsuarioDAO().ObterEmail(email);

                if (!string.IsNullOrEmpty(emailCadastrado) && emailCadastrado != "")
                {
                    Usuario usuario = new Usuario();
                    usuario.Email = email;

                    //Gera a nova senha do usuário.
                    string novaSenha = GerarSenha();

                    usuario.Senha = ControleUtil.GetMd5Hash(novaSenha);
                    RepositorioModelo.GetUsuarioDAO().AlterarSenha(usuario);
                    usuario.Senha = novaSenha;

                    EnviarEmailEsqueceuSenha(usuario);
                }
                else
                {
                    throw new NotImplementedException();
                }
            }
            else
            {
                throw new NotImplementedException();
            }
        }

        public static void InserirUsuario(Usuario usuario)
        {
            usuario.Senha = ControleUtil.GetMd5Hash(usuario.Senha);

            if (usuario.FotoPerfil == null)
            {
                usuario.FotoPerfil = ControleUtil.GetImageByte();
                usuario.MimeType = "image/png";
            }

            string emailCadastrado = RepositorioModelo.GetUsuarioDAO().ObterEmail(usuario.Email);

            if (string.IsNullOrEmpty(emailCadastrado) && emailCadastrado == "")
            {
                RepositorioModelo.GetUsuarioDAO().Inserir(usuario);
                EnviarEmailConfirmacao(usuario);
            }
            else
            {
                throw new NotImplementedException();
            }
        }

        public static void BloquearUsuario(int id)
        {
            string sWhere = "Usuario_ID = " + id;
            Usuario usuario = RepositorioModelo.GetUsuarioDAO().Obter(sWhere);
            usuario.FlagBloqueado = true;
            RepositorioModelo.GetUsuarioDAO().Alterar(usuario, sWhere);
        }

        public static void DesbloquearUsuario(int id)
        {
            string sWhere = "Usuario_ID = " + id;
            Usuario usuario = RepositorioModelo.GetUsuarioDAO().Obter(sWhere);
            usuario.FlagBloqueado = false;
            RepositorioModelo.GetUsuarioDAO().Alterar(usuario, sWhere);
        }

        public static IEnumerable<Usuario> ListarUsuariosBloqueados()
        {
            string sWhere = "where FlagBloqueado = 1";
            return RepositorioModelo.GetUsuarioDAO().Listar(sWhere);
        }

        #region Métodos Privados

        private static void EnviarEmailConfirmacao(Usuario usuario)
        {
            try
            {
                MailMessage objEmail = new MailMessage();

                objEmail.From = new MailAddress("rede.social.upartner@gmail.com");
                objEmail.To.Add(usuario.Email);
                objEmail.Subject = "Conta UPartner.";
                objEmail.Body = "Caro " + usuario.Nome + " " + usuario.Sobrenome + ", <br /><br />" +
                    "<p>Sua conta na UPartner foi criada com sucesso.<p/><br />" +
                    "<p>Já pode aproveitar de todos os benéficios da nossa rede social.<p/><br />" +
                    "<br /><br />" +
                    "<div style='background: #212529; height: 60px; color: white; font-family: Arial; font-size: 50px;'><center>UPartner</center></div>";

                // Definições Padrão
                objEmail.Priority = MailPriority.High;
                objEmail.SubjectEncoding = Encoding.GetEncoding("ISO-8859-1");
                objEmail.BodyEncoding = Encoding.GetEncoding("ISO-8859-1");
                objEmail.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com"))
                {
                    smtp.EnableSsl = true;
                    smtp.Port = 587;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential("rede.social.upartner@gmail.com", "upartner123456");
                    smtp.Send(objEmail);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private static void EnviarEmailEsqueceuSenha(Usuario usuario)
        {
            try
            {
                MailMessage objEmail = new MailMessage();

                objEmail.From = new MailAddress("rede.social.upartner@gmail.com");
                objEmail.To.Add(usuario.Email);
                objEmail.Subject = "Esqueceu a Senha - UPartner.";
                objEmail.Body = "Caro cliente da UPartner, <br /><br />" +
                    "<p>Sua nova senha foi gerada com sucesso!<p/><br />" +
                    "<p>Sua Senha: " + usuario.Senha + "<p/><br />" +
                    "<br /><br />" +
                    "<div style='background: #212529; height: 60px; color: white; font-family: Arial; font-size: 50px;'><center>UPartner</center></div>";

                // Definições Padrão
                objEmail.Priority = MailPriority.High;
                objEmail.SubjectEncoding = Encoding.GetEncoding("ISO-8859-1");
                objEmail.BodyEncoding = Encoding.GetEncoding("ISO-8859-1");
                objEmail.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com"))
                {
                    smtp.EnableSsl = false;
                    smtp.Port = 587;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential("rede.social.upartner@gmail.com", "upartner123456");
                    smtp.Send(objEmail);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private static void EnviarEmailContato(string email, string assunto, string corpo, System.IO.Stream anexo1, string anexo)
        {
            try
            {
                MailMessage objEmail = new MailMessage();
                if(anexo1 != null && anexo != "") { 
                    Attachment anexar = new Attachment(anexo1, anexo);

                    objEmail.Attachments.Add(anexar);
                }

                objEmail.From = new MailAddress("rede.social.upartner@gmail.com");
                objEmail.To.Add(email);
                objEmail.Subject = assunto;
                objEmail.Body = corpo;

                // Definições Padrão
                objEmail.Priority = MailPriority.High;
                objEmail.SubjectEncoding = Encoding.GetEncoding("ISO-8859-1");
                objEmail.BodyEncoding = Encoding.GetEncoding("ISO-8859-1");
                objEmail.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com"))
                {
                    smtp.EnableSsl = true;
                    smtp.Port = 587;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential("rede.social.upartner@gmail.com", "upartner123456");
                    smtp.Send(objEmail);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private static string GerarSenha()
        {
            const string minusculos = "abcdefghijklmnopqrstuvwxyz";
            const string maiusculos = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            const string numeros = "0123456789";
            const string especiais = @"!#$%&*@\!#$%&*@\";

            string caracteres = "";

            caracteres += minusculos;
            caracteres += maiusculos;
            caracteres += numeros;
            caracteres += especiais;

            Random random = new Random();

            return new string(Enumerable.Repeat(caracteres, 20).Select(s => s[random.Next(s.Length)]).ToArray());
        }

        #endregion

        public static void AlterarUsuario(Usuario usuario)
        {
            string sWhere = string.Format("Usuario_ID = {0}", usuario.Usuario_ID);
            RepositorioModelo.GetUsuarioDAO().Alterar(usuario, sWhere);
        }

        public static void FazerContato(int idUsuario, string assunto, string corpo,System.IO.Stream anexo1, string anexo)
        {
            string sWhere = string.Format("Usuario_ID = {0}", idUsuario);
            Usuario usuario = RepositorioModelo.GetUsuarioDAO().Obter(sWhere);

            if (!string.IsNullOrEmpty(usuario.Email) && usuario.Email != "")
            {
                EnviarEmailContato(usuario.Email, assunto, corpo, anexo1, anexo);
            }
            else
            {
                throw new NotImplementedException();
            }
        }

        public static IEnumerable<Usuario> ListarUsuarios(string sWhere = null)
        {
            return RepositorioModelo.GetUsuarioDAO().Listar(sWhere);
        }

        public static void SolicitarCadastroAtuacao(CadastroAtuacao cadastro)
        {
            RepositorioModelo.GetCadastroAtuacaoDAO().Inserir(cadastro);
        }

        public static void InserirAtuacao(UsuarioAtuacao usuarioAtuacao)
        {
            RepositorioModelo.GetUsuarioAtuacaoDAO().Inserir(usuarioAtuacao);
        }

        public static bool ValidarEmail(string email)
        {
            string emailCadastrado = RepositorioModelo.GetUsuarioDAO().ObterEmail(email);

            if (String.IsNullOrEmpty(emailCadastrado))
            {
                return true;
            }

            return false;
        }


    }
}
