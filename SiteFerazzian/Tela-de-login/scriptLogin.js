function Cadastro() { // Validações de todas as entradas de dados
    var nome_cadastro = input_nome_cadastro.value;
    var email_cadastro = input_email_cadastro.value;
    var telefone_cadastro = input_telefone_cadastro.value;
    var senha_cadastro = input_senha_cadastro.value;
    var confirmar_cadastro = input_confirmar_senha_cadastro.value;
    var cpf = input_cpf.value;
    var empresa = input_selecionar_empresa_cadastro.value;

    var tamanho_email = email_cadastro.length;
    var arroba = email_cadastro.indexOf('@'); // Procura o caractere @
    var ponto = email_cadastro.indexOf('.'); // Procura o caractere .
    var tamanho_senha = senha_cadastro.length;
    var tamanho_cpf = cpf.length;

    if (nome_cadastro == "") {
        input_nome_cadastro.value = ``; // Apaga o que está escrito
        input_nome_cadastro.placeholder = `O campo 'nome' é necessário para cadastro.`;
    } else if (arroba < 0 || ponto < 0) {
        input_email_cadastro.value = ``; // Apaga o que está escrito
        input_email_cadastro.placeholder = `O campo 'email' está inválido.`;
    } else if (tamanho_email < 5) {
        input_email_cadastro.value = ``; // Apaga o que está escrito
        input_email_cadastro.placeholder = `O campo 'email' está inválido.`;
    } else if (telefone_cadastro == "") {
        input_telefone_cadastro.placeholder = `O campo 'telefone' é necessário para cadastro.`;
    } else if (tamanho_senha < 8) {
        input_senha_cadastro.value = ``; // Apaga o que está escrito
        input_confirmar_senha_cadastro.value = ``; // Apaga o que está escrito
        input_senha_cadastro.placeholder = `Senha muito fraca. Necessário no mínimo 8 caracteres.`;

    } else if (senha_cadastro != confirmar_cadastro) {
        input_senha_cadastro.value = ``; // Apaga o que está escrito
        input_confirmar_senha_cadastro.value = ``; // Apaga o que está escrito
        input_senha_cadastro.placeholder = `Falha ao autenticar senha.`;
        input_confirmar_senha_cadastro.placeholder = `Falha ao autenticar senha.`;
    } else if (cpf == "") {
        input_cpf.placeholder = `O campo 'CPF' é necessário para cadastro.`;

    } else if (tamanho_cpf < 11) {
        input_cpf.value = ``; // Apaga o que está escrito
        input_cpf.placeholder = `O campo 'CPF' está inválido.`;
    } else if (empresa == "#") {
        alert("O campo 'empresa' é necessário para cadastro");
    } else {
        nome_cadastro.value = ``; // Apaga o que está escrito
        email_cadastro.value = ``; // Apaga o que está escrito
        telefone_cadastro.value = ``; // Apaga o que está escrito
        senha_cadastro.value = ``; // Apaga o que está escrito
        confirmar_cadastro.value = ``; // Apaga o que está escrito
        cpf.value = ``; // Apaga o que está escrito
        alert(`${nome_cadastro}, uma mensagem foi enviada para o número ${telefone_cadastro} e um email para ${email_cadastro}`);
        Tela_Cadastro(); // Todas as telas para direita
    }
}

var contador = 4; // Inicia com 4 chances

function Login() { // Validação de todas as entradas de dados
    var email_login = input_email_login.value;
    var senha_login = input_senha_login.value;
    var email_cadastro = input_email_cadastro.value;
    var senha_cadastro = input_senha_cadastro.value;
    var nome_cadastro = input_nome_cadastro.value;

    if (email_login != email_cadastro || senha_login != senha_cadastro) {
        input_email_login.value = ``; // Apaga o que foi escrito
        input_senha_login.value = ``; // Apaga o que foi escrito
        contador--; // Diminui em 1 as chances
        if (contador < 1) { // Acabaram as chances
            alert("Conta bloqueada por motivos de segurança. Favor contactar gerente.");
        } else {
            alert(`Email ou senha incorretos. ${contador} chances restantes`);
        }
    } else { // Email e seha corretos
        contador = 4; // Volta todas as tentativas
        alert(`Email e senha corretos. Bem vindo, ${nome_cadastro}`);
        window.location.replace('../Dashboard/dashboard.html') // redireciona para a dashboard, caso seja efetuado o login
    }
}

function Tela_Login() { // Todas as telas vão para esquerda
    CadastroLeft.style.display = `unset`;
    tela_login_left.style.display = `unset`;
    CadastroRight.style.display = `none`;
    tela_login_right.style.display = `none`;
}

function Tela_Cadastro() { // Todas as telas vão para direita
    CadastroLeft.style.display = `none`;
    tela_login_left.style.display = `none`;
    CadastroRight.style.display = `unset`;
    tela_login_right.style.display = `unset`;
}