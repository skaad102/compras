using BDMiTienda.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BDMiTienda.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProveedorController : ControllerBase
    {

        private readonly AppDbContext _cotext;


        public ProveedorController(AppDbContext context)
        {
            _cotext = context;
        }
        // GET: api/<ProveedorController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var listProveedores = await _cotext.Proveedor.ToListAsync();
                return Ok(listProveedores); ;
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // GET api/<ProveedorController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ProveedorController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Proveedor proveedor)
        {
            try
            {
                _cotext.Add(proveedor);
                await _cotext.SaveChangesAsync();
                return Ok(proveedor);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }

        }

        // PUT api/<ProveedorController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Proveedor proveedor)
        {
            try
            {
                if (id != proveedor.ProveedorId) return NotFound();
                _cotext.Update(proveedor);
                await _cotext.SaveChangesAsync();
                return Ok("Cambios Realizados");

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE api/<ProveedorController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                var idProveedor = await _cotext.Proveedor.FindAsync(id);
                if (idProveedor != null) return NotFound();

                _cotext.Remove(id);
                await _cotext.SaveChangesAsync();
                return Ok(new { message = "Usuario eliminado 😁" });
            }
            catch (Exception ex) 
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
