use os_oficina;
show tables;
desc clients_pf;

insert into clients_pf(idClient_pf,nome_cliente, cpf, data_de_nascimento, endereço, cidade, estado, telefone, email)
			   values (1,"Gillane Rosas", 12345678903, "01.09.1990"," Rua 4-Cidade Rio", "Rio de Janeiro", "RJ"," 2199028314", "gi_rosas@gmail.com");
insert into clients_pf values(2,"Fernando Dias", 32489678647, "05.03.1997"," Rua 1-Cidade Rio", "Rio de Janeiro", "RJ"," 2199283901", "frd_dias@gmail.com"),
					  (3,"Rogério Ceni", 63789415672, "03.11.1998"," Rua 3-Cidade Rio", "Rio de Janeiro", "RJ"," 2199456314", "rog_ceni@gmail.com");
select * from clients_pf;