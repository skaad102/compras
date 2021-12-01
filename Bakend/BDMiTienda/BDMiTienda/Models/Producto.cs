using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BDMiTienda.Models

{
    public class Producto
    {
        [Key]
        public int ProdurctoId { get; set; }

        public int SKU { get; set; }

        [Required]
        public string Nombre { get; set; }
        [Required]
        public float Precio { get; set; }
        [Required]
        public int Stock { get; set; }

        public List<Venta> Ventas { get; set; }
        public List<Compra> Compras { get; set; }

    }
}
