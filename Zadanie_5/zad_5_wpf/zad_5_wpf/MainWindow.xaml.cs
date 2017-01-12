using System;
using System.Collections.Generic;
using System.Windows;
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
            

            Tools = new XML("..//..//Source//księgarnia_v1.3.xml", "..//..//Source//księgarnia_v1.3.xsd");

            Start();

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
                        iloscRozmiar.Content = "Ilość stron: ";
                        jezyk.Text = item.Jezyk.ToString();
                        wydanie.Text = item.Wydanie.NumerWydania.ToString() + "   " + item.Wydanie.MiejsceWydania.ToString() + "   " + item.Wydanie.DataWydania.ToString("dd-MM-yyyy"); 
                        wydawnictwo.Text = item.Wydawnictwo.ToString();
                        waluta.Content = item.Cena.Waluta.ToString();
                        cenatext.Text = item.Cena.Ile.ToString();
                        iloscRozmiartext.Text = item.IloscStron.ToString();
                        autorzytext.Text = item.Autorzy.ToString();
                        opisskroconytext.Text = item.Opis.OpisWstepny.ToString();
                        opistext.Text = item.Opis.OpisPozostaly.ToString();
                    }
                }

                foreach (var item in Dane.Czasopisma)
                {
                    if (item.Tytul.Equals(KsiegarniaListBox.SelectedItem.ToString()))
                    {
                        isbn.Text = item.ISBN.ToString();
                        iloscRozmiar.Content = "Częstotliwość: ";
                        waluta.Content = item.Cena.Waluta.ToString();
                        jezyk.Text = item.Jezyk.ToString();
                        wydanie.Text = item.Wydanie.NumerWydania.ToString() + " " + item.Wydanie.MiejsceWydania.ToString() + " " + item.Wydanie.DataWydania.ToString("dd-MM-yyyy");
                        wydawnictwo.Text = item.Wydawnictwo.ToString();
                        cenatext.Text = item.Cena.Ile.ToString();
                        iloscRozmiartext.Text = item.Czestotliwosc.ToString();
                        autorzytext.Text = item.Autorzy.ToString();
                        opisskroconytext.Text = item.Opis.OpisWstepny.ToString();
                        opistext.Text = item.Opis.OpisPozostaly.ToString();
                    }
                }
                foreach (var item in Dane.Ebooki)
                {
                    if (item.Tytul.Equals(KsiegarniaListBox.SelectedItem.ToString()))
                    {
                        isbn.Text = item.ISBN.ToString();
                        iloscRozmiar.Content = "rozmiar w MB:  ";
                        waluta.Content = item.Cena.Waluta.ToString();
                        jezyk.Text = item.Jezyk.ToString();
                        wydanie.Text = item.Wydanie.NumerWydania.ToString() + " " + item.Wydanie.MiejsceWydania.ToString() + " " + item.Wydanie.DataWydania.ToString("dd-MM-yyyy");
                        wydawnictwo.Text = item.Wydawnictwo.ToString();
                        cenatext.Text = item.Cena.Ile.ToString();
                        iloscRozmiartext.Text = item.Rozmiar.ToString();
                        autorzytext.Text = item.Autorzy.ToString();
                        opisskroconytext.Text = item.Opis.OpisWstepny.ToString();
                        opistext.Text = item.Opis.OpisPozostaly.ToString();
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
            jezyk.Clear();
            wydanie.Clear();
            wydawnictwo.Clear();
            cenatext.Clear();
            iloscRozmiartext.Clear();
            autorzytext.Clear();
            opisskroconytext.Clear();
            opistext.Clear();
        }
    }
}
