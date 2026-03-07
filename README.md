# Ninja Adventure

**Ninja Adventure** adalah game 2D Platformer yang dikembangkan menggunakan **Godot Engine 4**. Dalam game ini, Anda mengendalikan seorang ninja yang harus berpetualang melewati level dengan berlari, melompat, mengumpulkan item, dan mengalahkan musuh.

## Fitur Permainan

- **Pergerakan Karakter Utama**: Ninja dapat berjalan ke kiri maupun ke kanan, serta melompat. Animasi dinamis mengikuti status pemain (diam, berlari, atau melompat di udara).
- **Sistem Nyawa (Health System)**: Pemain dibekali 3 nyawa (Health) yang ditandai dengan ikon hati. Jika tersentuh musuh secara tidak tepat, nyawa akan berkurang. Apabila nyawa habis (0), permainan akan dikembalikan ke Main Menu.
- **Mengalahkan Musuh (Combat System)**: Musuh akan bergerak berpatroli ke rute tertentu. Pemain dapat membunuh musuh dengan cara yang klasik: **melompat dan mendarat tepat di atasnya**.
- **Sistem Poin (Collectables)**: Terdapat item di sepanjang jalan yang jika diambil akan menambah skor poin bagi pemain.
- **Multilevel**: Proyek ini diatur ke dalam beberapa desain level (`level1`, `level2`, dll) dengan pintu akhir (`finish`) di penghujung area.
- **Lingkungan Parallax**: Beberapa level mendukung *Parallax Background* bertema hutan pinus (*Pine Forest Parallax*) untuk menghadirkan kesan artistik dan memberikan efek *depth*.

## Kontrol Permainan

| Aksi | Keyboard |
| :--- | :--- |
| **Bergerak Kiri** | `A` atau `Panah Kiri` (Left Arrow) |
| **Bergerak Kanan** | `D` atau `Panah Kanan` (Right Arrow) |
| **Melompat** | `Spasi` (Spacebar) |
| **Jeda Game (Pause)**| `ESC` (Escape) |

## Struktur Utama Proyek

* `assets/` - Memuat file referensi lainnya.
* `img/` - Semua aset gambar berukuran 2D, termasuk *spritesheet*, gambar lingkungan, *background parallax*, jamur (Mushroom), musuh, dan ninja utama.
* `scenes/game_objects/` - Di sinilah file _blueprint_ dari objek-objek penting berada. Seperti pemain (`main_character`), musuh (`enemy`), collectible, dan pintu penyelesaian (`finish`).
* `scenes/levels/` - Scene dunia dan stage level tempat interaksi terjadi. Menggunakan *TileMaps* dan tata batas lingkungan.
* `scenes/menu/` - Antarmuka *Main Menu* dari game sebelum transisi permainan dimulai.
* `game_manager.gd` - Komponen sangat penting dan bisa dianggap *Autoload/Node Master*. Mengontrol kondisi universal seperti jumlah Poin yang dikumpulkan, jumlah Nyawa tersisa, merapikan antarmuka antrean hati, maupun mengelola status kalah menang.

## Cara Import dan Bermain

1. Unduh dan sediakan **Godot Engine versi 4.x** di PC/Laptop Anda.
2. Buka Godot, lalu klik pada tombol **Import**.
3. Arahkan ke folder proyek ini dan cari file `project.godot`.
4. Klik **Import & Edit**.
5. Setelah masuk ke _editor_, cukup tekan tombol **F5** pada Keyboard, atau klik ikon ▶ (Play) di ujung atas kanan untuk menjalankan _Main Scene_.
6. Anda bisa membuka dan mengedit parameter level dalam _scenes > levels_.

---
*Dikembangkan dengan menggunakan Godot Engine.* 
