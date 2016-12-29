using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{

    public class XML
    {
        public FileInfo XmlFile { get; set; }
        public FileInfo XsdSchemaFile { get; set; }
        XmlSerializer Serializer { get; set; }

        public XML(string xmlFile, string xsdFile)
        {
            XmlFile = new FileInfo(xmlFile);
            XsdSchemaFile = new FileInfo(xsdFile);
            Serializer = new XmlSerializer(typeof(Ksiegarnia));
        }

        public Ksiegarnia Deserialize()
        {
            Ksiegarnia result = null;
            if (XmlFile.Exists)
            {
                using (TextReader textReader = new StreamReader(XmlFile.FullName))
                {
                    result = (Ksiegarnia)Serializer.Deserialize(textReader);
                    textReader.Close();
                }
            }
            else
            {
                throw new IOException();
            }

            return result;
        }
    }
}
