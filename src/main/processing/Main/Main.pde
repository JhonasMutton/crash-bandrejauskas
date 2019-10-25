 //<>//
float xPos; // Posicionamento do X
float yPos; // Poscionamento do Y
float velocidade;
float gravidade;
void setup() {
size(600, 600); // Tamanho da Tela
background(0);// Cor do BG
xPos = 300;// Declarando o posicionamento do X
yPos = 0; // Declarando pocisionamento do Y
velocidade = 0; // Declarando a velocidade
gravidade = 0.6; // Declarando a gravidade
text("toper", 200, 200);
}
void draw() {
background(0);
fill(255,0 ,0);
ellipse(xPos, yPos, 60, 60); // Criação da Ellipse
fill(255);
noStroke();
  text("toper", 200, 200);
rect(0, 530, 600, 200); // Criação do Quad
yPos = yPos + velocidade; // Atribuição de yPos com incremento de Velocidade
velocidade = velocidade + gravidade; // Velicidade com incremento da gravidade
if ( velocidade < 0.65 && yPos > height-99.5) {
println("parado");
velocidade = 0;
gravidade = 0; // Criação do if para zerar a velocidade e a gravidade após a animação do pulo
}
else if (yPos > height-99.5) {
println(velocidade);
velocidade = velocidade * -0.65;
println("Pulando"); // Else if para o objeto ficar pulando

}
}
