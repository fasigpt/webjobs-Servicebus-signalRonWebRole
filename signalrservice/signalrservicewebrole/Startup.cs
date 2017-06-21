using Microsoft.AspNet.SignalR;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(signalrservicewebrole.Startup))]
namespace signalrservicewebrole
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            //  ConfigureAuth(app);
            string connectionString = "your Servicebus connection string"
            GlobalHost.DependencyResolver.UseServiceBus(connectionString, "signalrservicewebrole");

            app.MapSignalR();
        }
    }
}
