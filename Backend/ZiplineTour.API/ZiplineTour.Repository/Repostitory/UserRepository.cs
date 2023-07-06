using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using ZiplineTour.DBEngine;
using ZiplineTour.Framework;
using ZiplineTour.FrameWork;
using ZiplineTour.FrameWork.Helper;
using ZiplineTour.Models;
using ZiplineTour.Repository.Interfaces;

namespace ZiplineTour.Repository.Repostitory
{
    public class UserRepository : IUserRepository
    {
        private readonly ISQLServerHandler _serverHandler;

        public UserRepository(ISQLServerHandler serverHandler)
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
                new ErrorLog().WriteLog(ex);
            }
            return listUsers;
        }

        public async Task<UserCredentialResult> userAsync(UserCredentialDTO user)
        {
            var param = new DynamicParameters();
            UserCredentialResult credentialResult = new UserCredentialResult();
            try
            {
                param.Add("@P_email", user.UserName, DbType.String, ParameterDirection.Input);
                param.Add("@P_pass", user.Password, DbType.String, ParameterDirection.Input);
                var multipleResults = await _serverHandler.QueryMultipleAsync(_serverHandler.Connection, StoredProc.User.UserLogin, CommandType.StoredProcedure, param);
                if (multipleResults != null)
                {
                    credentialResult.StatusCode = await multipleResults.ReadSingleOrDefaultAsync<Int16>();
                    if (credentialResult.StatusCode == 200)
                    {
                        credentialResult.objUserDetail = await multipleResults.ReadSingleOrDefaultAsync<UserModel>();
                    }
                }
            }
            catch (Exception ex)
            {
                new ErrorLog().WriteLog(ex);
            }
            return credentialResult;
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
                new ErrorLog().WriteLog(ex);
            }
            return param.Get<int>("@returnVal");
        }

        public async Task<List<UserRights>> GetUserRights(int rollbaseId)
        {
            var param = new DynamicParameters();
            var result = new List<UserRights>();
            try
            {
                param.Add("@P_RollId", rollbaseId, DbType.Int16, ParameterDirection.Input);
                result = (await _serverHandler.QueryAsync<UserRights>(_serverHandler.Connection, StoredProc.User.UserRights, CommandType.StoredProcedure, param)).ToList(); ;
            }
            catch (Exception ex)
            {
                new ErrorLog().WriteLog(ex);
            }
            return result;
        }
    }
}