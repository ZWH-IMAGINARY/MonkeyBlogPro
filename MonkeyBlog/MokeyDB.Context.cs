﻿//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MonkeyBlog
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BlogEntities : DbContext
    {
        public BlogEntities()
            : base("name=BlogEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Activity> Activity { get; set; }
        public DbSet<AdminUser> AdminUser { get; set; }
        public DbSet<Album> Album { get; set; }
        public DbSet<Auditing_Blog> Auditing_Blog { get; set; }
        public DbSet<Blog_Recommend> Blog_Recommend { get; set; }
        public DbSet<Carousel_figure> Carousel_figure { get; set; }
        public DbSet<Category> Category { get; set; }
        public DbSet<Comment> Comment { get; set; }
        public DbSet<Configure> Configure { get; set; }
        public DbSet<Details> Details { get; set; }
        public DbSet<FollowUser> FollowUser { get; set; }
        public DbSet<Gold_Return> Gold_Return { get; set; }
        public DbSet<Gold_Score_Notes> Gold_Score_Notes { get; set; }
        public DbSet<Special> Special { get; set; }
        public DbSet<ULogin> ULogin { get; set; }
        public DbSet<Users_Details> Users_Details { get; set; }
        public DbSet<Write_blog> Write_blog { get; set; }
    }
}
