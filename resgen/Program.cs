namespace WkcResGen
{
    internal class Program
    {
        /*
		 Font example:
         font <font_name> 00 04 20 2c 2e 9f ac d7 ff ff
         Images example:
         images <path/to/image_raw_directory> <path/to/image_output_directory>
         Translations example:
         translations <path/to/translations.json> <path/to/result.bin>
         */
        static void Main(string[] args)
        {
            byte[] range = { 0x00, 0xFF };
            if (args[0].ToLower() == "font")
            {
                if (args.Length < 2) return;
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
            else if (args[0].ToLower() == "images")
            {
                if (args.Length < 3) return;
                Images.GenerateImageResource(args[1], args[2]);
            }
            else if (args[0].ToLower() == "translations")
            {
                if (args.Length < 2) return;
				Translations.GenerateTranslationsResource(args[1], args.Length < 3 ? null : args[2]);
            }

        }
    }
}
