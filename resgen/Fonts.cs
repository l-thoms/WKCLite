using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

// "Noto Sans CJK SC" 00 04 20 2c 2e 9f ac d7 ff ff

namespace WkcResGen
{
	internal class Fonts
	{
		private const int FONT_HEIGHT = 18;

		private static void ClearPath(params string[] paths)
		{
			foreach (var path in paths)
			{
				if (File.Exists(path))
					File.Delete(path);
				else if (Directory.Exists(path))
					Directory.Delete(path, true);
				Directory.CreateDirectory(path);
			}
		}

		public static void GenerateFontResource(string fontFamily, byte[] range)
		{
			string path = AppDomain.CurrentDomain.BaseDirectory;
			Console.WriteLine(path);
			string pathGenerated = Path.Combine(path, "generated");
			ClearPath(pathGenerated);
			string pathPreview = Path.Combine(pathGenerated, "preview");
			Directory.CreateDirectory(pathPreview);
			int[] measureReport = new int[512];

			List<byte> resultPalUnited = new List<byte>();
			List<byte> resultNtscUnited = new List<byte>();
			byte[] sizeBytesUnited = new byte[256 * 256];
			byte[] sizeBytesNtscUnited = new byte[256 * 256];

			List<(byte from, byte to)> rangePairs = new List<(byte, byte)>();
			for (int i = 0; i < range.Length; i += 2)
			{
				rangePairs.Add((range[i], range[i + 1]));
			}
			foreach (var pair in rangePairs)
			{
				for(int page = pair.from; page < pair.to + 1; page++)
				{
					byte[] sizeBytes = new byte[256];
					byte[] sizeBytesNtsc = new byte[256];
					float[] heights = new float[256];
					// Count all glyph widths
					float ntscAspect = 20f / 24;
					using Bitmap measureBitmap = new Bitmap(1, 1);
					using Graphics measureGraphicsRaw = Graphics.FromImage(measureBitmap);

					using Font font = new Font(fontFamily, 12, GraphicsUnit.Pixel);

					using StringFormat stringFormat = StringFormat.GenericTypographic;
					using StringFormat spaceFormat = StringFormat.GenericDefault;
					for (int glyph = 0; glyph < 256; glyph++)
					{
						var curChar = Convert.ToChar(page * 256 + glyph).ToString();
						var sizeRaw = measureGraphicsRaw.MeasureString(curChar, font, new SizeF(256, 256), stringFormat);

						heights[glyph] = sizeRaw.Height;
						if (curChar == " ")
							sizeRaw = measureGraphicsRaw.MeasureString(curChar, font, new SizeF(256, 256), spaceFormat);

						sizeBytes[glyph] = Convert.ToByte(Math.Ceiling(sizeRaw.Width));
						sizeBytesNtsc[glyph] = Convert.ToByte(Math.Ceiling(sizeRaw.Width * ntscAspect));

						sizeBytesUnited[page * 256 + glyph] = Convert.ToByte(Math.Ceiling(sizeRaw.Width));
						sizeBytesNtscUnited[page * 256 + glyph] = Convert.ToByte(Math.Ceiling(sizeRaw.Width * ntscAspect));
					}
					//File.WriteAllBytes(Path.Combine(pathGenerated, $"{page.ToString("X2")}.size"), sizeBytes);
					//File.WriteAllBytes(Path.Combine(pathGenerated, $"{page.ToString("X2")}.ntsc.size"), sizeBytesNtsc);

					int totalWidthRaw = sizeBytes.Sum(source => source);
					int totalWidthNtsc = sizeBytesNtsc.Sum(source => source);
					Console.WriteLine($"{page.ToString("X2")} {totalWidthRaw} {totalWidthNtsc}");
					// Pal
					using Bitmap resultPal = new Bitmap(totalWidthRaw, FONT_HEIGHT, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
					using Graphics resultPalGraphics = Graphics.FromImage(resultPal);
					using Bitmap resultNtsc = new Bitmap(totalWidthNtsc, FONT_HEIGHT, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
					using Graphics resultNtscGraphics = Graphics.FromImage(resultNtsc);
					int sizeIndexRaw = 0;
					int sizeIndexNtsc = 0;
					for (int glyph = 0; glyph < 256; glyph++)
					{
						if (sizeBytes[glyph] != 0 && sizeBytesNtsc[glyph] != 0)
						{
							using Bitmap resultPerGlyphPal = new Bitmap(sizeBytes[glyph], FONT_HEIGHT);
							using Graphics graphicsPerGlyphPal = Graphics.FromImage(resultPerGlyphPal);
							using Bitmap resultPerGlyphNtsc = new Bitmap(sizeBytesNtsc[glyph], FONT_HEIGHT);
							using Graphics graphicsPerGlyphNtsc = Graphics.FromImage(resultPerGlyphNtsc);

							graphicsPerGlyphPal.Clear(Color.White);
							graphicsPerGlyphPal.TextRenderingHint = System.Drawing.Text.TextRenderingHint.SingleBitPerPixelGridFit;
							graphicsPerGlyphNtsc.Clear(Color.White);
							graphicsPerGlyphNtsc.TextRenderingHint = System.Drawing.Text.TextRenderingHint.SingleBitPerPixelGridFit;

							string curChar = Convert.ToChar(page * 256 + glyph).ToString();
							graphicsPerGlyphNtsc.ScaleTransform(ntscAspect, ntscAspect);

							graphicsPerGlyphPal.DrawString(curChar, font, Brushes.Black, new PointF(0, (FONT_HEIGHT - heights[glyph]) / 2), stringFormat);
							graphicsPerGlyphNtsc.DrawString(curChar, font, Brushes.Black, new PointF(0, (FONT_HEIGHT / ntscAspect - heights[glyph]) / 2), stringFormat);

							resultPalGraphics.DrawImage(resultPerGlyphPal, new Point(sizeIndexRaw, 0));
							resultNtscGraphics.DrawImage(resultPerGlyphNtsc, new Point(sizeIndexNtsc, 0));
						}
						sizeIndexRaw += sizeBytes[glyph];
						sizeIndexNtsc += sizeBytesNtsc[glyph];
					}

					resultPal.Save(Path.Combine(pathPreview, $"{page.ToString("X2")}.pal.png"));
					resultNtsc.Save(Path.Combine(pathPreview, $"{page.ToString("X2")}.ntsc.png"));

					byte[] resultPalBytes = Images.GetImageBytes(resultPal);
					byte[] resultNtscBytes = Images.GetImageBytes(resultNtsc);

					resultPalUnited.AddRange(resultPalBytes);
					resultNtscUnited.AddRange(resultNtscBytes);

					//File.WriteAllBytes(Path.Combine(pathGenerated, $"{page.ToString("X2")}.pal.bin"), resultPalBytes);
					//File.WriteAllBytes(Path.Combine(pathGenerated, $"{page.ToString("X2")}.ntsc.bin"), resultNtscBytes);
					measureReport[page * 2] = resultPalBytes.Length;
					measureReport[page * 2 + 1] = resultNtscBytes.Length;
				};
			}
			File.WriteAllBytes(Path.Combine(pathGenerated, "pal.size"), sizeBytesUnited);
			File.WriteAllBytes(Path.Combine(pathGenerated, "ntsc.size"), sizeBytesNtscUnited);
			File.WriteAllBytes(Path.Combine(pathGenerated, "pal.bin"), resultPalUnited.ToArray());
			File.WriteAllBytes(Path.Combine(pathGenerated, "ntsc.bin"), resultNtscUnited.ToArray());

			byte[] measureReportBytes = new byte[measureReport.Length * 4];
			Buffer.BlockCopy(measureReport, 0, measureReportBytes, 0, measureReportBytes.Length);
			//File.WriteAllBytes(Path.Combine(pathGenerated, "measure_report.bin"), measureReportBytes);
		}
	}
}
