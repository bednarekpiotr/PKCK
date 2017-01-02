using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    [XmlRoot("autor", Namespace = "http://www.example.org/typyNasze")]
    public class Autor
    {
        [XmlAttribute("IdAutora")]
        public string Id { get; set; }

        [XmlElement("imięPierwsze", Namespace = "http://www.example.org/typyNasze")]
        public string Imie { get; set; }

        [XmlElement("imięDrugie", Namespace = "http://www.example.org/typyNasze")]
        public string ImieDrugie { get; set; }

        [XmlElement("nazwisko", Namespace = "http://www.example.org/typyNasze")]
        public string Nazwisko { get; set; }



    }
}
