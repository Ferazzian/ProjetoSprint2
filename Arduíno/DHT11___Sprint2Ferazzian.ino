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
  float umidade = dht_1.readHumidity();  // %
  int umidadeMax = 62;
  int umidadeMin = 58;
  float umidadeMocada = umidade - 48;

  float temperatura = dht_1.readTemperature();  // C°
  int temperaturaMax = 28;
  int temperaturaMin = 18;
  float temperaturaMocada = temperatura - 5.5;

  ///////////////////////////////////////////////////////////////
  // Se não houver leitura, ele exibi uma mensagem de erro   "is nan" = "é nulo", escreve a frase de erro no monitor e pula linha com "ln"
  if (isnan(temperatura) or isnan(umidade)) {
    Serial.println("Erro ao ler");
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
    Serial.print("U_Mocada:");
    Serial.print(umidadeMocada);
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
    Serial.print("T_Mocada:");
    Serial.println(temperaturaMocada);
  }
  delay(1000);  // faz uma leitura a cada 1 segundo
}