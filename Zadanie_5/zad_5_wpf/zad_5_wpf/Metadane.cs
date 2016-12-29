using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace zad_5_wpf
{
    [XmlRoot("metadane", Namespace = "http://www.example.org/typyNasze")]
    public class Metadane
    {
        [XmlElement("autor_projektu", Namespace = "http://www.example.org/typyNasze")]
        public List<AutorProjektu> autorzy;

        [XmlElement("rok_akademicki", Namespace = "http://www.example.org/typyNasze")]
        public String rok_akademicki;
    }
}
