using System;
using System.ComponentModel.DataAnnotations;

namespace BDMiTienda.Models
{
    public class Compra
    {
        [Key]
        public int CompraId { get; set; }
        public DateTime FechaCompra{ get; set; }
        public int Cantidad { get; set; }
        public double Precio { get; set; }

        public int ProductoId { get; set; }
        public Producto Producto { get; set; }

        public int ProveedorId { get; set; }
        public Proveedor Proveedor { get; set; }


    }
}
