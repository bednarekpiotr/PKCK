using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    public enum TypCzestotliwosci {
        dziennik,
        tygodnik,
        miesięcznik,
        kwartalnik,
        rocznik
    }

    [XmlRoot("autor", Namespace = "http://www.example.org/typyNasze")]
    public class Czasopismo
    {
        [XmlAttribute("pozycja_id")]
        public string Id { get; set; }

        [XmlAttribute("IdAutora")]
        public string IdAutora { get; set; }

        [XmlAttribute("IdAutoraDrugiego")]
        public string IdAutoraDrugiego { get; set; }

        [XmlAttribute("autorzy")]
        public string Autorzy { get; set; }

        [XmlElement("tytuł", Namespace = "http://www.example.org/typyNasze")]
        public string Tytul { get; set; }

        [XmlElement("nazwa_kategorii", Namespace = "http://www.example.org/typyNasze")]
        public string NazwaKategorii { get; set; }

        [XmlElement("język", Namespace = "http://www.example.org/typyNasze")]
        public Jezyk Jezyk { get; set; }

        [XmlElement("ISBN", Namespace = "http://www.example.org/typyNasze")]
        public UInt64 ISBN { get; set; }

        [XmlElement("częstotliwość", Namespace = "http://www.example.org/typyNasze")]
        public TypCzestotliwosci Czestotliwosc { get; set; }

        [XmlElement("wydanie", Namespace = "http://www.example.org/typyNasze")]
        public Wydanie Wydanie { get; set; }

        [XmlElement("wydawnictwo", Namespace = "http://www.example.org/typyNasze")]
        public string Wydawnictwo { get; set; }

        [XmlElement("cena", Namespace = "http://www.example.org/typyNasze")]
        public Cena Cena { get; set; }

        [XmlElement("opis", Namespace = "http://www.example.org/typyNasze")]
        public Opis Opis { get; set; }


    }
}
