# pilgub
Sitem Perhitungan Pemilihan Gurbenur Jawa Timur

## Spesifikasi Teknis
1. Aplikasi bekerja menggunakan SMS Gateway. Pada database SMS inbox dibuat trigger untuk dilakukan proses parsing data. Data hasil parsing di-insert ke Database Pacitan pada table hasil suara. 
2. Aplikasi menggunakan PHP untuk backend, CSS(Bootstrap) dan Javascript(JQuery)

## Public Version
1. Public Version ini adalah file yang diupload di server public.
2. Keunggulannya adalah performance sangat tinggi dan sangat mudah untuk scale up performance.
3. Tidak menggunakan database. Data backend menggunakan format JSON hasil upload dari server utama(SMS Gateway)
4. Data diupload menggunakan scheduller. Ada di folder "command"(Windows)

