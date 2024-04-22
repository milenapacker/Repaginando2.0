drop database if exists upx;
create database upx;
use upx;



 -- truncate usuario;

drop table if exists frases;
create table frases(
frase_id 		INT 		 AUTO_INCREMENT,
frase_text		TEXT,
frase_autor		TEXT,
PRIMARY KEY (frase_id)
);

drop table if exists usuario;
create table usuario (
  Usuario_id    INT          AUTO_INCREMENT,     
  Nome_usuario  VARCHAR(60)  NOT NULL,
  Celular       VARCHAR(20)  NOT NULL,
  Email         VARCHAR(60)  NOT NULL,
  Cidade        VARCHAR(15)  NOT NULL,
  Uf			VARCHAR(25)	 NOT NULL,
  Senha         INT          NOT NULL,
  PRIMARY KEY (Usuario_id)
  );


drop table if exists genero;
create table genero (
  Genero_id     INT NOT NULL AUTO_INCREMENT,
  Genero_nome   VARCHAR(30),
  PRIMARY KEY (Genero_id)
  );
  
  
drop table if exists estado;
create table estado (
	Estado_id    INT NOT NULL AUTO_INCREMENT, 
    Estado_nome  VARCHAR(30),
    PRIMARY KEY (Estado_id)
  );
  
drop table if exists livro;
CREATE TABLE livro (
  Livro_id       INT          AUTO_INCREMENT,
  Nome           VARCHAR(60)  NOT NULL,
  Ano_Publi      INT          NOT NULL,
  Qtde_Paginas   INT          NOT NULL,
  Editora        VARCHAR(30)  NOT NULL,
  Autor          VARCHAR(60)  NOT NULL,
  Genero_id      INT          NOT NULL,
  Estado_id      INT          NOT NULL,
  PRIMARY KEY (Livro_id),
  FOREIGN KEY (Genero_id) REFERENCES genero(Genero_id),
  FOREIGN KEY (Estado_id) REFERENCES estado(Estado_id)
);

insert into genero(Genero_nome) values
('Fantasia'),
('Ficção Científica'),
('Romance'),
('Mistério'),
('Policial'),
('Biografia'),
('História'),
('Suspense'),
('Espiritualidade'),
('Filosofia');

insert into estado(Estado_nome) values
('Novo'),
('Usado'),
('Bem Usado');

insert into usuario values
(null,	'Bigeus',		'15998421996',	'bigeus@gmail.com',		'Tatuí',		'SP',	29082003),
(null,	'Lucas',		'15999999999',	'lucas@gmail.com',		'Tatuí',		'SP',	1234),
(null,	'Felipe',		'15998877777',	'felipe@gmail.com',		'Tatuí',		'SP',	123321),
(null,	'Coxa',			'1599777920',	'coxaUri@gmail.com',	'Tatuí',		'SP',	4815),
(null,	'Teste',		'Celular',		'teste@gmail.com',		'Cidade',		'AC',	123456);

insert into livro (Nome,Ano_Publi,Qtde_Paginas,Editora,Autor,Genero_id,Estado_id)values
('Harry Potter e a Câmara Secreta',		1998,		287,		'Rocco',				'J. K. Rowling',				1,2),
('O Pequeno Príncipe',					1956,		93,			'Agir',					'Antoine de Saint-Exupéry',		1,1),
('Um Estudo em Vermelho',				1998,		192,		'L&PM EDITORES',		'Arthur Conan Doyle',			4,3),
('Técnicas de Invasão',					2019,		296,		'Labrador',				'Bruno Fraga',					5,2);

 drop table if exists genero_usuario;
  create table genero_usuario(
  Genero_id 	int not null,
  Usuario_id	int,
  
  foreign key(Usuario_id) references	usuario(Usuario_id),
  foreign key(Genero_id)  references	genero(Genero_id)
  );
  insert into genero_usuario values
(1,1),										-- 	(1, "Fantasia");
(2,1),										-- 	(2, "Ficção Científica");
(4,1),										-- 	(3, "Romance");
(7,1),										-- 	(4, "Mistério");
(10,1),										-- 	(5, "Policial");	
(1,2),										-- 	(6, "Biografia");
(2,2),										-- 	(7, "História");
(4,2),										-- 	(8, "Suspense");
(7,2),										-- 	(9, "Espiritualidade");
(2,3),										-- 	(10, "Filosofia");
(10,3),										
(5,3),
(4,3),
(7,3),
(2,4),
(1,4),
(8,4),
(4,4);

drop table if exists Trocas;
create table Trocas(
Usuario_id int ,
Livro_id int,

FOREIGN KEY (Usuario_id) references usuario(Usuario_id),
FOREIGN KEY	(Livro_id) 	references	livro(Livro_id),
CONSTRAINT UC_UsuarioLivro unique (Usuario_id, Livro_id)
);

insert into trocas values
(1,1),
(1,2),
(1,3);          -- trocas de Vinicius pelo script

truncate frases;
insert into frases values
(null,"É preciso muita bravura para enfrentarmos nossos inimigos, mas igual coragem para enfrentarmos nossos amigos.","Alvo Dumbledore"),                     -- id, 'texto da frase', 'autor da frase'
(null,"A felicidade pode ser encontrada até nos momentos mais sombrios, se alguém se lembrar de acender a luz.","Alvo Dumbledore"),
(null,"As palavras são, na minha não tão humilde opinião, nossa inesgotável fonte de magia. Capazes de causar dano e de remediar.","Alvo Dumbledore"),
(null,"Não são as nossas habilidades que revelam o que realmente somos... são as nossas escolhas.","Alvo Dumbledore"),
(null,"A diferença entre uma criatura e outra não é sua aparência, mas sua habilidade de se transformar.","Sirius Black"),

(null,"A felicidade é encontrada até nos mais simples dos gestos. Às vezes, só precisamos olhar ao nosso redor.","Harry Potter"),
(null,"Não vale a pena mergulhar nos sonhos e esquecer de viver.","Alvo Dumbledore"),
(null,"Quanto tempo dura o eterno?” – “As vezes apenas um segundo.","Lewis Carrol"),
(null,"De todas as dificuldades que uma pessoa tem de enfrentar, a mais sofrida é, sem dúvida, o simples ato de esperar.","Khaled Hosseini"),
(null,"Não escute o que as pessoas dizem, veja o que elas fazem.","Stephen J. Dubner e Steven Levitt"),

(null,"Aguns infinitos são maiores que outros.","John Green"),
(null,"Podemos ensinar a entender a arte (a comunicação visual), mas não podemos formar artistas, muito menos gênios.","Bruno Munari"),
(null,"Pode ser difícil mudar, mas nunca ouvi alguém dizer que não tenha valido a pena.","Carol S. Dweck"),
(null,"A mais profunda necessidade da natureza humana é o desejo de ser importante.","John Dewey"),
(null,"Há um acervo ilimitado de ideias esperando ser exploradas e convertidas por você em realidade.","''Rhonda Byrne"),

(null,"Você não precisa estar certo com tanta frequência assim. Você precisa é da sabedoria de não fazer coisas estúpidas.","Nassim Nicholas Taleb"),
(null,"Nada é mais necessário do que a aparência de religiosidade. De modo geral, os homens julgam mais com os olhos do que com o tato: todos podem ver, mas poucos são capazes de sentir.","Maquiavel"),
(null,"Quantas oportunidades temos de melhorar, dramaticamente, as vidas das pessoas apenas fazendo nosso trabalho um pouco melhor?","Steve Krug");






select * from frases;

-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '29De082003$';