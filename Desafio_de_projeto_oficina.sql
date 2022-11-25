create database os_oficina;
use os_oficina;
-- Tabele cliente
create table clients_PF(
	idClient_pf int auto_increment primary key,
	nome_cliente varchar (45) not null,
    cpf char(11) not null,
    data_de_nascimento char(10),
    endereço varchar(45),
    cidade varchar(45),
    estado char(2),
    telefone char(11),
    email varchar(45),
    constraint unique_cpf_clientpf unique (cpf)
);
-- Tabela client PJ 
create table clients_PJ(
	idClient_pj int auto_increment primary key,
    Razão_social varchar(45) not null,
    cnpj char(14) not null,
    nome_fantasia varchar(45), 
    responsavel varchar (45),
    telefone char(10), 
    email char(15), 
    endereço_empresarial varchar (45), 
    cidade varchar(45), 
    estado char(2),
    constraint unique_client_pj unique (cnpj)	
);

-- TABELA DE RELACINAMENTO
create table clients_pj_pf(
	idClients_pj_pf int,
    client_pf int, 
    client_pj int ,
    primary key (idClients_pj_pf, client_pf, client_pj),
    constraint fk_client_pf foreign key (client_pf) references clients_PF(idClient_pf),
    constraint fk_client_pj foreign key (client_pj) references clients_PJ(idClient_pj)
);
-- Tabela de Orçamento
create table orçamento_os(
	idOrçamento int primary key, 
    idClient int not null, 
    Numero_orça varchar(45), 
    status_os enum ("Aprovado", "Esperando"),
    data_orca date,
    valor_orca float,
    validade_orca date, 
    constraint fk_orca_client foreign key(idClient) references clients_pj_pf(idClients_pj_pf) 
 );
 alter table orçamento_os add idOrcpreco int;
 alter table orçamento_os add constraint fk_Orc_preco foreign key (idOrcpreco) references preco(idPreco);
 select * from orçamento_os;
 
 
 -- Tabela veiculo 
 create table veiculo(
	idVeiculo int primary key,
    tipo_de_veiculo varchar(45),
    marca varchar (45), 
    modelo varchar (45), 
    ano_de_fabricação char (10), 
    constraint fk_veiculo_client foreign key (idVeiculo) references  clients_pj_pf (idClients_pj_pf) 
 );
 
 -- Tabela Funcionarios 
 create table funcionarios (
	idFuncionario int primary key, 
    nome_func varchar(45), 
    cpf_func char(11), 
    codigo char (6), 
    data_nascimento date, 
    endereco varchar (45),
    cep char (11), 
    cidade varchar (45), 
    estado char (2),
    data_de_contratação date, 
    telefone char (15)  
 );
 
 -- tabela equipe
 create table equipe (
	idEquipe int,
    equipe_func int,
    especialidade  varchar (45),
    responsavel varchar(45),   
    primary key (idEquipe, equipe_func),
	constraint fk_equipe_func foreign key (equipe_func) references funcionarios (idFuncionario)
 );
 
 -- tabela ordem de servico
 create table ordem_servico(
	idOrdemServico int, 
    ordem_veiculo int, 
    ordem_orca int, 
    ordem_equipe int,
    numero char(8), 
    data_de_emissao date, 
    pecas_necessarias varchar(45), 
    valor float, 
    ordem_status varchar (45), 
    data_conclusão date,       
    primary key (ordem_veiculo, ordem_orca, ordem_equipe, idOrdemServico),
    constraint fk_ordem_veiculo foreign key (ordem_veiculo) references veiculo (idVeiculo),
    constraint fk_ordem_orca foreign key (ordem_orca) references orçamento_os (idOrçamento),
    constraint fk_ordem_equipe foreign key (ordem_equipe) references equipe (idEquipe)
 );
 alter table ordem_servico add os_estoque int;
alter table ordem_servico add constraint fk_os_estoque foreign key (os_estoque) references estoque (idEstoque);
 
 
 -- Tabela Preço 
 create table preco (
	idPreco int primary key, 
    tipo_de_servico varchar (45),
    especialidade varchar (45),
    pecas_necessarias varchar (45), 
    qttd_pecas int,
    preco_pecas float, 
    valor_mao_obra float, 
    total_valor float
 );
 
 -- Tabela Estoque 
 create table estoque(
	idEstoque int,
    nome_peca varchar(45),
    qttd_estoque int, 
    valor_unitario float, 
    responsavel_estoque varchar(45), 
    funcionario_solicitado varchar (45),   
    primary key (idEstoque)
 );
 show tables;
