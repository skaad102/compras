using BDMiTienda.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BDMiTienda.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompraController : ControllerBase
    {

        private readonly AppDbContext _cotext;
        public CompraController(AppDbContext context)
        {
            _cotext = context;
        }
        // GET: api/<CompraController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<CompraController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<CompraController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Compra compra)
        {
            try
            {
                /* var nitProveedor = await _cotext.Proveedor.FindAsync(compra.ProveedorId);
                 var skuProducto = await _cotext.Proveedor.FindAsync(compra.ProductoId);
                 var idProducto = await _cotext.Producto.FindAsync(skuProducto);
                 var idProveedor = await _cotext.Proveedor.FindAsync(nitProveedor);*/

                //busqueda sku e id

                var idP = (from p in _cotext.Proveedor
                           where p.Nit == compra.ProveedorId.ToString()
                           select p.ProveedorId);


                var idPr = (from p in _cotext.Producto
                            where p.SKU == compra.ProductoId
                            select p.ProdurctoId);

                var idProv = idP.ToList();
                var idProd = idPr.ToList();


                var idProducto = await _cotext.Producto.FindAsync(idProd[0]);
                var idProveedor = await _cotext.Proveedor.FindAsync(idProv[0]);


                if ( idProveedor == null) return NotFound();


                //es nuevo el producto
                if (idProducto == null )
                {


                    return Ok("Compra realizada");

                }
                else
                {
                    //ya Existe

                    compra.ProductoId = idProd[0];
                    compra.ProveedorId = idProv[0];
                    compra.FechaCompra = DateTime.Now;
                    _cotext.Add(compra);

                    //actualizar inventario 

                    var qPr = from p in _cotext.Producto
                              where p.ProdurctoId == idProd[0]
                              select p;

                    var listProduc = qPr.ToList();


                    Producto producto = listProduc.FirstOrDefault();
                    producto.Stock = producto.Stock + compra.Cantidad;



                    _cotext.Update(producto);
                    await _cotext.SaveChangesAsync();
                    return Ok("Compra realizada");
                }


                
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // PUT api/<CompraController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<CompraController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
