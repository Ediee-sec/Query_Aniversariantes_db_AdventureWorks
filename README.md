### Query no banco de dados público AdventureWorks2019 da Microsoft
-----------
> A Query foi desenvolvida apenas parar fins de próprio estudo, a finalidade da mesma é retornar quantos dias faltam para o aniversário de cara funcionário, para isso utilizo algumas funções padrões do sistema que irei explicar logo abaixo.

> A Query também pode servir como base para outras finalidades que possa surgir em um ambiente de produção, pois a lógica utilizada é genérica e pode se encaixar em diversas situações diferentes
---

### Funções:

1. **SUBSTRING** = *Está função tem como finalidade recortar parte de uma string. neste caso eu recordo a função GETDATE(), para pegar apenas ano,mes e dias e desconsiderar o horário*
* [Documentação SUBSTRING](https://docs.microsoft.com/pt-br/sql/t-sql/functions/substring-transact-sql?view=sql-server-ver15)

2. **GETDATE** = *Utilizo está função para pegar a data atual, porém está função vem com horario junto da data, por isso é necessário a utilização do SUBSTRING para retornar apenas a DATA*
* [Documentação GETDATE](https://docs.microsoft.com/pt-br/sql/t-sql/functions/getdate-transact-sql?view=sql-server-ver15)

3. **CONCAT** = *Função utilizada para concatenar (Juntar) informações ao resultado retornado na Query*
* [Documentacação CONCAT](https://docs.microsoft.com/pt-br/sql/t-sql/functions/concat-transact-sql?view=sql-server-ver15)

4. **YEAR** = *Retorna o ano da data informada dentro da função YEAR*
* [Documentação YEAR](https://docs.microsoft.com/pt-br/sql/t-sql/functions/year-transact-sql?view=sql-server-ver15)

5. **MONTH** = *Retorna o mês da data informada dentro da função MONTH*
* [Documentação MONTH](https://docs.microsoft.com/pt-br/sql/t-sql/functions/month-transact-sql?view=sql-server-ver15) 

6. **DAY** = *Retorna o dia da data informada dentro da função DAY*
* [Documentação DAY](https://docs.microsoft.com/pt-br/sql/t-sql/functions/day-transact-sql?view=sql-server-ver15)

7. **FormataData** = *Função desenvolvida internamente para converter o formato da data padrão do SQL para o formato utilizado no Brasil DD/MM/AAAA*
> **Sintaxe da função FomataData**

~~~~sql
CREATE FUNCTION [dbo].[FormataData](@Coluna datetime)
RETURNS VARCHAR(15)
AS
BEGIN
	DECLARE @AAA VARCHAR(20)
	SET @AAA = CONVERT(CHAR(10), CAST(@Coluna as datetime), 103) 
	RETURN @AAA
	
END
~~~~

-------------
<img src = img/img.png>
