using System;
using System.ComponentModel.DataAnnotations;

namespace BDMiTienda.Models

{
    public class Venta
    {
        [Key]
        public int VentaId { get; set; }
        public DateTime FechaVenta { get ; set; }

        public int Cantidad { get; set; }
        public double Total { get; set; }

        public int UserId { get; set; }
        public User User { get; set; }

        public int ProductoId { get; set; }
        public Producto Producto { get; set; }


    }
}
