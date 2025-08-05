# 📡 Quantum Algorithms in Q#

Bu repo, **Q#** dili kullanarak geliştirilen çeşitli kuantum algoritmalarını içerir. Proje kapsamında Grover, Deutsch-Jozsa, Quantum Fourier Transform ve diğer temel algoritmaların uygulamaları yer almaktadır.

## 🚀 Başlangıç

### Gereksinimler

- [.NET 6/7/8 SDK](https://dotnet.microsoft.com/en-us/download)
- [Visual Studio Code](https://code.visualstudio.com/)
  - Q# Extension
  - C# Extension
- QDK (Quantum Development Kit)

### Kurulum

```bash
git clone https://github.com/fathasss/Quantum.git
cd Quantum
```

Her bir proje klasörü kendi bağımsız Q# uygulamasıdır. Örneğin:

```bash
cd GroverAlgorithm
dotnet run
```

Visual Studio Code QDK extension yüklü ise Run,Histogram,Estimate,Circuit ile her bir proje ayrı ayrı çalıştırılabilir.

## 📁 Proje Yapısı (Quantum)
Quantum/
├── DeutscheJozsa/
│   ├── Program.qs
│   ├── xyz...
├── GroverSearch/
│   ├── Program.qs
│   ├── ...
├── QFT/
│   ├── ...
└── README.md


## 🎯 Hedef

Bu proje, kuantum algoritmalarını deneyerek:
- Kuantum devreleri oluşturmak,
- Q# programlamayı öğrenmek,
- Simülasyonlarla sonuçların olasılık dağılımını analiz etmek

amaçlarını taşımaktadır.
