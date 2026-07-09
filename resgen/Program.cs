namespace WkcResGen
{
    internal class Program
    {
		/*
		 Font example:
         font "Source Han Sans SC" 00 04 20 2c 2e 9f ac d7 ff ff
         Images example:
         images <path/to/image_raw_directory> <path/to/image_output_directory>
         */
		static void Main(string[] args)
        {
            byte[] range = { 0x00, 0xFF };
            if (args.Length <= 2)
                return;
            else
            {
                if (args[0].ToLower() == "font")
                {
                    List<byte> rangeList = new List<byte>();
                    for (int i = 2; i < args.Length; i++)
                        try
                        {
                            rangeList.Add(Convert.ToByte(args[i], 16));
                        }
                        catch {; }
                    if (rangeList.Count > 0)
                    {
                        if (rangeList.Count % 2 == 1)
                            rangeList.Add(0xFF);
                        range = rangeList.ToArray();
                    }
                    Fonts.GenerateFontResource(args[1], range);
                }
                else if (args[0].ToLower().StartsWith("image"))
                {
                    if (args.Length < 3) return;
                    Images.GenerateImageResource(args[1], args[2]);
                }
            }
		}
    }
}
