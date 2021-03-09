using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.ModeloDAO
{
    public class AdministradorDAO : DAO<Administrador, string>
    {
        public override void Alterar(Administrador item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(Administrador item)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = MontarInsert(item, "Administrador_ID");
                cmd.Parameters.Clear();
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

        public override IEnumerable<Administrador> Listar(string chave = null)
        {
            throw new NotImplementedException();
        }

        public override Administrador Obter(string chave)
        {
            try
            {
                AbrirConexao();
                Administrador administrador = new Administrador();
                cmd.CommandText = MontarSelect(administrador, chave);
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    administrador.Administrador_ID = (int)reader["Administrador_ID"];
                    administrador.Email = (string)reader["Email"];
                    administrador.Nome = (string)reader["Nome"];
                    administrador.Sobrenome = (string)reader["Sobrenome"];
                    administrador.DataNascimento = (DateTime)reader["DataNascimento"];
                    administrador.Senha = (string)reader["Senha"];
                }

                return administrador;
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
    }
}
