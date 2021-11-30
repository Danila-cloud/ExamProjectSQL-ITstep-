use BookShop
go


--select B.Name
--from Books as B
--where B.Pages > 500 and B.Pages < 650



--select B.Name
--from Books as B
--where B.Name LIKE '%A' or B.Name LIKE '%Z'



--select B.Name
--from Books as B, Sales as S, Themes as T
--where T.Id = B.ThemeId and B.Id = S.BookId and  T.Name = 'Detective' and S.Quantity > 30



--select B.Name
--from Books as B
--where B.Name LIKE '%Microsoft' and B.Name NOT LIKE '%Windows'


--select T.Name as Theme_, B.Name, A.Name + ' ' + A.Surname as AUTHOR_, B.Price / B.Pages as PRICE_
--from Themes as T, Books as B, Authors as A
--Where A.Id = B.AuthorId and B.ThemeId = T.Id and B.Price / B.Pages > 0.65


--select B.Name
--from Books as B
--where B.Name LIKE '% % % '


--select B.Name, T.Name as THEME_, A.Name + '' + A.Surname as AUTHOR_, S.Price, S.Quantity, SH.Name as SHOPE_
--from Themes as T, Authors as A, Books as B, Sales as S, Shops as SH
--where B.Name NOT LIKE '%A'and T.Name != 'Programming' and A.Name + ' ' + A.Surname != 'Herbert Schildt' and S.Price BEtWEEN 10 and 20 and S.Quantity > 8 and SH.CountryId != 1 and T.Id = B.ThemeId and A.Id = B.AuthorId and B.Id =S.Id and SH.Id = S.ShopId 


--select 'Authors count:' as [Info], count(*) as COUNT_
--from Authors
--union all
--select 'Books count:' as [Info], count(*) as COUNT_
--from Books
--union all
--select 'Average sale price:' as [Info], AVG(Price) as PRICE_
--from Sales
--union all
--select 'Average count pages:' as [Info], AVG(Pages) as COUNT_
--from Books


--select T.Name as THEME_, SUM(B.Pages) as PAGES_
--from Themes as T, Books as B
--where T.Id = B.ThemeId
--group by T.Name


--select A.Surname as NAME_, count(B.Id) as BOOKS_, SUM(B.Pages) as PAGES_
--from Authors as A, Books as B
--where A.Id = B.AuthorId
--group by A.Surname


--select B.Name, MAX(B.Pages)  as MAXPAGES_
--from Themes as T, Books as B
--where T.Id = 7 and B.ThemeId = T.Id
--group by B.Name


--select T.Name, AVG(B.Pages) as [PAGES]
--from Themes as T, Books as B
--where T.Id = B.ThemeId AND PAGES > 400
--group by T.Name


--select T.Name, SUM(B.Pages) as PAGES_
--from Themes as T, Books as B
--WHERE T.Id = B.ThemeId and T.Name = 'Programming' or T.Name = 'Science' and B.Pages > 400
--group by T.Name


--SELECT
--       S.Price
--      ,[Quantity]
--      ,[SaleDate]
--      ,B.Name
--      ,Sh.Name
--  FROM Sales as S, Books as B, Shops as SH
--  WHERE B.Id = S.BookId and SH.Id = S.ShopId


select SH.Name, MAX(S.Quantity * S.Price) as MAX_
from Sales as S, Shops as SH
WHERE SH.Id = S.ShopId
group by Sh.Name
