# verusminer armbian stb
Cara menggunakan:
  git clone https://github.com/dilasercut/verusminer.git
  cd verusminer
  nano run_ccminer.sh // Ganti wallet dan worker_name punya kamu
  // Save and quit. Dengan cara tekan tombol CTRL+X, tekan tombol Y dan enter
  
  Masuk ke cronjob: crontab -e
  ketikan ini: @reboot bash /root/run_ccminer.sh > /root/run_ccminer.log 2>&1

  // Save and quit. Dengan cara tekan tombol CTRL+X, tekan tombol Y dan enter
  Setelah itu kamu reboot stbnya.
  
