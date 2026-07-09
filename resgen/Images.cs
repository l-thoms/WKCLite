using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WkcResGen
{
	internal class Images
	{
		public static byte[] GetImageBytes(Bitmap source)
		{
			byte[] result = new byte[Convert.ToInt32(Math.Ceiling(source.Width * source.Height / 8d))];
			var bitmapData = source.LockBits(new Rectangle(0, 0, source.Width, source.Height), System.Drawing.Imaging.ImageLockMode.ReadOnly, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
			int[] resultRaw = new int[source.Width * source.Height * 4];
			unsafe
			{
				fixed (void* resultVoid = resultRaw)
				{
					Buffer.MemoryCopy(bitmapData.Scan0.ToPointer(), resultVoid, resultRaw.Length, resultRaw.Length);
				}
			}
			for (int byteIndex = 0; byteIndex < Math.Ceiling(source.Width * source.Height / 8d); byteIndex++)
			{
				byte byteVal = 0;
				for (int bit = 0; bit < 8; bit++)
				{
					int pixelIndex = byteIndex * 8 + bit;
					if (pixelIndex >= source.Width * source.Height) break;
					Color currentColor = Color.FromArgb(resultRaw[pixelIndex]);
					if (currentColor.GetBrightness() < 0.5)
						byteVal |= (byte)(1 << bit);
				}
				result[byteIndex] = byteVal;
			}
			return result;
		}

		public static void GenerateImageResource(string source, string destination)
		{
			if (!Directory.Exists(source)) return;
			if (!Directory.Exists(destination)) Directory.CreateDirectory(destination);
			var directoryInfo = new DirectoryInfo(source);
			var files = directoryInfo.GetFiles();
			foreach(var file in files)
			{
				if (new string[] { ".png", ".bmp", ".jpg", ".gif", ".jpeg" }.ToList().IndexOf(file.Extension.ToLower()) == -1) continue;
				Bitmap? bitmap;
				try
				{
					var image = Image.FromFile(file.FullName);
					if (image is null) continue;
					bitmap = image as Bitmap;
					if (bitmap is null)
					{
						image.Dispose();
						continue;
					}
				}
				catch{ continue; }
				if(bitmap.PixelFormat != System.Drawing.Imaging.PixelFormat.Format32bppArgb)
				{
					Bitmap convertedBitmap = new Bitmap(bitmap.Width, bitmap.Height);
					using Graphics convertedGraphics = Graphics.FromImage(convertedBitmap);
					convertedGraphics.DrawImage(bitmap, 0, 0, bitmap.Width, bitmap.Height);
					bitmap.Dispose();
					bitmap = convertedBitmap;
				}
				var imageBytes = GetImageBytes(bitmap);
				string savedName = Path.Combine(destination, $"{file.Name.Substring(0, file.Name.Length - file.Extension.Length)}.bin");
				System.IO.File.WriteAllBytes(savedName, imageBytes);

				bitmap.Dispose();
			}
		}
	}
}
