function cadastrar() { // Validações de todas as entradas de dados
  var nomeVar = input_nome_cadastro.value;
  var emailVar = input_email_cadastro.value;
  var senhaVar = input_senha_cadastro.value;
  var confirmacaoSenhaVar = input_confirmar_senha_cadastro.value;
  var cpfVar = input_cpf.value;
  var tipoUsuarioVar = input_selecionar_tipo_cadastro.value;

  var nome_up = nomeVar.toUpperCase();
  console.log(nome_up);

  const idEmpresa = Number(sessionStorage.getItem("ID_EMPRESA"))

  var tamanho_email = emailVar.length;
  var arroba = emailVar.indexOf('@'); 
  var ponto = emailVar.indexOf('.'); 
  var tamanho_senha = senhaVar.length;
  var tamanho_cpf = cpfVar.length;

  if (nomeVar == "") {
    input_nome_cadastro.value = ``; 
    input_nome_cadastro.placeholder = `O campo 'nome' é necessário para cadastro.`;
  } else if (arroba < 0 || ponto < 0) {
    input_email_cadastro.value = ``; 
    input_email_cadastro.placeholder = `O campo 'email' está inválido.`;
  } else if (tamanho_email < 5) {
    input_email_cadastro.value = ``; 
    input_email_cadastro.placeholder = `O campo 'email' está inválido.`;
  } else if (tamanho_senha < 8) {
    input_senha_cadastro.value = ``; 
    input_confirmar_senha_cadastro.value = ``; 
    input_senha_cadastro.placeholder = `Senha muito fraca. Necessário no mínimo 8 caracteres.`;

  } else if (senhaVar != confirmacaoSenhaVar) {
    input_senha_cadastro.value = ``; 
    input_confirmar_senha_cadastro.value = ``; 
    input_senha_cadastro.placeholder = `Falha ao autenticar senha.`;
    input_confirmar_senha_cadastro.placeholder = `Falha ao autenticar senha.`;
  } else if (cpfVar == "") {
    input_cpf.placeholder = `O campo 'CPF' é necessário para cadastro.`;

  } else if (tamanho_cpf < 11) {
    input_cpf.value = ``; 
    input_cpf.placeholder = `O campo 'CPF' está inválido.`;
  } else if (tipoUsuarioVar == "#") {
    alert("O campo 'tipo Usuario' é necessário para cadastro");
  } else {
    nomeVar.value = ``; 
    emailVar.value = ``; 
    senhaVar.value = ``; 
    confirmacaoSenhaVar.value = ``; 
    cpfVar.value = ``; 
    alert(`${nomeVar}, sua conta foi cadastrada com sucesso.`);
  }

  if (nomeVar != "" && emailVar && senhaVar != "" && confirmacaoSenhaVar != "" && cpfVar != "" && senhaVar == confirmacaoSenhaVar) {
    fetch(`/usuarios/cadastrar/${idEmpresa}`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        nomeServer: nomeVar,
        emailServer: emailVar,
        senhaServer: senhaVar,
        cpfServer: cpfVar,
        tipoServer: tipoUsuarioVar
      })
    }).then(function (resposta) {
      console.log(resposta)
    });
  }
}


function sumirMensagem() {
  cardErro.style.display = "none";
}