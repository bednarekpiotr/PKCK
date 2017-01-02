using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    [XmlRoot("opis", Namespace = "http://www.example.org/typyNasze")]
    public class Opis
    {
        [XmlElement("opis_skrócony", Namespace = "http://www.example.org/typyNasze")]
        public String OpisWstepny { get; set; }

        [XmlText]
        public string OpisPozostaly { get; set; }




    }
}
