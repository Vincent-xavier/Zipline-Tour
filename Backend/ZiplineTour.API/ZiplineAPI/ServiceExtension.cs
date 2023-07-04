using ZiplineTour.DBEngine;
using ZiplineTour.Repository;
using ZiplineTour.Services;

namespace ZiplineTour.API
{
    public static class ServiceExtension
    {
        public static IServiceCollection AddServices(this IServiceCollection services, ConfigurationManager configuration)
        {
            services.AddTransient<ISQLServerHandler, SQLServerHandler>();
            services.AddTransient<IUserRepository, UserRepository>();
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<IEventService, EventService>();
            services.AddTransient<IEventRepository, EventRepository>();
            services.AddTransient<IBookingService, BookingService>();
            services.AddTransient<IBookingRepository, BookingRepository>();

            return services;
        }
    }
}