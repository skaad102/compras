using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BDMiTienda.Models

{
    public class Proveedor
    {

        [Key]
        public int ProveedorId { get; set; }

        [Required]
        public string Nit { get; set; }
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Correo { get; set; }

        public List<Compra> Compras { get; set; }

    }
}
