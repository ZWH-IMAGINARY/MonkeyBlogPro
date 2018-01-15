
use master
go

if exists (select * from sys.databases where name='Blog')
begin	
		drop database Blog		
end
go
create database Blog
go

use Blog
go
/*
���ƣ��ֲ�ͼ��Carousel_figure
�����ˣ�
λ�ã���ҳ
ʱ�䣺18-1-12
*/
if exists (select * from sys.objects where name='Carousel_figure')
begin
		drop table Carousel_figure
end
go
create table Carousel_figure(
Carousel_Id int primary key identity(1,1), --���
Carousel_Image varchar(100),--�ֲ�ͼƬ
Write_blog_Id varchar(100),--���ͼƬ����ת��ַ(����)
Carousel_Remark varchar(100) --��ע
)

select * from Carousel_figure

/*
���ƣ����Ų����Ƽ���Blog_Recommend
�����ˣ�
λ�ã���ҳ
ʱ�䣺18-1-12
*/
if exists (select * from sys.objects where name='Blog_Recommend')
begin
		drop table Blog_Recommend
end
go
create table Blog_Recommend(
id int primary key identity(1,1), --���Ų��ͱ��
Blog_Title varchar(40),--���Ų��ͱ���
Write_blog_Id varchar(50),--����������ת��ַ���д�������
Blog_Type varchar(20), --���͵�����
Blog_Author varchar(20),--����
Blog_Time datetime ,--���ͷ���ʱ��
Blog_ReadNum int ,--�����Ķ���
Blog_Message varchar(40),--��������
)

select * from Blog_Recommend

/*
���ƣ����»Activity
�����ˣ�
λ�ã���ҳ��������
ʱ�䣺18-1-12
*/
if exists (select * from sys.objects where name='Activity')
begin
		drop table Activity
end
go
create table Activity(
id int primary key identity(1,1), --���»���
Activity_Time datetime,--�ʱ�䣨���ʼʱ�䣬����ʱ�䣬����ޣ�
Activity_Title varchar(40),--�����
Activity_Url varchar(40), --�·��
Activity_State int,--�״̬,1��ʾ���ߣ�2��ʾ���ϣ�0��ʾ����

)

select * from Activity

/*
���ƣ�����ר��Album
�����ˣ�
ʱ�䣺18-1-12
*/
if exists (select * from sys.objects where name='Album')
begin
		drop table Album
end
go
create table Album(
Album_Id int primary key identity(1,1), --����ר�����
Album_Title varchar(40),--ר������
Album_Url varchar(40),--ר��·��
Album_Content varchar(40), --���,��ר������������
Album_Author varchar(20),--ר������

)

select * from Album





/*
���ƣ����¹���Manage��
�����ˣ�
ʱ�䣺18-1-12
�޸�:ɾ��
*/
--if exists(select 1 from sys.sysobjects where name='Manage')
--	drop table Manage
--go
--create table Manage
--(
--Manage_Id int primary key not null identity,--����id
--Manage_Type varchar(20),--���µ�״̬,�����ѷ���,�ݸ���,����վ���,����Id
--Manage_Own int,--���������ID
--)
--go


/*
���ƣ����۹���Comment
�����ˣ�
ʱ�䣺18-1-12
*/
if exists(select 1 from sys.sysobjects where name='Comment')
	drop table Comment
go
create table Comment
(
Comment_Id int primary key identity not null,--����ID
Comment_User int,--�����û���� 
Comment_Time datetime ,--���� ʱ��
Write_blog_Id int,--�ظ������£��������ID
Comment_Content varchar(200),--�ظ�����
ULogin_Id int,--���������ID
Parent_Comment_Id int --�������
)
go

select * from Comment

/*
���ƣ���̨����Ա
ʱ�䣺2018-1-14
*/
if exists(select 1 from sys.sysobjects where name='AdminUser')
	drop table AdminUser
go
create table AdminUser
(
	AdminUser_Id int primary key identity,--���
	AdminUser_Number varchar(20),--��̨�û��˺�
	AdminUser_Pwd  varchar(20),--����
	Users_Details_ID int--ǰ��̨�û���Ϣ���
);
go

select * from AdminUser


/*
���ƣ��������
ʱ�䣺2018-1-14
*/
if exists(select 1 from sys.sysobjects where name='Auditing_Blog')
	drop table Auditing_Blog
go
create table Auditing_Blog
(
	Auditing_Blog_Id int primary key identity,--���
	AdminUser_Id int ,--��̨�û��˺�
	Write_blog_Id int,--�������±��
	Auditing_Blog_State  int ,--���͵����״̬ 1 ���δͨ��  2 ���ͨ��    
	Auditing_Blog_Time datetime,--���ʱ��
	Auditing_Blog_Msg varchar(50)--δͨ����ʾ(�й���Ա��д)
);
go

select * from AdminUser


/*
���ƣ���½ע�� ULogin 
�����ˣ�
ʱ�䣺18-1-12
*/
if exists(select 1 from sys.sysobjects where name='ULogin')
	drop table ULogin
go
create table ULogin
(
ULogin_Id int primary key identity not null,--����ID
ULogin_Phone varchar(11),--�绰����
ULogin_Email varchar(32),--�����˺�
ULogin_Password varchar(32),--����
Ulogin_BlogName varchar(32),--������
Users_Details_ID int--ǰ��̨�û���Ϣ���
)
go

select * from ULogin



--ǰ��̨�û���ϸ��Ϣ��
/*
���ƣ�ǰ��̨�û���ϸ��Ϣ�� Users_Details_Details 
�����ˣ�
ʱ�䣺18-1-12
*/
if exists(select 1 from sys.sysobjects where name='Users_Details')
	drop table Users_Details
go
create table Users_Details
(
  Users_Details_ID int primary key identity,--������Ϣ����
  Users_Details_Name varchar(20) not null,--�û��ǳ�
  Users_Details_RealName varchar(20) ,--�û�ʵ������
  Users_Details_Jop varchar(20) ,--�û�ְλ
  Users_Details_Sex int default 0 ,--�û��Ա�  0  ��  1 Ů 
  Users_Details_Photo varchar(64) ,--�û�ͷ��
  Users_Details_Birthday varchar(64),--�û�����
  Users_Details_Industry varchar(64) ,--�û���ҵ
  --Users_Details_Follow int ,--��ע����
  --Users_Details_Etc int ,--��˿����
  Users_Details_LoginDate datetime,--ע��ʱ��
  Users_Details_LoginUrl varchar(10),--��½��ַ
  Users_Details_Integral int,--���֣�>=0
  Users_Details_Gold int,--��ң�>=0
  Users_Details_Resume varchar(600) --�û����� 
)
go
select * from Users_Details



/*
���ƣ������� Category
�����ˣ�
ʱ�䣺18-1-12
*/
if exists(select 1 from sys.objects where name='Category')
	drop table Category
go
create table Category
(
Category_Id int identity primary key not null,--����ID
Category_Type varchar(20),--�������
--Category_Num int,--������µ���������
ULogin_Id int, --����ID�����
Category_Reception int--�Ƿ���ʾ��ǰ̨0��ʾ,1����ʾ
)
go

select * from Category

/*
���ƣ�д����Write_blog
�����ˣ�
ʱ�䣺18-1-12
*/
if exists(select 1 from sys.sysobjects where name='Write_blog')
	drop table Write_blog
go
create table Write_blog
(
Write_blog_Id int primary key not null identity,--����id
Write_Title varchar(40),--���±���
Write_ArticleType varchar(240),--�������� 0��ʾԭ��,1��ʾת�أ�2��ʾ����
Write_Content text ,--��������?????
Write_BlogType varchar(40),--���ͷ���
Write_Label varchar(40),--���±�ǩ
Category_Id varchar(40),--��������ݸ���������
Write_Private int,--���͵Ŀ���״̬  0 Ϊ˽�ܣ�1 Ϊ����
ULogin_Id int ,--����Id
Write_State int ,--���͵����״̬ 0 �����  1 ���δͨ��  2 ���ͨ��    
Write_IsDel int -- 0 ɾ��  1 ����  2���� 
)
go

select * from Write_blog

/*
���ƣ���������� Details 
�����ˣ�
ʱ�䣺18-1-12
*/
if exists(select 1 from sys.sysobjects where name='Details')
	drop table Details
go
create table Details
(
   Details_Id int primary key identity,--����id
   Details_Text varchar(1000) NOT null, --��������
   Details_PageView varchar(64) ,  --���ı���
   Details_ThumbUp int ,--��������
   Details_Collection int,--�ղ�����
   Details_Comment varchar(2000) ,--�û�����
   Details_Time varchar(64),--����ʱ��
   Details_Original int ,--����ԭ������
   ULogin_Id int --����ID
	
)


select * from Details





/*
���ƣ���������Configure
�����ˣ�
ʱ�䣺18-1-12
*/
if exists(select 1 from sys.sysobjects where name='Configure')
	drop table Configure
go
create table Configure
(
Configure_Id int primary key identity not null,--����ID
ULogin_Id int,--�������ID
Configure_Title varchar(100),--��������
Configure_Dscribe varchar(100),--��������
Configure_Skin int,--����Ƥ�� 1��ʾ���,2��ʾ���
Configure_Editor int,--Ĭ�ϱ༭��1��ʾhtml�༭��,2��ʾMarkDown
Configure_Notice int,--����֪ͨ����,1��ʾ֪ͨ,2��ʾ��֪ͨ
Configure_Cpyright int,--��Ȩ������1����2��
)
go

select * from Configure

/*
���ƣ�����ר��Special
�����ˣ�
ʱ�䣺18-1-12
*/
if exists(select * from sys.sysobjects where name='Special')
	drop table Special
go
create table Special
(
Special_Id int primary key identity not null,--����ID
Special_Name varchar(20),--ר��
Special_Introduce varchar(200),--ר������
Special_Type int,--ר������ 1 ǰ�˵�
Special_Image varchar(20),--ר������ͼƬ
ULogin_Id int,--���������ID
)
go


select * from Special

/*
���ƣ���һ���ʹ�ü�¼��
�����ˣ�
ʱ�䣺18-1-14
*/
if exists(select * from sys.sysobjects where name='Gold_Score_Notes')
	drop table Gold_Score_Notes
go
create table Gold_Score_Notes
(
Gold_Score_Notes_Id int primary key identity not null,--����ID
Gold_Score_Notes_UseType int,--ʹ�÷�ʽ  0 ʹ��   1 ����  2 ��ֵ
Gold_Score_Notes_Type int,--0 ����  1 ���
Gold_Score_Notes_Time datetime--ʱ��
)
go
select *  from Gold_Score_Notes


/*
���ƣ���һ���ʹ�ü�¼��
�����ˣ�
ʱ�䣺18-1-14
*/
if exists(select * from sys.sysobjects where name='Gold_Return')
	drop table Gold_Return
go
create table Gold_Return
(
Gold_Return_Id int primary key identity not null,--����ID
Gold_Return_Max int,--ʹ�÷�ʽ  0 ʹ��   1 ����  2 ��ֵ
Gold_Return_Min int,--0 ����  1 ���
Gold_Return_Retutn int--����
)
go
select * from Gold_Return



/*
���ƣ��û���ϵ��  FollowUser
ʱ�䣺18-1-13
*/
if exists(select 1 from sys.sysobjects where name='FollowUser')
	drop table FollowUser
go
create table FollowUser
(
FollowUser_ID int identity primary key,--���
FollowUser_User1 int,--��ע�˱��
FollowUser_User2 int,--����ע�˱��
FollowUser_Remark nvarchar(10),--��ע
FollowUser_FollowDate datetime,--��עʱ��
FollowUser_CancelData datetime,--ȡ����עʱ��
)
go

select * from FollowUser
