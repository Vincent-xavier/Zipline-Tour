using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ZiplineTour.Models
{

    public class UserCredentialResult
    {
        public UserModel? objUserDetail { get; set; }
        public List<UserRights>? objUserRight { get; set; }
        public int StatusCode { get; set; }
    }


    public class UserModel
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string? Token { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Password { get; set; }
        public int RollId { get; set; }
        public string UserRole { get; set; }
    }

    public class UserCredentialDTO
    {
        public string UserName { get; set; }
        public string Password { get; set; }

    }
    public class UserRights
    {
        public int RollId { get; set; }
        public string Roll { get; set; }
        public string MenuIcon { get; set; }
        public string MenuItem { get; set; }
    }
}
