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

namespace ZiplineTour.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthendicationController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IUserRepository _userRepository;
        private readonly JWTSetting authentication;
        public AuthendicationController(IConfiguration configuration, IUserRepository userRepository, IServerHandler serverHandler)
        {
            _userRepository = userRepository;
            _configuration = configuration;

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userModel"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("gettoken")]
        public async Task<IActionResult> GetToken(UserModel userModel)
        {
            if (userModel != null && userModel.Email != null && userModel.Password != null)
            {
                var response = new ResultArgs();

                response = await _userRepository.GetToken(userModel.Email, userModel.Password);
                if (response.ResultData == null || response.StatusCode != 200)
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
                objUserDetail = (UserCredentialResult)Response.ResultData;
                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(
                        new Claim[]
                        {
                        new Claim(ClaimTypes.Name,objUserDetail?.objUserDetail?.Name),
                        new Claim(ClaimTypes.Role,objUserDetail?.objUserDetail?.PrimaryRoleID.ToString())
                        }
                    ),
                    Expires = DateTime.Now.AddDays(1),
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key128), SecurityAlgorithms.HmacSha256)
                };
                var token = tokenhandler.CreateToken(tokenDescriptor);
                string finaltoken = tokenhandler.WriteToken(token);
                objUserDetail.objUserDetail.Token = finaltoken;
                Response.ResultData = objUserDetail;
            }
			catch (Exception ex)
			{
                new ErrorLog().WriteLog(ex);
                return Unauthorized();
            }
            return Ok(Response);
        }
















        //    if (response != null)
        //    {

        //        //create claims details based on the user information
        //        var claims = new[] {
        //        new Claim(JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
        //        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
        //        new Claim(JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),
        //        new Claim("FirstName",user.FirstName),
        //        new Claim("RoleId", user.RollId.ToString()),
        //        new Claim("LastName",user.LastName),
        //        new Claim("Email",user.Email),
        //        new Claim("Phone",user.Phone),
        //        new Claim("role",user.UserRole),
        //       };

        //        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));

        //        var signIn = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        //        var token = new JwtSecurityToken(_configuration["Jwt:Issuer"], _configuration["Jwt:Audience"], claims, expires: DateTime.UtcNow.AddDays(1), signingCredentials: signIn);
        //        var data = new JwtSecurityTokenHandler().WriteToken(token);

        //        return StatusCode(StatusCodes.Status200OK, new { Message = "Login Success", Userdata = data });
        //    }
        //    else
        //    {
        //        return StatusCode(StatusCodes.Status404NotFound, new { Message = "Invalid credentials" });
        //    }
        //}
        //else
        //{
        //    return BadRequest();

        //}

    }

    [HttpGet("userRights/{rollbaseId}")]

    public async Task<IActionResult> GetUserRights(int rollbaseId)
    {
        var user = await _userRepository.GetUserRights(rollbaseId);

        return Ok(user);
    }

}
}
