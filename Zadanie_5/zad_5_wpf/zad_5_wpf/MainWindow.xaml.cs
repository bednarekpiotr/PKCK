using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using zad_5_wpf;

namespace Ksiegarnia_zad_5
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public Ksiegarnia Dane { get; set; } // tutaj znajdują się wszystkie dane do wyświetlania - trzeba jedynie dotrzeć do konkretnych property
        public XML Tools { get; set; }
        public MainWindow()
        {
            InitializeComponent();
            

            Tools = new XML("..//..//Source//księgarnia_v1.3.xml", "..//..//Source//księgarnia_v1.3.xsd");

            Start();
            Console.WriteLine("Test");
            Console.WriteLine(Tools.XmlFile.Exists);
            Console.WriteLine(Tools.XmlFile.FullName);
            Console.WriteLine(Dane.Metadane.Rok_akademicki);

            this.MainDataContext.DataContext = Dane;
            this.MetadaneTxtBlock.DataContext = Dane.Metadane;
            List<String> ListaPozycji = new List<string>();

            void fun()
            {
                foreach (var k in Dane.Ksiazki)
                {
                    ListaPozycji.Add(k.Tytul.ToString());
                }
                foreach (var k in Dane.Czasopisma)
                {
                    ListaPozycji.Add(k.Tytul.ToString());
                }
                foreach (var k in Dane.Ebooki)
                {
                    ListaPozycji.Add(k.Tytul.ToString());
                }

            }
            fun();




            KsiegarniaListBox.ItemsSource = ListaPozycji;
            


        }

        private void Start()
        {
            if (!Tools.XmlFile.Exists)
            {
                MessageBox.Show("Błąd: Brak pliku: " + Tools.XmlFile.FullName.ToString(), "Wczytywanie danych");
            }
            else
            {
               Dane = Tools.Deserialize();
            }
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}
