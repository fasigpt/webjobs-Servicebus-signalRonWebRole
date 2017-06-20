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
            string connectionString = "Endpoint=sb://signalrservicebus2.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=O9lsMfuJTAUrBEQAI2I0fQzGsn5oP7NJBKEW6eV454I=";
            GlobalHost.DependencyResolver.UseServiceBus(connectionString, "signalrservicewebrole");

            app.MapSignalR();
        }
    }
}
