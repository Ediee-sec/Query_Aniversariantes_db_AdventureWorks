DECLARE		@Data	VARCHAR(10) = SUBSTRING(dbo.FormataData(GETDATE()),1,10) 

SELECT		FirstName	AS	'Nome'
		,	LastName	AS	'Sobrenome'
		,	JobTitle	AS	'Cargo'
		,	dbo.FormataData(BirthDate)	AS	'Data Nascimento'
		,	CONCAT(YEAR(@Data) - YEAR(BirthDate), ' Anos')	AS	'Idade'
		,	CASE
				WHEN MONTH(@Data) = MONTH(BirthDate) AND DAY(@Data) = DAY(BirthDate) THEN 'Faz Aniversário Hoje'
				WHEN MONTH(@Data) = MONTH(BirthDate) AND DAY(@Data) < DAY(BirthDate) THEN CONCAT('Faltam ',DAY(@Data) - DAY(BirthDate), ' Dias')
				WHEN MONTH(@Data) < MONTH(BirthDate) THEN CONCAT('Faltam ',(MONTH(BirthDate) - MONTH(@Data)) * 30 + DAY(BirthDate), ' Dias')
				ELSE 'Já Fez Aniversário'
			END AS 'Aniversário'
FROM HumanResources.Employee HE
INNER JOIN Person.Person PP (NOLOCK) ON
	PP.BusinessEntityID = HE.BusinessEntityID

