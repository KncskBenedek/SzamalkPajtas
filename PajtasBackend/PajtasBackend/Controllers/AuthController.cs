using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using PajtasBackend.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace PajtasBackend.Controllers
{
    [EnableCors]
    [Route("api/auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        TarskeresoEContext _context;
        IConfiguration _configuration;

        public AuthController(TarskeresoEContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }


        [HttpPost("reg")]
        public IActionResult Registration([FromBody] UserDto user)
        {
            try
            {
                var newUser = _context.Felhasznalos.FromSqlInterpolated($"reg {user.UserName},{user.Email},{CreateMD5(user.Password)}").ToArray();
                Console.WriteLine("token kezd");
                var token = CreateToken(newUser[0]);
                Console.WriteLine("token vég");

                return Ok(token);
            }
            catch (Exception)
            {

                return StatusCode(400, "VALAMI_HIBA");
            }
        }

        [HttpPost("bej")]
        public IActionResult Login([FromBody] UserDto user)
        {
            try
            {
                var res = _context.Felhasznalos.Where(u => u.Nev == user.UserName || u.Jelszo == CreateMD5(user.Password)).ToArray();
                if (res.Length == 1)
                {
                    return Ok(CreateToken(res[0]));
                }
                else
                {
                    return StatusCode(401, "INVALID_LOGIN");
                }
            }
            catch (Exception)
            {

                return StatusCode(500, "UNKNOWN_ERROR");
            }
        }


        private object CreateToken(Felhasznalo user)
        {
            Console.WriteLine(user);
            Console.WriteLine(user.FhAzon);
            Console.WriteLine(user.Nev);

            List<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, "" + user.FhAzon),
                new Claim(ClaimTypes.Name, user.Nev)
            };
            var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(
                _configuration.GetSection("AppSettings:Token").Value));

            var cred = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);
            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.Now.AddDays(0.04166667),
                signingCredentials: cred
                );
            var jwt = new JwtSecurityTokenHandler().WriteToken(token);
            return jwt;
        }

        public static string CreateMD5(string input)
        {
            using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
            {
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                return Convert.ToHexString(hashBytes);
            }
        }
    }
}

public class UserDto
{
    public string UserName { get; set; }
    public string? Email { get; set; }
    public string Password { get; set; }
}