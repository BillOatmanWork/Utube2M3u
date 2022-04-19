using System.Text;

namespace Utube2M3u
{
    class Utube2M3u
    {
        static void Main(string[] args)
        {
            Utube2M3u p = new Utube2M3u();
            p.RealMain(args);
        }

        private void RealMain(string[] args)
        {
            File.Delete("Utube2M3u.log");

            ConsoleWithLog("Utube2M3u version " + System.Reflection.Assembly.GetExecutingAssembly().GetName().Version);
            ConsoleWithLog("");

            if (args.Length != 2)
            {
                DisplayHelp();
                return;
            }

            string inFile = args[0];
            string outFile = args[1];

            ConsoleWithLog($"Input file: {inFile}   Output file: {outFile}");
            ConsoleWithLog("");

            StringBuilder m3uLines = new StringBuilder();
            string lineSave = string.Empty;

            try
            {
                foreach (string line in System.IO.File.ReadLines(inFile))
                {
                    string[] parts = line.Split('|');

                    if (parts.Length != 5)
                    {
                        ConsoleWithLog("Line format incorrect.");
                        ConsoleWithLog(line);
                        ConsoleWithLog("");

                        continue;
                    }

                    lineSave = line;

                    string content;
                    using (var client = new HttpClient())
                    {
                        content = client.GetStringAsync(parts[4]).Result;
                    }

                    m3uLines.Append("#EXTINF:-1");

                    if(!string.IsNullOrEmpty(parts[1]))
                        m3uLines.Append($" CUID=\"{parts[1]}\"");

                    m3uLines.Append(" tvg-id=\"\" tvg-name=\"\"");

                    if (!string.IsNullOrEmpty(parts[3]))
                        m3uLines.Append($" tvg-logo=\"{parts[3]}\"");

                    m3uLines.AppendLine($" group-title=\"{parts[2]}\",{parts[0]}");

                    string url = "http://dummylink.tv/NoVideo.m3u8";
                    int endIndex = content.IndexOf(".m3u8", 0);
                    if (endIndex > 0)
                    {
                        int startIndex = content.LastIndexOf("https://", endIndex);
                        url = content.SubstringFromXToY(startIndex, endIndex + 5);
                    }

                    m3uLines.AppendLine(url);
                }

                using (TextWriter tw = new StreamWriter(outFile, false))
                {
                    tw.WriteLine(m3uLines.ToString());
                }
            }
            catch (Exception ex)
            {
                ConsoleWithLog($"Exception: {ex.Message}.");
                ConsoleWithLog(lineSave);
                ConsoleWithLog("");
            }

            Console.WriteLine("Utube2M3u finished.");
        }

        public static void ConsoleWithLog(string text)
        {
            Console.WriteLine(text);

            using (StreamWriter file = File.AppendText("Utube2M3u.log"))
            {
                file.Write(text + Environment.NewLine);
            }
        }

        private void DisplayHelp()
        {
            Console.WriteLine("Utube2M3u input_file ourput_m3u_file");
            Console.WriteLine("\tinput file format: channel|CUID (optional)|group|logo  (optional)|url");
            Console.WriteLine("");
            Console.WriteLine("");

            Console.WriteLine("Hit enter to continue");
            Console.ReadLine();
        }
    }
}

