#Criação do Modelo Físico
drop database if exists Lanchonete;
create database Lanchonete;

create table Lanchonete.Cliente(
	idCliente smallint not null,
    nomeCliente varchar(50) not null,
    telefoneCliente varchar(11) not null,
    enderecoLogradouro varchar(100),
    enderecoNumero varchar(10) not null,
    enderecoBairro varchar(100) not null,
    primary key(idCliente)
);

create table Lanchonete.Entregador(
	idEntregador tinyint not null,
    nomeEntregador varchar(50) not null,
    celularEntregador varchar(11) not null,
    primary key(idEntregador)
);

create table Lanchonete.Pedido(
	idPedido smallint not null,
    statusPedido tinyint not null,
    dataEmissao datetime not null,
    idCliente smallint,
    idEntregador tinyint,
    primary key(idPedido),
    foreign key(idCliente) references Lanchonete.Cliente(idCliente),
    foreign key(idEntregador) references Lanchonete.Entregador(idEntregador)
);

create table Lanchonete.Cardapio(
	idCardapio tinyint not null,
	nomeSanduiche varchar(50) not null,
	preco decimal(6,2) not null,
	primary key(idCardapio)
);

create table Lanchonete.CardapioPedido(
	idPedido smallint not null,
    idCardapio tinyint not null,
    foreign key(idPedido) references Lanchonete.Pedido(idPedido),
    foreign key(idCardapio) references Lanchonete.Cardapio(idCardapio)
);

#Inserção de Valores
insert into Lanchonete.Cliente values
	(1,"Peter Parker",43999999999,"Rua Londrina",123,"Centro"),
    (2,"Harry Osborn",43999999998,"Rua Curitiba",456,"Centro");
insert into Lanchonete.Entregador values
	(1,"Duende Verde",43999999990),
    (2,"Doutor Octopus",43999999991);
insert into Lanchonete.Cardapio values
	(1,"xTudo",20.50),
    (2,"xSalada",18.50);
insert into Lanchonete.Pedido values
	(1,1,"2021-08-23 23:30:45",1,1),
	(2,0,"2021-08-23 23:45:00",2,2);

#Consulta para listar apenas os pedidos em preparação (status: 0. em preparação, 1. em entrega, 2. entregue)
select * from Lanchonete.Pedido where statusPedido = 0;

#Aluno Rodrigo Yuji Kawakani