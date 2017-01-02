using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    [XmlRoot("definicja_kategorii", Namespace = "http://www.example.org/typyNasze")]
    public class DefinicjaKategorii
    {
        [XmlAttribute("idKategorii")]
        public string Id { get; set; }

        [XmlAttribute("nazwa")]
        public string Nazwa { get; set; }

    }
}
