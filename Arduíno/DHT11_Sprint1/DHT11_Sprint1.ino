#include "DHT.h"        // inclui a biblioteca
#define dht_type DHT11  // define o modelo (tipo) do sensor

int dht_pin = A5;                    // nomeia o pino A5 conectado ao sensor
DHT dht_1 = DHT(dht_pin, dht_type);  // cria o sensor dht_1 e envia para a biblioteca suas informações de modelo e pino

void setup() {         // só acontece uma vez no código
  Serial.begin(9600);  // inicia o Serial.Monitor com uma taxa de 9600 baud rates
  dht_1.begin();       // inicia o sensor dht_1
}

void loop() {

  // cria variaveis de valor decimal (float) que armazena os dados captados pelo sensor
  float umidade = dht_1.readHumidity();  // Conilon
  int umidadeMax = 18;                   // %
  int umidadeMin = 16;                   // %
  float umidadeIdeal = umidade - 48;

  float temperatura = dht_1.readTemperature();  // Conilon
  int temperaturaMax = 26;                      // C°
  int temperaturaMin = 22;                      // C°
  float temperaturaIdeal = temperatura - 5.5;

  ///////////////////////////////////////////////////////////////

  if (isnan(temperatura) or isnan(umidade)) {  // Se não houver leitura, ele exibi uma mensagem de erro   "is nan" = "é nulo"
    Serial.println("Erro ao ler");             // escreve a frase de erro no monitor e pula linha com "ln"
  }

  else {
    Serial.print("Umidade:");
    Serial.print(umidade);
    Serial.print(", ");
    Serial.print("U_Máxima:");
    Serial.print(umidadeMax);
    Serial.print(", ");
    Serial.print("U_Mínima:");
    Serial.print(umidadeMin);
    Serial.print(", ");
    Serial.print("U_Fictícia:");
    Serial.print(umidadeIdeal);
    Serial.print(", ");
    Serial.print("Temperatura:");
    Serial.print(temperatura);
    Serial.print(", ");
    Serial.print("T_Máxima:");
    Serial.print(temperaturaMax);
    Serial.print(", ");
    Serial.print("T_Mínima:");
    Serial.print(temperaturaMin);
    Serial.print(", ");
    Serial.print("T_Fictícia:");
    Serial.println(temperaturaIdeal);
  }
  delay(1000);  // faz uma leitura a cada 1 segundo
}