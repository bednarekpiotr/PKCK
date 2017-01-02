using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    public enum TypWaluty
    {
        PLN,
        EUR,
        GBP,
        USD
    }
    [XmlRoot("cena", Namespace = "http://www.example.org/typyNasze")]
    public class Cena
    {
        [XmlAttribute("waluta")]
        public TypWaluty Waluta { get; set; }

        [XmlText]
        public float Ile { get; set; }




    }
}
