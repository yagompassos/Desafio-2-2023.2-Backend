USE desafio2;

	-- A) Apresentar todos os dados dos veículos de um determinado proprietário (informado pelo usuário através do CPF)
SELECT p.cpf, v.placa, v.corPredominante, c.nomeCategoria, m.marca, m.nomeModelo
FROM VEICULO v
JOIN possui p ON v.placa = p.placa
JOIN CATEGORIA c ON v.idCategoria = c.idCategoria
JOIN MODELO m ON v.idModelo = m.idModelo
-- WHERE p.cpf = 'cpf_do_proprietario' <--- Adicionar aqui o CPF desejado
;

	-- B) Consultar proprietário(s) por qualquer parte do nome
SELECT * FROM PROPRIETARIO
WHERE nomeCompleto LIKE '%Fernan%'; -- <--- adicionar o nome desejado entre os caracteres de porcentagem

	-- C) Mostrar os dados da infração e do veículo que tiveram infrações cadastradas no Detran em um período (ou data) no padrão DE... ATÉ..
SELECT i.*, v.placa
FROM VEICULO v
JOIN comete c ON v.placa = c.placa
JOIN INFRACAO i ON c.idInfracao = i.idInfracao
WHERE i.dataHora BETWEEN '2021-01-01' AND '2023-01-01'; -- <--- substituir as datas pelas desejadas

	-- D) Pesquisar o número de veículos que foram cadastrados em cada modelo, ordenando pelo número de veículos em ordem decrescente;
SELECT M.nomeModelo, COUNT(V.placa) AS NumeroDeVeiculos
FROM VEICULO V
INNER JOIN MODELO M ON V.idModelo = M.idModelo
GROUP BY M.nomeModelo
ORDER BY NumeroDeVeiculos DESC;

    
    
    