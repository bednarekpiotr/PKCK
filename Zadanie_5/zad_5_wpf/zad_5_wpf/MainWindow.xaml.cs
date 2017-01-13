using System;
using System.Collections.Generic;
using System.Windows;
using System.Xml;
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
        /// <summary>
        /// 
        /// </summary>
        public MainWindow()
        {
            InitializeComponent();

 
           // Tools = new XML("C:/Users/wlade_000/Documents/PKCK/Zadanie_5/zad_5_wpf/zad_5_wpf/Source/księgarnia_v1.3.xml", "C:/Users/wlade_000/Documents/PKCK/Zadanie_5/zad_5_wpf/zad_5_wpf/Source/księgarnia_v1.3.xsd");
            Tools = new XML("księgarnia_v1.3.xml", "księgarnia_v1.3.xsd");

            Start();

            this.MainDataContext.DataContext = Dane;
            this.MetadaneTxtBlock.DataContext = Dane.Metadane;
            List<String> ListaPozycji = new List<string>();
            List<String> waluty = new List<string>();
            waluty.Add("PLN");
            waluty.Add("EUR");
            waluty.Add("GBP");
            waluty.Add("USD");
            cenacombo.ItemsSource = waluty;

            List<String> jezyki = new List<string>();
            jezyki.Add("polski");
            jezyki.Add("angielski");
            jezyki.Add("niemiecki");
            jezyki.Add("rosyjski");
            jezykcombo.ItemsSource = jezyki;

            List<String> pozycja = new List<string>();
            pozycja.Add("książka");
            pozycja.Add("e-book");
            pozycja.Add("czasopismo");
            pozycjacombo.ItemsSource = pozycja;

            List<String> rozmiarilosc = new List<string>();
            rozmiarilosc.Add("ilość stron:");
            rozmiarilosc.Add("rozmiar w MB");
            rozmiarilosc.Add("częstotliwość");
            rozmiarilosccombo.ItemsSource = rozmiarilosc;




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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (KsiegarniaListBox.SelectedItem != null)
            {
                
                tytul.Text = KsiegarniaListBox.SelectedItem.ToString();

                foreach (var item in Dane.Ksiazki )
                {
                    if (item.Tytul.Equals(KsiegarniaListBox.SelectedItem.ToString()))
                    {
                        isbn.Text = item.ISBN.ToString();
                        rozmiarilosccombo.Text = "ilość stron:";
                        jezykcombo.Text = item.Jezyk.ToString();
                        wydanie.Text = item.Wydanie.NumerWydania.ToString();
                        wydaniemiejsce.Text = item.Wydanie.MiejsceWydania.ToString();
                        wydaniedata.Text= item.Wydanie.DataWydania.ToString("dd-MM-yyyy"); 
                        wydawnictwo.Text = item.Wydawnictwo.ToString();
                        cenacombo.Text = item.Cena.Waluta.ToString();
                        cenatext.Text = item.Cena.Ile.ToString();
                        iloscRozmiartext.Text = item.IloscStron.ToString();
                        autorzytext.Text = item.Autorzy.ToString();
                        opisskroconytext.Text = item.Opis.OpisWstepny.ToString();
                        opistext.Text = item.Opis.OpisPozostaly.ToString();
                        pozycjacombo.Text = "książka";
                    }
                }

                foreach (var item in Dane.Czasopisma)
                {
                    if (item.Tytul.Equals(KsiegarniaListBox.SelectedItem.ToString()))
                    {
                        isbn.Text = item.ISBN.ToString();
                        rozmiarilosccombo.Text = "częstotliwość";
                        cenacombo.Text = item.Cena.Waluta.ToString();
                        jezykcombo.Text = item.Jezyk.ToString();
                        wydanie.Text = item.Wydanie.NumerWydania.ToString();
                        wydaniemiejsce.Text = item.Wydanie.MiejsceWydania.ToString();
                        wydaniedata.Text = item.Wydanie.DataWydania.ToString("dd-MM-yyyy");
                        wydawnictwo.Text = item.Wydawnictwo.ToString();
                        cenatext.Text = item.Cena.Ile.ToString();
                        iloscRozmiartext.Text = item.Czestotliwosc.ToString();
                        autorzytext.Text = item.Autorzy.ToString();
                        opisskroconytext.Text = item.Opis.OpisWstepny.ToString();
                        opistext.Text = item.Opis.OpisPozostaly.ToString();
                        pozycjacombo.Text = "czasopismo";
                    }
                }
                foreach (var item in Dane.Ebooki)
                {
                    if (item.Tytul.Equals(KsiegarniaListBox.SelectedItem.ToString()))
                    {
                        isbn.Text = item.ISBN.ToString();
                        rozmiarilosccombo.Text = "rozmiar w MB";
                        cenacombo.Text = item.Cena.Waluta.ToString();
                        jezykcombo.Text = item.Jezyk.ToString();
                        wydanie.Text = item.Wydanie.NumerWydania.ToString();
                        wydaniemiejsce.Text = item.Wydanie.MiejsceWydania.ToString();
                        wydaniedata.Text = item.Wydanie.DataWydania.ToString("dd-MM-yyyy");
                        wydawnictwo.Text = item.Wydawnictwo.ToString();
                        cenatext.Text = item.Cena.Ile.ToString();
                        iloscRozmiartext.Text = item.Rozmiar.ToString();
                        autorzytext.Text = item.Autorzy.ToString();
                        opisskroconytext.Text = item.Opis.OpisWstepny.ToString();
                        opistext.Text = item.Opis.OpisPozostaly.ToString();
                        pozycjacombo.Text = "e-book";
                    }
                }
            }
            else
            {
                MessageBox.Show("Wybierz pozycję z listy");
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            isbn.Clear();
            tytul.Clear();
            wydanie.Clear();
            wydawnictwo.Clear();
            cenatext.Clear();
             autorzytext.Clear();
            opisskroconytext.Clear();
            iloscRozmiartext.Clear();
            wydanie.Clear();
            wydaniemiejsce.Clear();
            wydaniedata.Clear();


            opistext.Clear();
       

        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            XmlDocument doc = new XmlDocument();
           // doc.Load("C:/Users/wlade_000/Documents/PKCK/Zadanie_5/zad_5_wpf/zad_5_wpf/Source/księgarnia_v1.3.xml");
            doc.Load("księgarnia_v1.3.xml");
            XmlNodeList nodes = doc.SelectNodes("/księgarnia/książka");
            if (KsiegarniaListBox.SelectedItem != null)
            {
                MessageBox.Show(nodes.Count.ToString());
                foreach (XmlNode item in nodes)
                {
                    if(item["tytuł"].InnerText.Equals(KsiegarniaListBox.SelectedItem.ToString()))
                    {
                        MessageBox.Show("Znaleziono");
                        item.ParentNode.RemoveChild(item);
                        doc.Save("C:/Users/wlade_000/Documents/PKCK/Zadanie_5/zad_5_wpf/zad_5_wpf/Source/księgarnia_v1.3.xml");
                    }
                }

            }
            else
            {
                MessageBox.Show("Wybierz pozycję");
            }

            
            
           


            
        }
    }
}
