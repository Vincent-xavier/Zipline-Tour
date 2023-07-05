using System.Threading.Tasks;
using ZiplineTour.Models;
using ZiplineTour.Repository.Interfaces;
using ZiplineTour.Services.Interface;

namespace ZiplineTour.Services.Services
{
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

        public async Task<ResultArgs> UserAsync(UserCredentialDTO user)
        {
            ResultArgs ResultArgs = new ResultArgs();
            var userResponse = await _userRepository.userAsync(user);
            if (userResponse != null)
            {
                ResultArgs.StatusCode = 200;
                ResultArgs.StatusMessage = "Login Success";
                ResultArgs.ResultData = userResponse;
            }
            else
            {
                ResultArgs.StatusCode = 201;
                ResultArgs.StatusMessage = "Login Faild";
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