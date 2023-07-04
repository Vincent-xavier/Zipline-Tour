using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ZiplineTour.Services;

namespace ZiplineTour.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "User")]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly IConfiguration _configuration;

        public UserController(IConfiguration configuration, IUserService userService)
        {
            _userService = userService;
            _configuration = configuration;
        }

        #region Sample DPConnect

        //[HttpGet]
        //[Route("test")]
        //[ActionName("test")]
        //public string GetUser()
        //{
        //    MySqlConnection conn = new MySqlConnection("Server=192.168.1.7;Port=3306;Database=zipline;Uid=sjc;Pwd=admin@sjc;");

        //    MySqlDataAdapter da = new MySqlDataAdapter("SELECT * FROM tbl_user LIMIT 10;", conn);

        //    da.SelectCommand.CommandType = CommandType.Text;

        //    DataTable dt = new DataTable();

        //    da.Fill(dt);

        //    if (dt.Rows.Count > 0)
        //    {
        //        return JsonConvert.SerializeObject(dt);
        //    }
        //    else
        //    {
        //        return "no data found";
        //    }

        //}

        #endregion Sample DPConnect

        [HttpGet]
        public async Task<ActionResult> Users()
        {
            return Ok(await _userService.Users());
        }
    }
}