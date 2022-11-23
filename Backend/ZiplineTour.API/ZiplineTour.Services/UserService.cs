using System;
using System.Threading.Tasks;
using ZiplineTour.Models;
using ZiplineTour.Repository;

namespace ZiplineTour.Services
{
    public interface IUserService
    {
        Task<ResultArgs> Users();
        Task<ResultArgs> Register(UserModel userModel);
    }
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;

        public UserService(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }
        public async Task<ResultArgs> Users()
        {
            var ResultArgs = new ResultArgs();
            var user = await _userRepository.Users();


            if (user != null)
            {
                ResultArgs.StatusCode = 200;
                ResultArgs.StatusMessage = "Record is success";
                ResultArgs.ResultData = user;
            }
            else
            {
                ResultArgs.StatusCode = 205;
                ResultArgs.StatusMessage = "Something Went Wroung";
            }
            return ResultArgs;
        }

        public async Task<ResultArgs> Register(UserModel userModel)
        {
            var ResultArgs = new ResultArgs();
            var user = await _userRepository.Register(userModel);


            if (user != 0)
            {
                ResultArgs.StatusCode = 200;
                ResultArgs.StatusMessage = "saved";
                ResultArgs.ResultData = user;
            }
            else
            {
                ResultArgs.StatusCode = 205;
                ResultArgs.StatusMessage = "Something Went Wroung";
            }
            return ResultArgs;
        }
    }
}
