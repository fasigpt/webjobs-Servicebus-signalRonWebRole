using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNet.SignalR.Client;
namespace client
{
    class Program
    {
        static void Main(string[] args)
        {
            MainAsync().Wait();
            Console.ReadLine();
        }

        static async Task MainAsync()
        {
            try
            {

                var hubConnection = new HubConnection("http://signalrservicewebrole.cloudapp.net/");
                hubConnection.TraceLevel = TraceLevels.All;
                hubConnection.TraceWriter = Console.Out;
                IHubProxy hubProxy = hubConnection.CreateHubProxy("ChatHub");

            

                hubProxy.On("Send", data =>
                {
                    Console.WriteLine("Incoming data: {0} {1}", data.name, data.message);
                });
               
                await hubConnection.Start();

               

            }
            catch (Exception ex)
            {

            }
        }
    }
}
