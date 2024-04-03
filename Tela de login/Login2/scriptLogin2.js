var x = 4;

function login() {
    var email = input_email.value;
    var senha = input_senha.value;

    if (email != "cliente" || senha != "1234") {
        input_email.value = ``;
        input_senha.value = ``;
        x--;
        if (x < 1) {
            alert("Conta bloqueada por motivos de segurança. Favor contactar agente.")
        }
        else {
            alert(`Email ou Senha incorretos. ${x} chances restantes`)
        }
    } else if (x > 0) {
        x = 4;
        alert("Correto");
        // continua para o site
    } else {
        alert("Conta bloqueada por motivos de segurança. Favor contactar agente.")
        input_email.value = ``;
        input_senha.value = ``;
    }
}

function Tela_Login() {
    tela_cadastro.style.display = `none`;
    tela_login.style.display = `unset`;
}

function Tela_Cadastro() {
    tela_cadastro.style.display = `unset`;
    tela_login.style.display = `none`;
}