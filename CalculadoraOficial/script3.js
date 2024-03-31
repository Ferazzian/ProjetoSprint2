function calcular() {
    div1.style.display = `flex`;
    var Faturamento = Number(input_faturamento.value); // faturamento por cada hectare
    var NumHec = Number(input_num.value); // número de hectares
    var PerdaHec = Number(input_perda.value); // perdas por cada hectare

    var perda = (PerdaHec * Faturamento) / 100; // encontra a porcentagem da perda dentro do faturamento
    var perda10 = perda - (perda * 0.10); // diminuição da perda em 10%
    var total = Faturamento * NumHec; // faturamento com todos o hectares
    var preju = total * (PerdaHec / 100);
    var total2 = total - preju; // faturamento total com as perdas antes
    var retorno = preju * 0.10; // retorno de 10% do que foi perdido
    var final = total - preju + retorno; // faturamento total com as perdas depois

    if (NumHec < 100) { // é necessário ter no mínimo 100 hectares
        div1.innerHTML = '';
        div1.style.display = `none`;
        alert("O numero minimo de Hectares é 100");
    }
    else {
        div1.innerHTML = `
            <span class="H2">Simulando:</span>
            Ao não utilizar nossos processos de monitoramento, você tem uma perda de R$${perda} por hectare
            <br>
            Já com o nosso monitoramento, você perde R$${perda10} por hectare, elevando os lucros de R$${total2} para R$${final}
            <br><br>
            <span class="H2">Como Funciona?</span>
            Com nossos serviços de monitoramento da temperatura e umidade de sua plantação, há uma diminuição percentual de 10% na perda pela Ferrugem Asiática, gerando um retorno de 10% de lucro.
            `
    }
}