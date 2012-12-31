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
create table bookType(
	bookTypeId int identity primary key,
	parentId int not null,
	bookTypeName nvarchar(20) not null,
	isDelete int not null,--1��ʾ���õ� 2��ʾɾ����
	context nvarchar(40)
)
go
alter table bookType add constraint DF_isdelete default(1) for isdelete
go
create table bookInfo(	--ͼ����Ϣ
	bookId int identity primary key,
	bookName nvarchar(20) not null,
	booktypeId int not null,
	pbName nvarchar(20) not null,
	author nvarchar(20) not null,
	context nvarchar(40),
	smallImg nvarchar(20),
	bigImg nvarchar(20),
	price money not null,
	pbdate datetime not null,
	bookStatus int not null,--1δ�ϼ� 2���ϼ�  3������
	vvvvprice money not null,
	--saleNums bigint not null	--�ۻ�������
)
go
alter table bookInfo
	add constraint FK_booktypeId
	foreign key(booktypeId) references bookType(booktypeId)
alter table bookInfo add constraint DF_smallImg default('nullsmall.png') for smallImg
alter table bookInfo add constraint DF_bigImg default('nullImg.png') for bigImg
alter table bookInfo add constraint DF_bookStatus default(1) for bookStatus

go
insert into booktype(parentId,bookTypeName,context) values(0,N'С˵',N'С˵')
insert into booktype(parentId,bookTypeName,context) values(1,N'�й�С˵',N'�й�С˵')
insert into booktype(parentId,bookTypeName,context) values(1,N'���С˵',N'���С˵')
insert into booktype(parentId,bookTypeName,context) values(2,N'����С˵',N'����С˵')
insert into booktype(parentId,bookTypeName,context) values(2,N'�ƻ�С˵',N'�ƻ�С˵')
insert into booktype(parentId,bookTypeName,context) values(2,N'����С˵',N'����С˵')
insert into booktype(parentId,bookTypeName,context) values(0,N'�Ƽ�',N'�Ƽ�')
insert into booktype(parentId,bookTypeName,context) values(7,N'�����',N'�����')
go
select * from booktype
--drop table booktype
--update bookType set parentId=1,bookTypeName='vvvv',isDelete=1,context='vvvv' where bookTypeId=9
go
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
	values(N'�������',6,N'������ӳ�����',N'��ӹ',N'�������,�ǳ��ã�',default,default,49,'2009/04/01',39)
go
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
	values(N'������',6,N'������ӳ�����',N'��ӹ',N'������,�ǳ��ã�',default,default,49,'2009/04/01',39)
go
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
	values(N'��ѧ���ģʽ',8,N'�����ʵ������',N'��־ѧ',N'��ѧ�������ģʽ,�ǳ��ã�',default,default,49,'2009/04/01',39)
go
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
	values(N'���ݽṹ(java���԰�)',8,N'�廪��ѧ������',N'�ƹ��',N'���ݽṹ(java���԰�),�ǳ��ã�',default,default,32,'2006/01/01',22)
go
insert into bookInfo(bookName,bookTypeId,pbName,author,context,smallImg,bigImg,price,pbdate,vvvvprice)
	values(N'���ݽṹ(C���԰�)',8,N'�廪��ѧ������',N'��ε��',N'���ݽṹ(C���԰�),�ر�ã�',default,default,30,'2008/03/01',20)
go
select * from bookInfo
--drop table bookInfo

