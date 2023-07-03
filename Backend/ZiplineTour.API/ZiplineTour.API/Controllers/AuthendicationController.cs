using ZiplineTour.Common.Helper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using ZiplineTour.Common;
using ZiplineTour.DBEngine;
using ZiplineTour.Models;
using ZiplineTour.Repository;
using ZiplineTour.Services;

namespace ZiplineTour.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthendicationController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IUserRepository _userRepository;
        private readonly IUserService _userService;
        private readonly JWTSetting authentication;
        public AuthendicationController(IConfiguration configuration, IUserRepository userRepository, IUserService userService)
        {
            _userRepository = userRepository;
            _userService = userService;
            _configuration = configuration;

        }

       

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
                UserCredentialResult objResult = new UserCredentialResult();
                objResult = (UserCredentialResult)response.ResultData;

                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(
                        new Claim[]
                        {
                                new Claim(ClaimTypes.Name,objResult.objUserDetail.FirstName),
                                new Claim(ClaimTypes.Role,objResult.objUserDetail.UserRole)
                        }
                 ),
                    Expires = DateTime.Now.AddDays(1),
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key128), SecurityAlgorithms.HmacSha256)
                };
                var token = tokenhandler.CreateToken(tokenDescriptor);
                string finaltoken = tokenhandler.WriteToken(token);
                objResult.objUserDetail.Token = finaltoken;
                response.ResultData = objResult;

            }

            catch (Exception ex)
            {
                new ErrorLog().WriteLog(ex);
                return Unauthorized();

            }
            return Ok(Response);

        }




        //[HttpGet("userRights/{rollbaseId}")]

        //public async Task<IActionResult> GetUserRights(int rollbaseId)
        //{
        //    var user = await _userRepository.GetUserRights(rollbaseId);

        //    return Ok(user);
        //}

    }

}

