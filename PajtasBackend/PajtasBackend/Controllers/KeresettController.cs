using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PajtasBackend.Models;

namespace PajtasBackend.Controllers
{

    [Route("api/user/keresett")]
    [Authorize]
    [ApiController]
    public class KeresettController : ControllerBase
    {
        TarskeresoEContext _context;

        public KeresettController(TarskeresoEContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult GetSajatKeresett()
        {
            try
            {
                var res = _context.Keres.FromSqlInterpolated($"");
                return Ok(res);
            }
            catch (Exception)
            {

                return StatusCode(400, "UNKNOWN_ERROR");
            }
        }
    }
}
