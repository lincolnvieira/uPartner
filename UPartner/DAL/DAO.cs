using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public abstract class DAO<T, K> where T : class
    {
        //Elementos de acesso a dados
        protected SqlConnection cn;
        protected SqlCommand cmd;
        protected SqlDataReader reader;
        protected SqlDataAdapter adapter;
        protected SqlTransaction transaction;
        //String de conexão
        private String conexao = "Password=123456;Persist Security Info=True;User ID=sa;Initial Catalog=UPartner;Data Source=.";

        //Construtor
        public DAO()
        {
            cn = new SqlConnection(conexao);
            cmd = new SqlCommand();
            cmd.Connection = cn;
            adapter = new SqlDataAdapter();
        }

        //Método para abrir a conexão
        protected void AbrirConexao()
        {
            cn.Open();
        }

        //Método para fechar a conexao
        protected void FecharConexao()
        {
            if (cn != null && cn.State == ConnectionState.Open)
            {
                cn.Close();
            }
        }

        //protected void Begin()
        //{
        //    sqlTransaction = cn.BeginTransaction();
        //}
        //protected void Commit()
        //{
        //    cmd.Transaction.Commit();
        //}

        //protected void Rollback()
        //{
        //    cmd.Transaction.Rollback();
        //}

        public abstract void Inserir(T item);
        public abstract T Obter(K chave);
        public abstract void Alterar(T item, K chave);
        public abstract void Deletar(K chave);
        public abstract IEnumerable<T> Listar(K chave = default(K));


        public string MontarInsert(T item, string Identity = null)
        {
            StringBuilder sbInsert = new StringBuilder();
            PropertyInfo[] properties = item.GetType().GetProperties();
            int tamanho = properties.Count() - 1;
            int count = 0;
            sbInsert.Append("INSERT INTO " + item.GetType().Name + " (");

            //MONTANDO O VALUES
            foreach (PropertyInfo pi in properties)
            {
                if (Identity != pi.Name)
                {
                    sbInsert.Append(pi.Name);
                    if (count < tamanho)
                        sbInsert.Append(",");
                }
                count++;
            }
            sbInsert.Append(") VALUES (");

            //MONTANDO OS PARAMETROS
            count = 0;
            foreach (PropertyInfo pi in properties)
            {
                if (Identity == "" || Identity != pi.Name)
                {
                    if (pi.PropertyType.Name == "Double")
                    {
                        sbInsert.Append("'" + pi.GetValue(item).ToString().Replace(".", "").Replace(",", ".") + "'");
                    }

                    else if (pi.PropertyType.Name == "Byte[]")
                    {
                        if (pi.GetValue(item) == null)
                        {
                            sbInsert.Append("null");
                        }
                        else
                        {
                            //byte[] data = ;
                            //command.Parameters.Add("@data", SqlDbType.VarBinary).Value = data;
                            sbInsert.Append("@" + pi.Name);
                        }
                    }
                    else if (pi.PropertyType.Name == "DateTime")
                    {
                        if (pi.GetValue(item).ToString().Equals("01/01/0001 00:00:00"))
                        {
                            sbInsert.Append("'01-01-1900'");
                        }
                        else
                        {
                            sbInsert.Append("'" + pi.GetValue(item) + "'");
                        }
                    }
                    else
                    {
                        sbInsert.Append("'" + pi.GetValue(item) + "'");
                    }

                    if (count < tamanho)
                        sbInsert.Append(",");
                }
                count++;
            }
            sbInsert.Append(")");
            return sbInsert.ToString();
        }

        public string MontarSelect(T item, string sWhere = null)
        {
            StringBuilder sbConsulta = new StringBuilder();
            PropertyInfo[] properties = item.GetType().GetProperties();
            int tamanho = properties.Count() - 1;
            int count = 0;
            sbConsulta.Append("SELECT ");

            //MONTANDO OS CAMPOS
            foreach (PropertyInfo pi in properties)
            {
                sbConsulta.Append(pi.Name);
                if (count < tamanho)
                    sbConsulta.Append(",");
                count++;
            }
            sbConsulta.Append(" FROM " + item.GetType().Name);

            //CASO A VARIAVEL DO WHERE POSSUIR VALOR, CONCATENA COM A CONSULTA
            if (sWhere != null)
            {
                sbConsulta.Append(" WHERE " + sWhere);
            }
            return sbConsulta.ToString();
        }

        public string MontarUpdate(T item, string identity, string sWhere)
        {
            StringBuilder sbInsert = new StringBuilder();
            PropertyInfo[] properties = item.GetType().GetProperties();
            int tamanho = properties.Count() - 1;
            int count = 0;

            sbInsert.Append("UPDATE " + item.GetType().Name + " SET ");

            foreach (PropertyInfo pi in properties)
            {
                if (identity != pi.Name)
                {
                    sbInsert.Append(pi.Name);
                    sbInsert.Append(" = ");

                    if (pi.PropertyType.Name == "Double")
                    {
                        sbInsert.Append("'" + pi.GetValue(item).ToString().Replace(".", "").Replace(",", ".") + "'");
                    }

                    else if (pi.PropertyType.Name == "Byte[]")
                    {
                        if (pi.GetValue(item) == null)
                        {
                            sbInsert.Append("null");
                        }
                        else
                        {
                            sbInsert.Append("@" + pi.Name);
                        }
                    }
                    else if (pi.PropertyType.Name == "DateTime")
                    {
                        if (pi.GetValue(item).ToString().Equals("01/01/0001 00:00:00"))
                        {
                            sbInsert.Append("'01-01-1900'");
                        }
                        else
                        {
                            sbInsert.Append("'" + pi.GetValue(item) + "'");
                        }
                    }
                    else
                    {
                        sbInsert.Append("'" + pi.GetValue(item) + "'");
                    }
                    if (count < tamanho)
                        sbInsert.Append(",");
                }
                count++;
            }
            sbInsert.Append(" WHERE " + sWhere);
            return sbInsert.ToString();
        }
    }
}
