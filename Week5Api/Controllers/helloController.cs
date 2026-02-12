using Microsoft.AspNetCore.Mvc;

namespace Week5Api.Controllers;

[ApiController]
[Route("[controller]")]
public class HelloController : ControllerBase
{
    [HttpGet("/hello")]
    public string Get()
    {
        return "Hello from your Azure API running .NET 10";
    }
}