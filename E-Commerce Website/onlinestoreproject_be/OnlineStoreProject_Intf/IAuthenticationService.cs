using OnlineStoreProject.Response;
using OnlineStoreProject.Models;
using System.Threading.Tasks;
using OnlineStoreProject.Response.AuthenticationResponse;
using OnlineStoreProject.Request.UserLoginRequest;
using OnlineStoreProject.Request.UserRegisterRequest;
using OnlineStoreProject.Request.ChangePasswordRequest;

namespace OnlineStoreProject_Intf.IAuthenticationService
{
    public interface IAuthenticationService
    {
        Task<AuthenticationResponse<string>> Register(UserRegisterRequest request);
        Task<AuthenticationResponse<string>> Login(UserLoginRequest request);
        Task<bool> UserExists(string username);
        Task<AuthenticationResponse<string>> ChangePassword(ChangePasswordRequest request);
    }
}