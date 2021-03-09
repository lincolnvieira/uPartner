using System;

namespace DTO.Modelos
{
    public class Usuario
    {
        public int Usuario_ID { get; set; }
        public string Email { get; set; }
        public string Nome { get; set; }
        public string Sobrenome { get; set; }
        public DateTime DataNascimento { get; set; }
        public string Senha { get; set; }
        public DateTime DataCadastro { get; set; }
        public DateTime DataUltimoAcesso { get; set; }
        public DateTime DataAlterouSenha { get; set; }
        public bool FlagAlterouSenha { get; set; }
        public bool FlagAtivo { get; set; }
        public bool FlagBloqueado { get; set; }
        public bool FlagHabilitouEmail { get; set; }
        public string Bairro { get; set; }
        public string Complemento { get; set; }
        public int Numero { get; set; }
        public string Estado { get; set; }
        public string Cidade { get; set; }
        public string Rua { get; set; }
        public string CEP { get; set; }
        public string Sobre { get; set; }
        public byte[] FotoPerfil { get; set; }
        public string MimeType { get; set; }
        public int mTipoConta { get; set; }
        
    }

}
