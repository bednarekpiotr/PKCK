using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    [XmlRoot("autorzy_książek", Namespace = "http://www.example.org/typyNasze")]
    public class AutorzyKsiazek
    {
        [XmlElement("autor", Namespace = "http://www.example.org/typyNasze")]
        public List<Autor> Autorzy { get; set; }



    }
}
