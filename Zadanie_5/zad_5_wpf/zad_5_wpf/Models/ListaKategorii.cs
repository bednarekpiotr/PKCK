using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    [XmlRoot("lista_kategorii", Namespace = "http://www.example.org/typyNasze")]
    public class ListaKategorii
    {
        [XmlElement("definicja_kategorii", Namespace = "http://www.example.org/typyNasze")]
        public List<DefinicjaKategorii> Kategorie { get; set; }



    }
}
