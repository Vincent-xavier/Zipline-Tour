using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using ZiplineTour.Common.Helper;
using ZiplineTour.Models;
using ZiplineTour.Repository;
using ZiplineTour.Services;

namespace ZiplineTour.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class AuthendicationController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IUserRepository _userRepository;
        private readonly IUserService _userService;
        private readonly JWTSetting authentication;

        public AuthendicationController(IConfiguration configuration, IUserRepository userRepository, IUserService userService, IOptions<JWTSetting> options)
        {
            _userRepository = userRepository;
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
                //byte[] hashBytes;
                //using (var sha256 = SHA256.Create())
                //{
                //    hashBytes = sha256.ComputeHash(tokenkey);
                //}
                //byte[] key128 = new byte[16];
                //Array.Copy(hashBytes, key128, 16);
                UserModel objResult = new UserModel();
                objResult = (UserModel)response.ResultData;

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
                objResult.Token = finaltoken;
                response.ResultData = objResult;
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