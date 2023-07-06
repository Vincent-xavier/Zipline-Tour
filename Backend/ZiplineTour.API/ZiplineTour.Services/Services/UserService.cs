using CHMS.Framework;
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
            UserCredentialResult objUserDetail = new UserCredentialResult();
            ResultArgs ResultArgs = new ResultArgs();
            objUserDetail = await _userRepository.userAsync(user);
            if (objUserDetail.StatusCode == 200 && objUserDetail.objUserDetail != null && !string.IsNullOrEmpty(objUserDetail.objUserDetail.Email))
            {
                ResultArgs.StatusCode = MessageCatalog.ErrorCodes.Success;
                ResultArgs.StatusMessage = MessageCatalog.ErrorMessages.Success;
                ResultArgs.ResultData = objUserDetail;
            }
            else
            {
                if (objUserDetail.StatusCode == -91)
                {
                    ResultArgs.StatusCode = MessageCatalog.ErrorCodes.NoRecordFound;
                    ResultArgs.StatusMessage = MessageCatalog.ErrorMessages.UserNameNotExists;
                }
                else if (objUserDetail.StatusCode == -92)
                {
                    ResultArgs.StatusCode = MessageCatalog.ErrorCodes.NoRecordFound;
                    ResultArgs.StatusMessage = MessageCatalog.ErrorMessages.PasswordIncorrect;
                }
                else
                {
                    ResultArgs.StatusCode = MessageCatalog.ErrorCodes.NoRecordFound;
                    ResultArgs.StatusMessage = MessageCatalog.ErrorMessages.UserNameNotExists;
                }
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