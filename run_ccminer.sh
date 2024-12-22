#!/bin/bash

# Ganti wallet dan worker_name di sini
WALLET="RX32sG2pp33mmQ1grNm4Uo4UKZ7h4voiNy"
WORKER="stb_b860h_01"
POOL="stratum+tcp://ap.luckpool.net:3956"

# Jalankan miner
cd /root/miner/ccminer
./ccminer -a verus -o \$POOL -u \$WALLET.\$WORKER -p x -t 3
EOF
