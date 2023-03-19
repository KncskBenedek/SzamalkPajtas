using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PajtasBackend.Controllers
{

    [Route("api/user/keresett")]
    [Authorize]
    [ApiController]
    public class KeresettController : ControllerBase
    {
    }
}
