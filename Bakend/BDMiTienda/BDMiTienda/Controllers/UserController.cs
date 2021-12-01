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
    public class UserController : ControllerBase
    {
        private readonly AppDbContext _cotext;
        public UserController(AppDbContext context)
        {
            _cotext = context;
        }
        // GET: api/<UserController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var listUser = await _cotext.User.ToListAsync();
                return Ok(listUser);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // GET api/<UserController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<UserController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] User user)
        {
            try
            {

                _cotext.Add(user);
                await _cotext.SaveChangesAsync();
                return Ok(user);
            }
            catch (Exception ex)
            {   
                return BadRequest(ex.Message);
            }
        }

        // PUT api/<UserController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] User user)
        {
            try
            {
                if(id != user.UserId) return NotFound();

                _cotext.Update(user);
                await _cotext.SaveChangesAsync();
                return Ok("Cambios Realizados");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE api/<UserController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                var idUser = await _cotext.User.FindAsync(id);
                if (idUser == null) return NotFound();

                _cotext.User.Remove(idUser);
                await _cotext.SaveChangesAsync();
                return Ok(new { message = "Usuario eliminado 😁"});
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
