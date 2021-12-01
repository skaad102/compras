using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BDMiTienda.Models

{
    public class User
    {
        [Key]
        public int UserId { get; set; }

        [Required]
        public string Identificador { get; set; }
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Apellido { get; set; }
        [Required]
        public string Correo { get; set; }
        [Required]
        public DateTime Fecha_nacimiento { get; set; }

        public List<Venta> Ventas { get; set; }

    }
}
