
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
名称：轮播图表Carousel_figure
负责人：
位置：首页
时间：18-1-12
*/
if exists (select * from sys.objects where name='Carousel_figure')
begin
		drop table Carousel_figure
end
go
create table Carousel_figure(
Carousel_Id int primary key identity(1,1), --编号
Carousel_Image varchar(100),--轮播图片
Write_blog_Id varchar(100),--点击图片后跳转地址(保留)
Carousel_Remark varchar(100) --备注
)

select * from Carousel_figure

/*
名称：热门博客推荐表Blog_Recommend
负责人：
位置：首页
时间：18-1-12
*/
if exists (select * from sys.objects where name='Blog_Recommend')
begin
		drop table Blog_Recommend
end
go
create table Blog_Recommend(
id int primary key identity(1,1), --热门博客编号
Blog_Title varchar(40),--热门博客标题
Write_blog_Id varchar(50),--点击标题后跳转地址（有待修正）
Blog_Type varchar(20), --博客的类型
Blog_Author varchar(20),--博主
Blog_Time datetime ,--博客发布时间
Blog_ReadNum int ,--博客阅读量
Blog_Message varchar(40),--博客留言
)

select * from Blog_Recommend

/*
名称：最新活动Activity
负责人：
位置：首页（待定）
时间：18-1-12
*/
if exists (select * from sys.objects where name='Activity')
begin
		drop table Activity
end
go
create table Activity(
id int primary key identity(1,1), --最新活动编号
Activity_Time datetime,--活动时间（活动开始时间，结束时间，活动期限）
Activity_Title varchar(40),--活动标题
Activity_Url varchar(40), --活动路径
Activity_State int,--活动状态,1表示在线，2表示线上，0表示下线

)

select * from Activity

/*
名称：优秀专辑Album
负责人：
时间：18-1-12
*/
if exists (select * from sys.objects where name='Album')
begin
		drop table Album
end
go
create table Album(
Album_Id int primary key identity(1,1), --优秀专辑编号
Album_Title varchar(40),--专辑标题
Album_Url varchar(40),--专辑路径
Album_Content varchar(40), --外键,该专辑包括的文章
Album_Author varchar(20),--专题作者

)

select * from Album





/*
名称：文章管理（Manage）
负责人：
时间：18-1-12
修改:删除
*/
--if exists(select 1 from sys.sysobjects where name='Manage')
--	drop table Manage
--go
--create table Manage
--(
--Manage_Id int primary key not null identity,--自增id
--Manage_Type varchar(20),--文章的状态,包括已发表,草稿箱,回收站外键,文章Id
--Manage_Own int,--外键，博主ID
--)
--go


/*
名称：评论管理Comment
负责人：
时间：18-1-12
*/
if exists(select 1 from sys.sysobjects where name='Comment')
	drop table Comment
go
create table Comment
(
Comment_Id int primary key identity not null,--自增ID
Comment_User int,--评论用户编号 
Comment_Time datetime ,--评论 时间
Write_blog_Id int,--回复的文章，外键文章ID
Comment_Content varchar(200),--回复内容
ULogin_Id int,--外键，博主ID
Parent_Comment_Id int --父级编号
)
go

select * from Comment

/*
名称：后台管理员
时间：2018-1-14
*/
if exists(select 1 from sys.sysobjects where name='AdminUser')
	drop table AdminUser
go
create table AdminUser
(
	AdminUser_Id int primary key identity,--编号
	AdminUser_Number varchar(20),--后台用户账号
	AdminUser_Pwd  varchar(20),--密码
	Users_Details_ID int--前后台用户信息编号
);
go

select * from AdminUser


/*
名称：文章审核
时间：2018-1-14
*/
if exists(select 1 from sys.sysobjects where name='Auditing_Blog')
	drop table Auditing_Blog
go
create table Auditing_Blog
(
	Auditing_Blog_Id int primary key identity,--编号
	AdminUser_Id int ,--后台用户账号
	Write_blog_Id int,--博客文章编号
	Auditing_Blog_State  int ,--博客的审核状态 1 审核未通过  2 审核通过    
	Auditing_Blog_Time datetime,--审核时间
	Auditing_Blog_Msg varchar(50)--未通过提示(有管理员填写)
);
go

select * from AdminUser


/*
名称：登陆注册 ULogin 
负责人：
时间：18-1-12
*/
if exists(select 1 from sys.sysobjects where name='ULogin')
	drop table ULogin
go
create table ULogin
(
ULogin_Id int primary key identity not null,--自增ID
ULogin_Phone varchar(11),--电话号码
ULogin_Email varchar(32),--邮箱账号
ULogin_Password varchar(32),--密码
Ulogin_BlogName varchar(32),--博客名
Users_Details_ID int--前后台用户信息编号
)
go

select * from ULogin



--前后台用户详细信息表
/*
名称：前后台用户详细信息表 Users_Details_Details 
负责人：
时间：18-1-12
*/
if exists(select 1 from sys.sysobjects where name='Users_Details')
	drop table Users_Details
go
create table Users_Details
(
  Users_Details_ID int primary key identity,--个人信息表标号
  Users_Details_Name varchar(20) not null,--用户昵称
  Users_Details_RealName varchar(20) ,--用户实际名称
  Users_Details_Jop varchar(20) ,--用户职位
  Users_Details_Sex int default 0 ,--用户性别  0  男  1 女 
  Users_Details_Photo varchar(64) ,--用户头像
  Users_Details_Birthday varchar(64),--用户生日
  Users_Details_Industry varchar(64) ,--用户行业
  --Users_Details_Follow int ,--关注人数
  --Users_Details_Etc int ,--粉丝人数
  Users_Details_LoginDate datetime,--注册时间
  Users_Details_LoginUrl varchar(10),--登陆地址
  Users_Details_Integral int,--积分，>=0
  Users_Details_Gold int,--金币，>=0
  Users_Details_Resume varchar(600) --用户简述 
)
go
select * from Users_Details



/*
名称：类别管理 Category
负责人：
时间：18-1-12
*/
if exists(select 1 from sys.objects where name='Category')
	drop table Category
go
create table Category
(
Category_Id int identity primary key not null,--自增ID
Category_Type varchar(20),--类别名称
--Category_Num int,--该类别下的文章数量
ULogin_Id int, --博主ID，外键
Category_Reception int--是否显示在前台0显示,1不显示
)
go

select * from Category

/*
名称：写博客Write_blog
负责人：
时间：18-1-12
*/
if exists(select 1 from sys.sysobjects where name='Write_blog')
	drop table Write_blog
go
create table Write_blog
(
Write_blog_Id int primary key not null identity,--自增id
Write_Title varchar(40),--文章标题
Write_ArticleType varchar(240),--文章类型 0表示原创,1表示转载，2表示翻译
Write_Content text ,--博客内容?????
Write_BlogType varchar(40),--博客分类
Write_Label varchar(40),--文章标签
Category_Id varchar(40),--外键，根据个人类别分类
Write_Private int,--博客的开放状态  0 为私密，1 为公开
ULogin_Id int ,--博主Id
Write_State int ,--博客的审核状态 0 待审核  1 审核未通过  2 审核通过    
Write_IsDel int -- 0 删除  1 保存  2发布 
)
go

select * from Write_blog

/*
名称：博客详情表 Details 
负责人：
时间：18-1-12
*/
if exists(select 1 from sys.sysobjects where name='Details')
	drop table Details
go
create table Details
(
   Details_Id int primary key identity,--详情id
   Details_Text varchar(1000) NOT null, --正文类容
   Details_PageView varchar(64) ,  --正文标题
   Details_ThumbUp int ,--点赞数量
   Details_Collection int,--收藏数量
   Details_Comment varchar(2000) ,--用户评论
   Details_Time varchar(64),--发布时间
   Details_Original int ,--作者原创数量
   ULogin_Id int --博主ID
	
)


select * from Details





/*
名称：博客配置Configure
负责人：
时间：18-1-12
*/
if exists(select 1 from sys.sysobjects where name='Configure')
	drop table Configure
go
create table Configure
(
Configure_Id int primary key identity not null,--自增ID
ULogin_Id int,--外键博主ID
Configure_Title varchar(100),--博主标题
Configure_Dscribe varchar(100),--博客描述
Configure_Skin int,--博客皮肤 1表示大白,2表示编程
Configure_Editor int,--默认编辑器1表示html编辑器,2表示MarkDown
Configure_Notice int,--评论通知设置,1表示通知,2表示不通知
Configure_Cpyright int,--版权声明，1开，2关
)
go

select * from Configure

/*
名称：博客专栏Special
负责人：
时间：18-1-12
*/
if exists(select * from sys.sysobjects where name='Special')
	drop table Special
go
create table Special
(
Special_Id int primary key identity not null,--自增ID
Special_Name varchar(20),--专栏
Special_Introduce varchar(200),--专栏介绍
Special_Type int,--专栏分类 1 前端等
Special_Image varchar(20),--专栏背景图片
ULogin_Id int,--外键，博主ID
)
go


select * from Special

/*
名称：金币积分使用记录表
负责人：
时间：18-1-14
*/
if exists(select * from sys.sysobjects where name='Gold_Score_Notes')
	drop table Gold_Score_Notes
go
create table Gold_Score_Notes
(
Gold_Score_Notes_Id int primary key identity not null,--自增ID
Gold_Score_Notes_UseType int,--使用方式  0 使用   1 收入  2 充值
Gold_Score_Notes_Type int,--0 积分  1 金币
Gold_Score_Notes_Time datetime--时间
)
go
select *  from Gold_Score_Notes


/*
名称：金币积分使用记录表
负责人：
时间：18-1-14
*/
if exists(select * from sys.sysobjects where name='Gold_Return')
	drop table Gold_Return
go
create table Gold_Return
(
Gold_Return_Id int primary key identity not null,--自增ID
Gold_Return_Max int,--使用方式  0 使用   1 收入  2 充值
Gold_Return_Min int,--0 积分  1 金币
Gold_Return_Retutn int--汇率
)
go
select * from Gold_Return



/*
名称：用户关系表  FollowUser
时间：18-1-13
*/
if exists(select 1 from sys.sysobjects where name='FollowUser')
	drop table FollowUser
go
create table FollowUser
(
FollowUser_ID int identity primary key,--编号
FollowUser_User1 int,--关注人编号
FollowUser_User2 int,--被关注人编号
FollowUser_Remark nvarchar(10),--备注
FollowUser_FollowDate datetime,--关注时间
FollowUser_CancelData datetime,--取消关注时间
)
go

select * from FollowUser
