function Cadastro() {
    var nome_cadastro = input_nome_cadastro.value;
    var email_cadastro = input_email_cadastro.value;
    var telefone_cadastro = input_telefone_cadastro.value;
    var senha_cadastro = input_senha_cadastro.value;
    var confirmar_cadastro = input_confirmar_senha_cadastro.value;

    var arroba = email_cadastro.indexOf('@');
    var com = email_cadastro.indexOf('.com');
    var br = email_cadastro.indexOf('.br');
    var tamanho_senha = senha_cadastro.length;

    if (arroba < 0) {
        alert('Seu email deve possuir @.');
    }
    if (com < 0 && br < 0) {
        alert('Seu email deve acabar em .com ou .br.');

    } else if (tamanho_senha < 8) {
        senha_cadastro.value = ``;
        alert('Senha muito fraca. Utilize letras, números e caracteres especiais para proteger sua senha.');

    } else if (senha_cadastro != confirmar_cadastro) {
        senha_cadastro.value = ``;
        confirmar_cadastro.value = ``;
        alert("Falha ao autenticar senha.")

    } else if (telefone_cadastro == "") {
        alert("Necessário um telefone para contato.");
        
    } else {
        nome_cadastro.value = ``;
        email_cadastro.value = ``;
        telefone_cadastro.value = ``;
        senha_cadastro.value = ``;
        confirmar_cadastro.value = ``;
        alert(`${nome_cadastro}, uma mensagem foi enviada para o número ${telefone_cadastro} e um email para ${email_cadastro}`);
        Tela_Login();
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
        email_login.value = ``;
        senha_login.value = ``;
        contador--;
        if (contador < 1) {
            alert("Conta bloqueada por motivos de segurança. Favor contactar gerente.");
        } else {
            alert(`Email ou senha incorretos. ${contador} chances restantes`);
        }
    } else if (contador > 0) {
        contador = 4;
        alert(`Email e senha corretos. Bem vindo, ${nome_cadastro}`);
        // continua para o site
    } else {
        input_email_login.value = ``;
        senha_login.value = ``;
        alert("Conta bloqueada por motivos de segurança. Favor contactar agente.");
    }
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