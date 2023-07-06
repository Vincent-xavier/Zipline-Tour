using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using ZiplineTour.FrameWork.Helper;
using ZiplineTour.Models;
using ZiplineTour.Services.Interface;

namespace ZiplineTour.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class AuthendicationController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IUserService _userService;
        private readonly JWTSetting authentication;

        public AuthendicationController(IConfiguration configuration, IUserService userService, IOptions<JWTSetting> options)
        {
            _userService = userService;
            _configuration = configuration;
            authentication = options.Value;
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("UserAsync")]
        public async Task<IActionResult> UserAsync([FromBody] UserCredentialDTO user)
        {
            ResultArgs response = new ResultArgs();

            try
            {
                response = await _userService.UserAsync(user);
                if (response == null || response.StatusCode != 200)
                    return Ok(response);

                var tokenhandler = new JwtSecurityTokenHandler();
                var tokenkey = Encoding.UTF8.GetBytes(authentication.SecurityKey);
                byte[] hashBytes;
                using (var sha256 = SHA256.Create())
                {
                    hashBytes = sha256.ComputeHash(tokenkey);
                }
                byte[] key128 = new byte[16];
                Array.Copy(hashBytes, key128, 16);
                UserCredentialResult objUserDetail = new UserCredentialResult();
                objUserDetail = (UserCredentialResult)response.ResultData;

                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(
                        new Claim[]
                        {
                                new Claim(ClaimTypes.Name,"test"),
                                new Claim(ClaimTypes.Role,"testest")
                        }
                 ),
                    Expires = DateTime.Now.AddDays(1),
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(tokenkey), SecurityAlgorithms.HmacSha256)
                };
                var token = tokenhandler.CreateToken(tokenDescriptor);
                string finaltoken = tokenhandler.WriteToken(token);
                objUserDetail.objUserDetail.Token = finaltoken;
                response.ResultData = objUserDetail;
            }
            catch (Exception ex)
            {
                new ErrorLog().WriteLog(ex);
                return Unauthorized();
            }
            return Ok(response);
        }

        //[HttpGet("userRights/{rollbaseId}")]

        //public async Task<IActionResult> GetUserRights(int rollbaseId)
        //{
        //    var user = await _userRepository.GetUserRights(rollbaseId);

        //    return Ok(user);
        //}
    }
}