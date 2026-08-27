using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.Json;
using System.IO;
using System.Text.Json.Nodes;
using System.ComponentModel;

namespace WkcResGen
{
	internal class Translations
	{
		public static void GenerateTranslationsResource(string source, string? destination)
		{
			string? sourceDirectory = Path.GetDirectoryName(source);
			if (sourceDirectory == null)
				throw new ArgumentNullException("sourceDirectory is null");
			if (destination == null)
				destination = Path.Combine(sourceDirectory, Path.GetFileNameWithoutExtension(source)) + ".bin";

			JsonNode? translationsDocument = JsonNode.Parse(File.ReadAllText(source));
			if (translationsDocument == null) throw new NullReferenceException("translationsDocument is null");
			if (translationsDocument.GetValueKind() != JsonValueKind.Object)
				throw new JsonException("ValueKind not match");
			JsonObject translationsObject = translationsDocument.AsObject();

			List<int> indexList = new List<int>();
			List<byte> contentList = new List<byte>();

			int item_count = translationsObject.Count;
			JsonNode? languageList = translationsObject["language_list"];
			if (languageList == null) throw new NullReferenceException("languageList is null");
			JsonArray languageListArray = languageList.AsArray();
			indexList.Add(languageListArray.Count);

			indexList.AddRange(Enumerable.Repeat(-1, item_count));

			int indexPosition = 1;
			foreach(var content in translationsObject)
			{
				if (content.Value == null || content.Value.GetValueKind() != JsonValueKind.Object)
					continue;
				indexList[indexPosition] = contentList.Count + indexList.Count * 4;
				contentList.AddRange(Encoding.UTF8.GetBytes(content.Key));
				contentList.Add(0);
				for (int languageIndex = 0; languageIndex < languageListArray.Count; languageIndex++)
				{
					string selectedString = content.Key;
					foreach (var subContent in content.Value.AsObject())
					{
						JsonNode? languageNode = languageListArray[languageIndex];
						JsonNode? subContentValue = subContent.Value;
						if (languageNode == null || subContentValue == null) continue;
						string languageName = languageNode.GetValue<string>();
						string languageValue = subContentValue.GetValue<string>();
						if (subContent.Key == languageName && languageValue != null)
							selectedString = languageValue;
					}
					contentList.AddRange(Encoding.UTF8.GetBytes(selectedString));
					contentList.Add(0);
				}
				indexPosition += 1;
			}

			byte[] indexBytes = new byte[indexList.Count * 4];
			Buffer.BlockCopy(indexList.ToArray(), 0, indexBytes, 0, indexList.Count * 4);
			List<byte> resultList = indexBytes.ToList();
			resultList.AddRange(contentList);
			File.WriteAllBytes(destination, resultList.ToArray());
		}
	}
}
