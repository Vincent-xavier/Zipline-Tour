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
            
            return (await _serverHandler.QueryAsync<UserModel>(_serverHandler.Connection, StoredProc.Users, CommandType.StoredProcedure, null)).ToList();
        }

        public async Task<UserModel> GetToken(string Email, string Password)
        {
            var param = new DynamicParameters();
            param.Add("@email", Email, DbType.String, ParameterDirection.Input);
            param.Add("@pass", Password, DbType.String, ParameterDirection.Input);
            return (await _serverHandler.QueryFirstOrDefaultAsync<UserModel>(_serverHandler.Connection, StoredProc.UserLogin, CommandType.StoredProcedure, param));
        }

        public async Task<int> Register(UserModel userModel)
        {
            //string query = "INSERT INTO tbl_user(UserName,Password) VALUES(" + userModel.UserName + userModel.Password + ")";


            //string query1 = "INSERT INTO tbl_user(UserName,Password) VALUES(" + "''" + userModel.UserName + "''" + userModel.Password + ")";


            //string query2 = "INSERT INTO tbl_user(UserName,Password) VALUES('"+ userModel.UserName + "','" + userModel.Password + "')";


            var param = new DynamicParameters();
            param.Add("@userName", userModel.Email, DbType.String, ParameterDirection.Input);
            param.Add("@password", userModel.Password, DbType.String, ParameterDirection.Input);
            param.Add("@returnVal", dbType: DbType.Int32, direction: ParameterDirection.Output);

            //var dictionary = new Dictionary<string, object>
            //{
            //     { "@userName", userModel.UserName },
            //     { "@password", userModel.Password }
            //};
            //var param = new DynamicParameters(dictionary);


            await _serverHandler.ExecuteAsync(_serverHandler.Connection, "usp_User_Register", CommandType.StoredProcedure, param);


            return param.Get<int>("@returnVal");

        }
    }
}
