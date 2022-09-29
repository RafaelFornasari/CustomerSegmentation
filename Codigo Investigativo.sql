CREATE DATABASE Projeto1;
USE projeto1;

SELECT * FROM historicovendas;

--1) Somatória homens e mulheres
WITH Generos_Sum as (
		select gender, count(Gender) as Generos
		from historicovendas
		group by gender
		)
SELECT * from Generos_Sum;

--2) Somatória casados e nao casados
WITH Casados_Sum as (
		select married, count(married) as Casados
		from historicovendas
		group by married
		)
SELECT * FROM Casados_Sum
order by Casados desc;

--3) Quantos homens são casados e não casados

SELECT Married as Male_Married, count(Married) as SomaCasados 
FROM Historicovendas
WHERE Gender = 'male'
Group By Married
Order By Somacasados Desc;

--4) Faixa de idade dos homens casados
SELECT * FROM historicovendas;

SELECT top(10) count(CustomerId) as ContagemID, age 
From Historicovendas
WHERE Gender = 'Male' and Married = 'Yes'
Group By Age 
Order by ContagemID desc;

--5) Qntd homens casados, graduados entre 35 e 50 anos
SELECT * FROM historicovendas;

Select count(Gender) as Male_Sum, Age
From HistoricoVendas
Where Gender = 'Male' and Married = 'Yes' and Graduated = 'Yes' and (Age >= 35 or age <= 50) 
Group By Age
Order by Male_Sum desc;

--6) Contagem das profissoes dos homens casados, graduados entre 35 a 50 anos
SELECT * FROM historicovendas;

SELECT count(customerID) as ContagemProfissoes, Profession
FROM HistoricoVendas
Where Gender = 'Male' and Married = 'Yes' and Graduated = 'Yes' and (Age >= 35 or age <= 50) 
Group by Profession
Order by ContagemProfissoes DESC;

--7) Existem mais de uma compra pelo mesmo CustomerID?
SELECT * FROM historicovendas;

SELECT (COUNT(CustomerID) - COUNT(distinct (CustomerID))) as   
From HistoricoVendas

--8) Tamanho da familia do nosso público alvo
SELECT * FROM historicovendas;

SELECT COUNT(customerID) as ContagemProfissoes, FamilySize
FROM HistoricoVendas
Where Gender = 'Male' and Married = 'Yes' and Graduated = 'Yes' and (Age >= 35 or age <= 50) and Profession = 'artist' 
Group by FamilySize
Order by ContagemProfissoes DESC;

--9) Segmentos do nosso público alvo
SELECT * FROM historicovendas;

SELECT COUNT(customerID) as ContagemProfissoes, Segmentation
FROM HistoricoVendas
Where Gender = 'Male' and Married = 'Yes' and Graduated = 'Yes' and (Age >= 35 or age <= 50) and Profession = 'artist'  
Group by Segmentation
Order by ContagemProfissoes DESC;

