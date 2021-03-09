using DTO.Modelos;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilitarios.Enum;

namespace DAL.DAO
{
    public class UsuarioDAO : DAO<Usuario, string>
    {
        public override void Alterar(Usuario item, string chave)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = MontarUpdate(item, "Usuario_ID", chave);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@FotoPerfil", SqlDbType.VarBinary).Value = item.FotoPerfil;
                cmd.CommandType = CommandType.Text; //Padrão de tipo de comando
                cmd.ExecuteNonQuery(); //Executa a query             
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                FecharConexao();
            }
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(Usuario item)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = MontarInsert(item, "Usuario_ID");
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@FotoPerfil", SqlDbType.VarBinary).Value = item.FotoPerfil;
                cmd.CommandType = CommandType.Text; //Padrão de tipo de comando
                cmd.ExecuteNonQuery(); //Executa a query
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                FecharConexao();
            }
        }
        
        public override IEnumerable<Usuario> Listar(string chave = "")
        {
            try
            {
                List<Usuario> lstUsuario = new List<Usuario>();
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM Usuario " + chave;
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.Usuario_ID = (int)reader["Usuario_ID"];
                    usuario.Nome = (string)reader["Nome"];
                    usuario.Sobrenome = (string)reader["Sobrenome"];
                    usuario.Email = (string)reader["Email"];
                    usuario.DataCadastro = (DateTime)reader["DataCadastro"];
                    
                    lstUsuario.Add(usuario);
                }
                return lstUsuario;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                FecharConexao();
            }
        }

        public override Usuario Obter(string chave)
        {
            try
            {
                AbrirConexao();
                Usuario usuario = new Usuario();
                cmd.CommandText = MontarSelect(usuario, chave);
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    usuario.Usuario_ID = (int)reader["Usuario_ID"];
                    usuario.Email = (string)reader["Email"];
                    usuario.Nome = (string)reader["Nome"];
                    usuario.Sobrenome = (string)reader["Sobrenome"];
                    usuario.DataNascimento = (DateTime)reader["DataNascimento"];
                    usuario.Senha = (string)reader["Senha"];
                    usuario.DataCadastro = (DateTime)reader["DataCadastro"];
                    usuario.DataUltimoAcesso = (DateTime)reader["DataUltimoAcesso"];
                    usuario.DataAlterouSenha = (DateTime)reader["DataAlterouSenha"];
                    usuario.FlagAlterouSenha = (bool)reader["FlagAlterouSenha"];
                    usuario.FlagAtivo = (bool)reader["FlagAtivo"];
                    usuario.FlagBloqueado = (bool)reader["FlagBloqueado"];
                    usuario.FlagHabilitouEmail = (bool)reader["FlagHabilitouEmail"];
                    usuario.Estado = (string)reader["Estado"];
                    usuario.Bairro = (string)reader["Bairro"];
                    usuario.Rua = (string)reader["Rua"];
                    usuario.Cidade = (string)reader["Cidade"];
                    usuario.CEP = (string)reader["CEP"];
                    usuario.Numero = (int)reader["Numero"];
                    usuario.Sobre = (string)reader["Sobre"];
                    usuario.Complemento = (string)reader["Complemento"];
                    if (!Convert.IsDBNull(reader["FotoPerfil"]))
                        usuario.FotoPerfil = (byte[])reader["FotoPerfil"];
                    usuario.MimeType = (string)reader["MimeType"];
                    usuario.mTipoConta = (int)reader["mTipoConta"];
                }
                
                return usuario;
            }
            catch (Exception ex)
            {
                throw;

            }
            finally
            {
                FecharConexao();
            }
        }

        public void AlterarSenha(Usuario item)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = "UPDATE Usuario SET Senha = '" + item.Senha + "' WHERE Email = '" + item.Email + "'";
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                FecharConexao();
            }
        }

        public string ObterEmail(string email)
        { 
            string emailCadastrado = "";

            try
            {
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM Usuario WHERE Email = '" + email + "'";
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    emailCadastrado = (string)reader["Email"];
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                FecharConexao();
            }

            return emailCadastrado;
        }
    }
}