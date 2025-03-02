# YouTube Downloader

Bu projede, YouTube videolarını MP3 ve MP4 formatlarında indirmenizi sağlayan bir bash script'i bulunmaktadır. Script, kullanıcıdan aldığı YouTube linklerini belirlediğiniz dizine indirir ve istediğiniz kaliteyi seçmenize olanak tanır.

## Özellikler

- **MP3 (Ses) İndirme:** Farklı ses kaliteleriyle (128kbps, 192kbps, 320kbps) YouTube videolarını ses dosyası olarak indirebilirsiniz.
- **MP4 (Video) İndirme:** Farklı video kaliteleriyle (360p, 720p, 1080p) YouTube videolarını indirebilirsiniz.
- **Boşlukları `_` ile Değiştirme:** İndirilen dosyaların adlarındaki boşluklar otomatik olarak alt tireye (`_`) dönüştürülür.
- **Dizine Kaydetme:** İndirilen dosyalar, varsayılan olarak `/sdcard/Youtube-Downloader` dizinine kaydedilir.
- **Çoklu Link Desteği:** Birden fazla YouTube linkini aynı anda girerek aynı anda birden fazla video/audio indirebilirsiniz.

## Kurulum

### 1. GitHub Reposunu Klonla

İlk adım olarak bu repository'i bilgisayarınıza veya cihazınıza klonlayın:

```bash
git clone https://github.com/AltybayWebDev/YouTube-Downloader.git
cd YouTube-Downloader
```
### 2. Gereksinimler
Bu script, `yt-dlp` adlı bir aracı kullanmaktadır. Eğer `yt-dlp` yüklü değilse, aşağıdaki komutla yükleyebilirsiniz:
```bash
pkg install yt-dlp
```
### 3. Script'i Çalıştırma
Script'i çalıştırmadan önce, `youtube-downloader.sh` dosyasına çalıştırma izni vermeniz gerekir:
```bash
chmod +x youtube-downloader.sh
```
Ardından, script'i çalıştırabilirsiniz:
```bash
./youtube_downloader.sh
```
### 4. Script ile Kullanım
Script, YouTube linklerini aldıktan sonra format (MP3/MP4) seçmenizi ister. İndirme işlemi başlamadan önce ses/video kalitesini de seçebilirsiniz.
