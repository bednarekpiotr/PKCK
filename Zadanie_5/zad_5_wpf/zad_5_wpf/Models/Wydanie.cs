using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    [XmlRoot("wydanie", Namespace = "http://www.example.org/typyNasze")]
    public class Wydanie
    {
        [XmlAttribute("numerWydania")]
        public UInt16 NumerWydania { get; set; }

        [XmlElement("miejsce_wydania", Namespace = "http://www.example.org/typyNasze")]
        public string MiejsceWydania { get; set; }

        [XmlElement("data_wydania", Namespace = "http://www.example.org/typyNasze")]
        public DateTime DataWydania { get; set; }


    }
}
