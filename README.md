# VerusMiner on Armbian STB

Proyek ini memungkinkan Anda untuk menjalankan **VerusMiner** di perangkat **STB dengan Armbian**. Script ini dirancang agar mudah digunakan dan langsung berjalan saat perangkat di-reboot.

## Cara Menggunakan

1. **Clone Repository**  
   Buka terminal Anda dan jalankan perintah berikut:
   ```bash
   git clone https://github.com/dilasercut/verusminer.git
   cd verusminer
   ```

2. **Konfigurasi Wallet dan Worker Name**  
   Edit file `run_ccminer.sh` untuk mengganti wallet dan nama worker Anda:
   ```bash
   nano run_ccminer.sh
   ```
   - Ganti **wallet** dan **worker_name** dengan data Anda.
   - Simpan dan keluar dengan menekan **CTRL+X**, lalu tekan **Y** dan **Enter**.

3. **Tambahkan ke Cronjob**  
   Agar miner berjalan otomatis setelah reboot:
   ```bash
   crontab -e
   ```
   Tambahkan baris berikut ke akhir file:
   ```bash
   @reboot bash /root/run_ccminer.sh > /root/run_ccminer.log 2>&1
   ```
   - Simpan dan keluar dengan menekan **CTRL+X**, lalu tekan **Y** dan **Enter**.

4. **Reboot Perangkat**  
   Reboot STB Anda dengan perintah:
   ```bash
   reboot
   ```

Setelah perangkat menyala kembali, miner akan otomatis berjalan di background.

## Catatan Penting
- Pastikan Anda memiliki hak akses root di perangkat Anda.
- Gunakan wallet dan nama worker yang benar untuk memaksimalkan hasil mining.
- File log dapat dilihat di `/root/run_ccminer.log` jika diperlukan.

## Dukungan
Jika Anda mengalami masalah atau memiliki pertanyaan, silakan buka issue di [repository GitHub ini](https://github.com/dilasercut/verusminer).

---

Selamat mining! 🚀

