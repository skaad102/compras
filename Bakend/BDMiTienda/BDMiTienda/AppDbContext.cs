using BDMiTienda.Models;
using Microsoft.EntityFrameworkCore;

namespace BDMiTienda
{
    public class AppDbContext : DbContext
    {
        public DbSet<User> User { get; set; }
        public DbSet<Venta> Venta { get; set; }
        public DbSet<Producto> Producto { get; set; }
        public DbSet<Compra> Compra { get; set; }
        public DbSet<Proveedor> Proveedor { get; set; }
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }
    }
}
