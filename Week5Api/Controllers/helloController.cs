using Microsoft.AspNetCore.Mvc;

namespace Week5Api.Controllers;

[ApiController]
[Route("[controller]")]
public class HelloController : ControllerBase
{
    [HttpGet("/hello")]
    public string Get()
    {
        return "Your API has been updated through CI and CD";
    }
}