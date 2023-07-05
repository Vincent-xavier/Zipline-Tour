using System.Collections.Generic;
using System.Threading.Tasks;
using ZiplineTour.Models;

namespace ZiplineTour.Repository.Interfaces
{
    public interface IUserRepository
    {
        Task<List<UserModel>> Users();

        Task<UserModel> userAsync(UserCredentialDTO user);

        Task<int> Register(UserModel userModel);

        Task<List<UserRights>> GetUserRights(int rollbaseId);
    }
}