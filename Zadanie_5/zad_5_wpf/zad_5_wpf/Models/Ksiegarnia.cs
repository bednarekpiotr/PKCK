using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    [XmlRoot("księgarnia", Namespace = "http://www.example.org/typyNasze")]
    public class Ksiegarnia
    {
        [XmlElement("autorzy_książek", Namespace = "http://www.example.org/typyNasze")]
        public AutorzyKsiazek AutorzyKsiazek { get; set; }

        [XmlElement("lista_kategorii", Namespace = "http://www.example.org/typyNasze")]
        public ListaKategorii ListaKategorii { get; set; }

        [XmlElement("książka", Namespace = "http://www.example.org/typyNasze")]
        public List<Ksiazka> Ksiazki { get; set; }

        [XmlElement("czasopismo", Namespace = "http://www.example.org/typyNasze")]
        public List<Czasopismo> Czasopisma { get; set; }

        [XmlElement("e-book", Namespace = "http://www.example.org/typyNasze")]
        public List<Ebook> Ebooki { get; set; }

        [XmlElement("metadane", Namespace = "http://www.example.org/typyNasze")]
        public Metadane Metadane { get; set; }

      

    }
}
