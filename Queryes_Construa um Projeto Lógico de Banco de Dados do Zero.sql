-- Recuperações simples com SELECT Statement
select  m.nome_medico
       ,m.cod_crm
from    medico m

-- Filtros com WHERE Statement
select  c.cod_convenio
       ,c.nome_convenio
from    convenio c
where   c.nome_convenio like 'UNIMED%'

-- ordenações dos dados com ORDER BY
select   p.cod_proce
        ,p.nome_proce
from     procedimento p
order by p.nome_proce

-- Condições de filtros aos grupos – HAVING Statement
select   p.cod_exame
        ,count(p.cod_exame) as qtde
from     pedido_exame p
group by p.cod_exame
having   count(p.cod_exame) > 5

-- junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
select   m.nome_medico
        ,c.nome_convenio
        ,b.data_inicio
from     medico m
        ,medico_convenio b
        ,convenio c
where    m.cod_medico = b.cod_medico
and      b.cod_convenio = c.cod_convenio
and      b.data_fim is null
