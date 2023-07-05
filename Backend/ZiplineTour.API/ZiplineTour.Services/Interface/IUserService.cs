using System.Threading.Tasks;
using ZiplineTour.Models;

namespace ZiplineTour.Services.Interface
{
    public interface IUserService
    {
        Task<ResultArgs> Users();

        Task<ResultArgs> UserAsync(UserCredentialDTO user);

        Task<ResultArgs> Register(UserModel userModel);
    }
}