-- Recuperações simples com SELECT Statement
select  p.id_produto
       ,p.categoria_produto
       ,p.descricao_produto
       ,p.valor_produto
from    produto p

-- Filtros com WHERE Statement
select  c.nome_cliente
       ,c.nome_meio_cliente
       ,c.sobrenome_cliente
       ,c.uf_cliente
from    cliente c
where   c.cpf_cnpj_cliente = '29722141000108'

-- ordenações dos dados com ORDER BY
select   f.id_forma_pagamento
        ,f.nome_forma_pagamento
from     forma_pagamento f
order by f.nome_forma_pagamento

-- Condições de filtros aos grupos – HAVING Statement
select   p.motivo_cancelamento
        ,count(p.motivo_cancelamento) as qtde
from     pedido p
where    p.motivo_cancelamento > 0
having   count(p.motivo_cancelamento) > 10

-- junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
select   a.cnpj_vendedor_parceiro
        ,a.razao_social
        ,b.qtd_estoque_parceiro
        ,c.descricao_produto
from     vendedor_parceiro a
        ,vendedor_parceiro_produto b
        ,produto c
where    a.cnpj_vendedor_parceiro = b.cnpj_vendedor_parceiro
and      b.id_produto = c.id_produto
