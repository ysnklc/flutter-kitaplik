class Kitaplik {
  final String baslik;
  final String yazar;
  final String resim_path;

  static List<Kitaplik> kitaplar = [
    Kitaplik(baslik: 'Bağırmayan Anneler', yazar: 'Hatice Kübra Tongar', resim_path: 'assets/img/bagirmayan-anneler.jpeg'),
    Kitaplik(baslik: 'Sufi Sözlük', yazar: 'Hikmet Anıl Öztekin', resim_path: 'assets/img/sufi-sozluk.jpeg'),
    Kitaplik(baslik: 'Fıtrat Pedagojisi', yazar: 'Hatice Kübra Tongar', resim_path: 'assets/img/fitrat-pedagojisi.jpeg'),
    Kitaplik(baslik: '67', yazar: 'Oğuzhan Uğur', resim_path: 'assets/img/67.jpeg'),
    Kitaplik(baslik: 'Dervişin Teselli Koleksiyonu', yazar: 'Mecit Ömür Öztürk', resim_path: 'assets/img/dervisin-teselli-koleksiyonu.jpeg'),
    Kitaplik(baslik: 'Allah\'ı Arayan Çocuk', yazar: 'Hatice Kübra Tongar', resim_path: 'assets/img/allahi-arayan-cocuk.jpeg'),
    Kitaplik(baslik: 'Başlarım Senin Aşkına', yazar: 'Mehmet Yıldız', resim_path: 'assets/img/baslarim-senin-askina.jpeg'),
    Kitaplik(baslik: 'Karatay Diyeti', yazar: 'Canan Karatay', resim_path: 'assets/img/karatay-diyeti.jpeg'),

  ];

  Kitaplik({this.baslik, this.yazar, this.resim_path});


}