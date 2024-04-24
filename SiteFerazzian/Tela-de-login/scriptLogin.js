function Cadastro() {
    var nome_cadastro = input_nome_cadastro.value;
    var email_cadastro = input_email_cadastro.value;
    var telefone_cadastro = input_telefone_cadastro.value;
    var senha_cadastro = input_senha_cadastro.value;
    var confirmar_cadastro = input_confirmar_senha_cadastro.value;
    var cpf = input_cpf.value;
    var empresa = input_selecionar_empresa_cadastro.value;

    var tamanho_email = email_cadastro.length;
    var arroba = email_cadastro.indexOf('@');
    var ponto = email_cadastro.indexOf('.');
    var tamanho_senha = senha_cadastro.length;
    var tamanho_cpf = cpf.length;

    if (nome_cadastro == "") {
        input_nome_cadastro.value = ``;
        input_nome_cadastro.placeholder = `O campo 'nome' é necessário para cadastro.`;
    } else if (arroba < 0 || ponto < 0) {
        input_email_cadastro.value = ``;
        input_email_cadastro.placeholder = `O campo 'email' está inválido.`;
    } else if (tamanho_email < 5) {
        input_email_cadastro.value = ``;
        input_email_cadastro.placeholder = `O campo 'email' está inválido.`;
    } else if (telefone_cadastro == "") {
        input_telefone_cadastro.placeholder = `O campo 'telefone' é necessário para cadastro.`;
    } else if (tamanho_senha < 8) {
        input_senha_cadastro.placeholder = `Senha muito fraca. Necessário no mínimo 8 caracteres.`;

    } else if (senha_cadastro != confirmar_cadastro) {
        input_senha_cadastro.value = ``;
        input_confirmar_senha_cadastro.value = ``;
        input_senha_cadastro.placeholder = `Falha ao autenticar senha.`;
        input_confirmar_senha_cadastro.placeholder = `Falha ao autenticar senha.`;
    } else if (cpf == "") {
        input_cpf.placeholder = `O campo 'CPF' é necessário para cadastro.`;

    } else if (tamanho_cpf < 11) {
        input_cpf.value = ``;
        input_cpf.placeholder = `O campo 'CPF' está inválido.`;
    } else if (empresa == "#") {
        alert("O campo 'empresa' é necessário para cadastro");
    } else {
        nome_cadastro.value = ``;
        email_cadastro.value = ``;
        telefone_cadastro.value = ``;
        senha_cadastro.value = ``;
        confirmar_cadastro.value = ``;
        cpf.value = ``;
        alert(`${nome_cadastro}, uma mensagem foi enviada para o número ${telefone_cadastro} e um email para ${email_cadastro}`);
        Tela_Cadastro();
    }
}

var contador = 4;

function Login() {
    var email_login = input_email_login.value;
    var senha_login = input_senha_login.value;
    var email_cadastro = input_email_cadastro.value;
    var senha_cadastro = input_senha_cadastro.value;
    var nome_cadastro = input_nome_cadastro.value;

    if (email_login != email_cadastro || senha_login != senha_cadastro) {
        input_email_login.value = ``;
        input_senha_login.value = ``;
        contador--;
        if (contador < 1) {
            alert("Conta bloqueada por motivos de segurança. Favor contactar gerente.");
        } else {
            alert(`Email ou senha incorretos. ${contador} chances restantes`);
        }
    } else {
        contador = 4;
        alert(`Email e senha corretos. Bem vindo, ${nome_cadastro}`);
        window.location.replace('../Dashboard/dashboard.html') // redireciona para a dashboard, caso seja efetuado o login
    }
    // } else {
    //     input_email_login.value = ``;
    //     senha_login.value = ``;
    //     alert("Conta bloqueada por motivos de segurança. Favor contactar agente.");
    // }
}

function Tela_Login() { // todo mundo left
    CadastroLeft.style.display = `unset`;
    tela_login_left.style.display = `unset`;
    CadastroRight.style.display = `none`;
    tela_login_right.style.display = `none`;
}

function Tela_Cadastro() { // todo mundo right
    CadastroLeft.style.display = `none`;
    tela_login_left.style.display = `none`;
    CadastroRight.style.display = `unset`;
    tela_login_right.style.display = `unset`;
}