using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    [XmlRoot("autor_projektu", Namespace = "http://www.example.org/typyNasze")]
    public class AutorProjektu
    {
        [XmlAttribute("indeks")]
        public string Indeks { get; set; }

        [XmlText]
        public String Kto { get; set; }



    }
}
