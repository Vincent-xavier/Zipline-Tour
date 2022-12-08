using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using ZiplineTour.Common;
using ZiplineTour.DBEngine;
using ZiplineTour.Models;

namespace ZiplineTour.Repository
{
    public interface IUserRepository
    {
        Task<List<UserModel>> Users();

        Task<UserModel> GetToken(string UserName, string Password);

        Task<int> Register(UserModel userModel);
    }

    public class UserRepository : IUserRepository
    {
        private readonly IServerHandler _serverHandler;
        public UserRepository(IServerHandler serverHandler)
        {
            _serverHandler = serverHandler;
        }

        public async Task<List<UserModel>> Users()
        {
            var listUsers = new List<UserModel>();

            try
            {
                listUsers = (await _serverHandler.QueryAsync<UserModel>(_serverHandler.Connection, StoredProc.User.Users, CommandType.StoredProcedure, null)).ToList();

            }
            catch (Exception ex)
            {

                ErrorLog log = new ErrorLog();
                log.SendErrorToText(ex);
            }
            return listUsers;
        }

        public async Task<UserModel> GetToken(string Email, string Password)
        {
            var param = new DynamicParameters();
            var user = new UserModel();
            try
            {
                param.Add("@email", Email, DbType.String, ParameterDirection.Input);
                param.Add("@pass", Password, DbType.String, ParameterDirection.Input);
                user = await _serverHandler.QueryFirstOrDefaultAsync<UserModel>(_serverHandler.Connection, StoredProc.User.UserLogin, CommandType.StoredProcedure, param);
            }
            catch (Exception ex)
            {

                ErrorLog log = new ErrorLog();
                log.SendErrorToText(ex);
            }
            return user;
        }


        public async Task<int> Register(UserModel userModel)
        {
            var param = new DynamicParameters();
            try
            {
                param.Add("@userName", userModel.Email, DbType.String, ParameterDirection.Input);
                param.Add("@password", userModel.Password, DbType.String, ParameterDirection.Input);
                param.Add("@returnVal", dbType: DbType.Int32, direction: ParameterDirection.Output);
                await _serverHandler.ExecuteAsync(_serverHandler.Connection, "usp_User_Register", CommandType.StoredProcedure, param);
            }
            catch (Exception ex)
            {
                ErrorLog log = new ErrorLog();
                log.SendErrorToText(ex);
            }
            return param.Get<int>("@returnVal");
        }
    }
}
