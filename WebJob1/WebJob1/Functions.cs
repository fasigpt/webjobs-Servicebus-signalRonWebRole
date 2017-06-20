using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using Microsoft.AspNet.SignalR.Client;
namespace WebJob1
{
    public class Functions
    {
        // This function will get triggered/executed when a new message is written 
        // on an Azure Queue called queue.
        //public static void ProcessQueueMessage([QueueTrigger("queue")] string message, TextWriter log)
        //{
        //    log.WriteLine(message);
        //}
        [NoAutomaticTrigger]
        public static async Task signalrtask(TextWriter log)
        {

            var hubConnection = new HubConnection("http://signalrservicewebrole.cloudapp.net/");
            hubConnection.TraceLevel = TraceLevels.All;
            hubConnection.TraceWriter = Console.Out;
            IHubProxy hubProxy = hubConnection.CreateHubProxy("ChatHub");

            hubProxy.On("Send", data =>
            {
                Console.WriteLine("Incoming data: {0} {1}", data.name, data.message);
              log.WriteLine("Incoming data: {0} {1}", data.name, data.message);
            });

            await hubConnection.Start();
        }
    }
}
