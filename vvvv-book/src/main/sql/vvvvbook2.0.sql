use master
go
if exists(select * from sysdatabases where name='vvvvbook')
	drop database vvvvbook
go
create database vvvvbook
go
use vvvvbook
go
--���νṹ���
--parentId 0
--С˵ 0 id 1
--1 id 2
--���С˵ 1 id 3
--�й�С˵ 1 id 4
-------------------ͼ������------------------------------
create table bookType(		
	bookTypeId int identity primary key,
	parentId int not null,
	bookTypeName nvarchar(20) not null,
	isDelete int not null,--1��ʾ���õ� 2��ʾɾ����
	context nvarchar(40)
)
go
--drop table bookType 
go
alter table bookType add constraint DF_isdelete default(1) for isdelete
go
---------------------ͼ����Ϣ-------------------------------
create table bookInfo(	
	bookId int identity primary key,
	bookName nvarchar(20) not null,
	bookTypeId int not null,
	pbName nvarchar(20) not null,
	author nvarchar(20) not null,
	context nvarchar(4000),
	smallImg nvarchar(50),
	bigImg nvarchar(50),
	price money not null,
	pbdate datetime not null,
	bookStatus int not null,--1δ�ϼ� 2���ϼ�  3������
	vvvvprice money not null,
	--saleNums bigint not null	--�ۻ�������
)
go
--drop table bookInfo
go
alter table bookInfo	
	add constraint FK_bookTypeId
	foreign key(bookTypeId) references bookType(bookTypeId)
alter table bookInfo add constraint DF_smallImg default('nullsmall.png') for smallImg
alter table bookInfo add constraint DF_bigImg default('nullImg.png') for bigImg
alter table bookInfo add constraint DF_bookStatus default(1) for bookStatus

go
------------------�û�������Ϣ��------------------
create table customerInfo(		
	customerId int identity primary key,
	customerName nvarchar(20) not null,
	pwd varchar(20)not null,
	email varchar(20) not null
)
go
--drop table customerInfo
go
------------------�û���ϸ��Ϣ��------------------
create table customerDetailInfo(		
	customerId int not null primary key,
	tel varchar(13) ,
	address nvarchar(20) ,
	sex nvarchar(10),
	age int,
	countMoney money,
	qq varchar(12)
)
go
--drop table customerDetailInfo
go
alter table customerDetailInfo add constraint FK_customerId
	foreign key(customerId) references customerInfo(customerId)
go
alter table customerDetailInfo add constraint DK_countMoney
	default (0) for countMoney
go
------------------������------------------
create table bookComment(		
	commentId int identity primary key , 
	bookId int not null,
	customerId int not null ,
	context nvarchar(300) not null, 
	Status int not null       --1, 2����״̬����˺�ſɼ�
)
go
--drop table bookComment
go
alter table bookComment add constraint FK_bookDiscuss_bookId
    FOREIGN KEY(bookId) REFERENCES bookInfo(bookId)
go
alter table bookComment add constraint FK_bookDiscuss_customerId
    FOREIGN KEY(customerId) REFERENCES customerInfo(customerId)
go  
------------------����------------------
create table bookStock(			
	stockId  int identity primary key ,
	bookId   int not null ,
	bookCount    int ,
	minNum   int not null 
)
go
--drop table bookStock
go
alter table bookStock add constraint FK_bookStock_bookId
    FOREIGN KEY(bookId) REFERENCES bookInfo(bookId)  
go
------------------����Ա��------------------
create table sysAdmin(			
	adminId int identity primary key ,
	adminName nvarchar(20) not null ,
	pwd varchar(20) , 
	adminType int not null          --����Ա����
)
go
--drop table sysAdmin
go
------------------�ղؼб�------------------
create table favorite(				
	favoriteId int identity primary key ,
	bookId int not null,
	customerId int not null ,
	date datetime not null,
	context nvarchar(50) 
)
go
--drop table favorite
go
alter table favorite add constraint FK_favorite_bookId
    FOREIGN KEY(bookId) REFERENCES bookInfo(bookId)
go
alter table favorite add constraint FK_favorite_customerId
    FOREIGN KEY(customerId) REFERENCES customerInfo(customerId)
go
----------------------------------��ͼ�������������--------------------------------
--drop table booktype
--update bookType set parentId=1,bookTypeName='vvvv',isDelete=1,context='vvvv' where bookTypeId=9
insert into booktype(parentId, bookTypeName, context) values(0,N'С˵',N'С˵')	--1
insert into booktype(parentId, bookTypeName, context) values(1,N'�й�С˵',N'�й�С˵')	--2
insert into booktype(parentId, bookTypeName, context) values(1,N'���С˵',N'���С˵')	--3
insert into booktype(parentId, bookTypeName, context) values(2,N'����С˵',N'����С˵')	--4
insert into booktype(parentId, bookTypeName, context) values(2,N'ɢ��С˵',N'�ƻ�С˵')	--5
insert into booktype(parentId, bookTypeName, context) values(2,N'ССС˵',N'ССС˵')	--6
insert into booktype(parentId, bookTypeName, context) values(2,N'��ʵС˵',N'��ʵС˵')	--7
insert into booktype(parentId, bookTypeName, context) values(2,N'�Ļ�С˵',N'�Ļ�С˵')	--8
insert into booktype(parentId, bookTypeName, context) values(0,N'�Ƽ�',N'�Ƽ�')	--9
insert into booktype(parentId, bookTypeName, context) values(7,N'�����',N'�����')	--10
insert into booktype(parentId, bookTypeName, context) values(7,N'ҽѧ',N'�ִ�ҽѧ����')	--11
go
select * from booktype
go
------------------------------��ͼ����Ϣ���������---------------------------------
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'���޴���',11,N'���޴���',N'���޴���',N'���޴���',N'nothisbookSmall.png',N'nothisbookBig.png',0,'2000/01/01',0)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'����ɢ�ļ�',4,N'̫�����ճ�����',N'����',N'С�۵�',N'bingxin1.png',N'bingxin2.png',13.80,'2008/10/1',10)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'��־Ħɢ��',4,N'̫�����ճ�����',N'��־Ħ',N'�����������',N'xuzhimo1.png',N'xuzhimo2.png',13.20,'1950/1/1',10)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'Χ��',5,N'����.����.��֪�������',N'Ǯ����',N'����',N'weicheng1.png',N'weicheng2.png',14.00,'2002/5/1',8.00)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'27¥204',6,N'���ĳ�����',N'���춫',N'����',N'27¥2041.png',N'27¥2042.png',50,'2011/1/1',30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'����˵��',5,N'�й���ҵ������',N'��������� ',N'����',N'����˵��1.png',N'����˵��1.png',50,'2011/1/1',30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'֧������',5,N'���ĳ�����',N'ʯ��',N'����',N'֧������1.png',N'֧������2.png',21.80 ,'2004/1/1',13.30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'��������',5,N'�ƹ���������',N'��˷',N'����',N'��������1.png',N'��������2.png',50,'2006/1/1',30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'������',6,N'�����湫˾',N'����',N'����',N'������1.png',N'������2.png',50,'2009/1/1',30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'�����е��ź�������ׯ԰��',6,N'�Ϻ��������',N'���',N'����',N'����ׯ԰1.png',N'����ׯ԰2.png',50,'2011/1/1',30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'Ȧ��Ȧ��',5,N'�廪��ѧ������',N'��ǿ',N'�����ز�Ʒ����',N'Ȧ��Ȧ��1.png',N'Ȧ��Ȧ��2.png',50,'2011/1/1',30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'����',5,N'�ƹ���������',N'��ǿ',N'�����ز�Ʒ����',N'����1.png',N'����2.png',28.00,'2011/1/1',20)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'�ڵ�����20��',6,N'���������',N'�׶���',N'�����ĺڵ�����',N'�ڵ�����20��1.png',N'�ڵ�����20��2.png',28.00 ,'2009/5/1',14.80)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'������Щ��',7,N'�й�������湫˾',N'��������',N'����Ԫ谵ĳ������ִ�۶�λ',N'������Щ��1.png',N'������Щ��2.png',50,'2009/1/1',30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'�Ļ�����',8,N'������������',N'������',N'��������ڵ�һ���Ļ�ɢ�ļ�',N'�Ļ�����1.png',N'�Ļ�����2.png',22.00 ,'2011/1/1',16.00 )
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'����δ��',8,N'���ҳ�����',N'���ݱ���',N'���ݱ�����һ��С˵ɢ�ļ�',N'����δ��1.png',N'����δ��.png',25.00,N'2011/1/1',16.30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'����ɽ����',8,N'�Ϻ����ĳ�����',N'������',N'����Ϊ���صĻ���ɽ������̤�˰����������',N'����ɽ����1.png',N'����ɽ����2.png',59.00,'2011/1/1',38.40 )
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'������ǹ��',8,N'�Ϻ����ĳ�����',N'������',N'����������������������˹���·��ʮ���Ļ�ǹ��',N'������ǹ��1.png',N'������ǹ��2.png',30.00,'2011/1/1',24.00)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'java�������',10,N'��е��ҵ������',N'Y.Daniel Liang ',N'�������﷨�ṹ��������������ƻ���',N'java�������',N'java�������',66.00,'2011/1/1',49.00)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'Java���˼��',10,N'��е��ҵ������',N'��ʷ�� ',N'������Java���Ի����﷨�Լ��߼�����',N'Java���˼��1.png',N'Java���˼��2.png',108.00,'2011/1/1',76.70 )
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'JAVA���ļ���',10,N'��е��ҵ������',N'�˹���� ',N'�롶Java���˼�롷������Javaͼ��̩ɽ����',N'JAVA���ļ���1.png',N'JAVA���ļ���2.png',98.00,'2011/1/1',67.00)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'���Java����',10,N'���ӹ�ҵ������',N'���',N'�ӽ������ĽǶ�������Java����',N'���Java����1.png',N'���Java����2.png',50,'2008/1/1',30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'Effective Java���İ�',10,N'��е��ҵ������',N'Joshua Bloch ',N'��ȫ�棬�ṹ������������ϸ',N'Effective1.png',N'Effective2.png',50,'2011/1/1',30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'Java ���������',10,N'���ӹ�ҵ������',N'������ ',N'��ϸ����Java�������ı��˼�롢����﷨�����ģʽ',N'Java ���������','NJava ���������',50,'2011/1/1',30)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'�������',6,N'������ӳ�����',N'��ӹ',N'�������,�ǳ��ã�',N'�������1.png',N'�������2.png',49,'2009/04/01',39)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'������',6,N'������ӳ�����',N'��ӹ',N'������,�ǳ��ã�',N'������1.png',N'������2.png',49,'2009/04/01',39)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'��ѧ���ģʽ',10,N'�����ʵ������',N'��־ѧ',N'��ѧ�������ģʽ,�ǳ��ã�',N'yixuexhejimoshi1.png',N'yixuexhejimoshi2.png',49,'2009/04/01',39)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'���ݽṹ(java���԰�)',10,N'�廪��ѧ������',N'�ƹ��',N'���ݽṹ(java���԰�),�ǳ��ã�',N'���ݽṹ(java���԰�)1.png',N'���ݽṹ(java���԰�)2.png',32,'2006/01/01',22)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'���ݽṹ(C���԰�)',10,N'�廪��ѧ������',N'��ε��',N'���ݽṹ(C���԰�),�ر�ã�',N'���ݽṹ(C���԰�)1.png',N'���ݽṹ(C���԰�)2.png',30,'2008/03/01',20)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'�ٴ�ҽ��ѧ',11,N'�㶫�ߵȽ���������',N'��ΰ��',N'���ٴ�ҽ��ѧ����һ��Ӧ���ִ�ҽ�Ƽ�����Ϻ����Ƽ������ٴ�ѧ�ƣ�',N'�ٴ�ҽ��ѧ1.png',N'�ٴ�ҽ��ѧ2.png',30,'2007/08/01',20)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'�����ҽ��',11,N'��������������',N'�塤������',N'������֤���ڱ�֤��ɫ��������������������ϲ�',N'�����ҽ��1.png',N'�����ҽ��2.png',29.00,'2006/06/01',21.80)
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
values(N'��־ǿ�ٴ�ҽ��100��',11,N'�й���ҽҩ������',N'��־ǿ',N'����������ٴ�ҽ��100����',N'��־ǿ�ٴ�ҽ��100��1.png',N'��־ǿ�ٴ�ҽ��100��2.png',28.00,'2009/02/01',20.00)

go
select * from bookInfo where bookName=N'���޴���'
go
update bookInfo set smallImg='small001.png',bigImg='big001.png' where bookId=2
update bookInfo set smallImg='small002.png',bigImg='big002.png' where bookId=3
update bookInfo set smallImg='small003.png',bigImg='big003.png' where bookId=4
update bookInfo set smallImg='small004.png',bigImg='big004.png' where bookId=5
update bookInfo set smallImg='small005.png',bigImg='big005.png' where bookId=6
update bookInfo set smallImg='small006.png',bigImg='big006.png' where bookId=7
update bookInfo set smallImg='small007.png',bigImg='big007.png' where bookId=8
update bookInfo set smallImg='small008.png',bigImg='big008.png' where bookId=9
update bookInfo set smallImg='small009.png',bigImg='big009.png' where bookId=10
update bookInfo set smallImg='small010.png',bigImg='big010.png' where bookId=11
update bookInfo set smallImg='small011.png',bigImg='big011.png' where bookId=12
update bookInfo set smallImg='small012.png',bigImg='big012.png' where bookId=13
update bookInfo set smallImg='small013.png',bigImg='big013.png' where bookId=14
update bookInfo set smallImg='small014.png',bigImg='big014.png' where bookId=15
update bookInfo set smallImg='small015.png',bigImg='big015.png' where bookId=16
update bookInfo set smallImg='small016.png',bigImg='big016.png' where bookId=17
update bookInfo set smallImg='small017.png',bigImg='big017.png' where bookId=18
update bookInfo set smallImg='small018.png',bigImg='big018.png' where bookId=19
update bookInfo set smallImg='small019.png',bigImg='big019.png' where bookId=20
update bookInfo set smallImg='small020.png',bigImg='big020.png' where bookId=21
update bookInfo set smallImg='small021.png',bigImg='big021.png' where bookId=22
update bookInfo set smallImg='small022.png',bigImg='big022.png' where bookId=23
update bookInfo set smallImg='small023.png',bigImg='big023.png' where bookId=24
update bookInfo set smallImg='small024.png',bigImg='big024.png' where bookId=25
update bookInfo set smallImg='small025.png',bigImg='big025.png' where bookId=26
update bookInfo set smallImg='small026.png',bigImg='big026.png' where bookId=27
update bookInfo set smallImg='small027.png',bigImg='big027.png' where bookId=28
update bookInfo set smallImg='small028.png',bigImg='big028.png' where bookId=29
update bookInfo set smallImg='small029.png',bigImg='big029.png' where bookId=30
update bookInfo set smallImg='small030.png',bigImg='big030.png' where bookId=31
update bookInfo set smallImg='small031.png',bigImg='big031.png' where bookId=32

go
--select * from bookInfo
--update bookInfo set bookName=N'����δ��',pbName=N'���ҳ�����',author=N'���ݱ���',context=N'���ݱ�����һ��С˵ɢ�ļ�',smallImg=N'����δ��1.png'
--drop table bookInfo
select bookId,bookName,booktypeId,pbName,author,context,smallImg,bigImg,price,pbdate,
bookStatus,vvvvprice from bookInfo where booktypeId=10 and bookStatus=2
go
----------------------------���û�������Ϣ���������----------------------------
insert into customerInfo(customerName,pwd,email) values(N'luowei','luowei','luowei505050@126.com')--1
insert into customerInfo(customerName,pwd,email) values(N'rowin','rowin','rowin010101@sina.com')--2
insert into customerInfo(customerName,pwd,email) values(N'admin','admin','admin@163.com')--3
insert into customerInfo(customerName,pwd,email) values(N'root','root','root@qq.com')--4
insert into customerInfo(customerName,pwd,email) values(N'test','test','test@sohu.com')--5
go
select * from customerInfo
go
----------------------------���û���ϸ��Ϣ���������----------------------------
insert into customerDetailInfo(customerId,tel,address,sex,age,countMoney,qq) 
values(1,13875408888,N'����ʡ¦����¦����',N'��',22,default,745054025)
insert into customerDetailInfo(customerId,tel,address,sex,age,countMoney,qq) 
values(2,13812345678,N'����ʡ������ʯ����',N'��',52,default,123456789)
insert into customerDetailInfo(customerId,tel,address,sex,age,countMoney,qq) 
values(3,13812345678,N'����ʡ��ɳ���껨��',N'Ů',16,default,666666666)
insert into customerDetailInfo(customerId,tel,address,sex,age,countMoney,qq) 
values(4,13812345678,N'�㶫ʡ�����а�����',N'Ů',40,default,777777777)
insert into customerDetailInfo(customerId,tel,address,sex,age,countMoney,qq) 
values(5,13812345678,N'����ʡ�����������',N'��',35,default,777777777)
go
select * from customerDetailInfo
go
----------------------------���������������----------------------------
insert into bookComment(bookId,customerId,context,Status) 
values(12,1,N'���ڵ�����20�꡷άΨΪΪ��Ϊ�ܺ�',1)
insert into bookComment(bookId,customerId,context,Status) 
values(13,2,N'��������Щ�¡�rowin��Ϊ��ֱ�ÿ�',2)
insert into bookComment(bookId,customerId,context,Status) 
values(19,3,N'��Java���˼�롷admin���ߴ����ѧϰJava����',2)
insert into bookComment(bookId,customerId,context,Status) 
values(24,3,N'��������¡��ܺÿ���������root����',1)
insert into bookComment(bookId,customerId,context,Status) 
values(23,1,N'��Java ��������̡���javaѧϰ�кܴ���ô�',1)
insert into bookComment(bookId,customerId,context,Status) 
values(26,1,N'����õ��������ѧ���ģʽ����ѧ���ģʽ��',2)
insert into bookComment(bookId,customerId,context,Status) 
values(29,1,N'���ٴ�ҽ��ѧ����һ���ܲ�����ٴ�ҽѧ��',1)
go
select * from bookComment
go
-----------------------������������--------------------------------
insert into bookStock(bookId,bookCount,minNum) values(1,100,2)
insert into bookStock(bookId,bookCount,minNum) values(3,50,3)
insert into bookStock(bookId,bookCount,minNum) values(10,5,0)
insert into bookStock(bookId,bookCount,minNum) values(11,20,0)
insert into bookStock(bookId,bookCount,minNum) values(17,100,1)
insert into bookStock(bookId,bookCount,minNum) values(18,100,0)
insert into bookStock(bookId,bookCount,minNum) values(22,100,0)
insert into bookStock(bookId,bookCount,minNum) values(27,100,2)
go
insert into bookStock(bookId,bookCount,minNum) values(12,10,1)
insert into bookStock(bookId,bookCount,minNum) values(13,10,0)
insert into bookStock(bookId,bookCount,minNum) values(19,20,5)
insert into bookStock(bookId,bookCount,minNum) values(24,10,0)
insert into bookStock(bookId,bookCount,minNum) values(23,10,2)
insert into bookStock(bookId,bookCount,minNum) values(26,25,0)
insert into bookStock(bookId,bookCount,minNum) values(29,30,2)
go
-----------------------�����Ա���������--------------------------------
insert into sysAdmin(adminName,pwd,adminType) values('system','system',0)
insert into sysAdmin(adminName,pwd,adminType) values('admin','admin',1)
insert into sysAdmin(adminName,pwd,adminType) values('luowei','luowei',2)
insert into sysAdmin(adminName,pwd,adminType) values('test','test',3)
go
select * from sysAdmin
go

-----------------------���ղؼб��������--------------------------------
insert into favorite(bookId,customerId,date,context ) values(1,1,'2011/10/16',N'luowei�ղصġ�����ɢ�ļ���')
insert into favorite(bookId,customerId,date,context ) values(2,1,'2011/10/16',N'luowei�ղصġ������š�')
insert into favorite(bookId,customerId,date,context ) values(17,2,'2010/10/1',N'rowin�ղصġ�������ǹ�֡�')
go
select * from favorite
go
----===========================================================================
--��ҳ��ѯ
select top 3 * from bookInfo where bookId not in(
	select top 3 bookId from bookInfo where bookTypeId=0
	) and bookTypeId=8
go
--ͬ����Ĳ�ѯ
select top 3 * from bookInfo  where bookTypeId=8 and
	 bookId not in(
	select top 3 bookId from bookInfo where bookTypeId=0
	)
go

























