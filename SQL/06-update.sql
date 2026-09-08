select * from estudantes;
update estudantes set nome = 'Parisotto' where nome = 'Edson Parisotto';

update estudantes 
set nome = 'Tamires Parisotto' , peso = '60' 
where email = 'tamires@fatec.sp.gov.br' limit 1;

update estudantes set nacionalidade = "BR" limit 3;


select * from estudantes;