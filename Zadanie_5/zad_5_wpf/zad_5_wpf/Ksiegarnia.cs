using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    public class Ksiegarnia
    {
        [XmlElement("metadane", Namespace = "http://www.example.org/typyNasze")]
        public Metadane metadane { get; set; }
    }
}
