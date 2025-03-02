#!/bin/bash

# Varsayılan indirilen dosya yolu
default_directory="/sdcard/Youtube-Downloader"

# Kullanıcıya YouTube linki sorma ve sürekli çalışma
while true; do
    # Kullanıcıdan bir veya daha fazla YouTube linki alma
    read -p "Lütfen YouTube linklerini girin (Birden fazla link girilebilir, 'exit' yazarsanız çıkılır): " links
    
    # 'exit' komutu girilirse çık
    if [ "$links" == "exit" ]; then
        echo "Çıkılıyor..."
        break
    fi

    # Linkleri boşluklardan ayırarak bir diziye atama
    IFS=' ' read -r -a link_array <<< "$links"

    # Kullanıcıdan indirme formatını sorma
    echo "Hangi formatta indirmek istiyorsunuz?"
    echo "1. MP3 (Ses)"
    echo "2. MP4 (Video)"
    read -p "Seçiminiz (1/2): " format

    for link in "${link_array[@]}"; do
        echo "İndirilen link: $link"
        
        if [ "$format" -eq 1 ]; then
            # Ses kalitesi seçimi
            echo "Ses kalitesini seçin:"
            echo "1. 128kbps"
            echo "2. 192kbps"
            echo "3. 320kbps"
            read -p "Seçiminiz (1/2/3): " audio_quality

            case $audio_quality in
                1) quality="128k";;
                2) quality="192k";;
                3) quality="320k";;
                *) echo "Geçersiz seçim, varsayılan olarak 128kbps seçildi."; quality="128k";;
            esac

            # MP3 olarak indir ve alttan tire ile adlandırma
            yt-dlp -x --audio-format mp3 --audio-quality "$quality" -o "$default_directory/%(title)s.%(ext)s" "$link"
            
            # Dosya adındaki boşlukları _ ile değiştirme
            for file in "$default_directory"/*; do
                mv "$file" "$(echo "$file" | sed 's/ /_/g')"
            done
            
            echo "Ses dosyası başarıyla indirildi ve $default_directory dizinine kaydedildi!"

        elif [ "$format" -eq 2 ]; then
            # Video kalitesi seçimi
            echo "Video kalitesini seçin:"
            echo "1. 360p"
            echo "2. 720p"
            echo "3. 1080p"
            echo "4. En iyi mevcut kalite (otomatik)"
            read -p "Seçiminiz (1/2/3/4): " video_quality

            case $video_quality in
                1) quality="18";;   # 360p
                2) quality="22";;   # 720p
                3) quality="137+140";; # 1080p (sesle birleştirme gerekiyor)
                4)
                    # Otomatik en iyi kaliteyi seç
                    best_quality=$(yt-dlp -f bestvideo+bestaudio --get-format "$link" | head -n 1)
                    quality="$best_quality"
                    echo "En iyi mevcut kalite seçildi: $quality"
                    ;;
                *) echo "Geçersiz seçim, varsayılan olarak 720p seçildi."; quality="22";;
            esac

            # MP4 olarak indir ve alttan tire ile adlandırma
            yt-dlp -f "$quality" -o "$default_directory/%(title)s - %(format_id)s.%(ext)s" "$link"

            # Dosya adındaki boşlukları _ ile değiştirme
            for file in "$default_directory"/*; do
                mv "$file" "$(echo "$file" | sed 's/ /_/g')"
            done

            echo "Video dosyası başarıyla indirildi ve $default_directory dizinine kaydedildi!"

        else
            echo "Geçersiz seçim yaptınız. Lütfen tekrar deneyin."
        fi
    done
done
