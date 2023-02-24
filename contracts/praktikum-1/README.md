# Tugas Basic Solidity
Variable, Type Data, If, For, While & Function

## 🎯 Objective
- Memahami dasar-dasar pemrograman pada Solidity.
- Mengimplementasikan pemrograman dasar pada Solidity.
- Membuat sebuah smart contract dengan menggunakan Solidity.

## 🧭 Panduan Pengerjaan
Kerjakan untuk menyelesaikan soal dengan membuat 1 file ektensi .sol (solidity)
Jika sudah bisa menggunakan git maka kirimkan link git repository namun jika belum bisa git maka kumpulkan dengan membuat zip dari file solidity lalu kirimkan file zip atau tugas yang telah dikerjakan ke link form berikut : https://forms.gle/K6kxEMe1s5LnFSWJ8 

## 📝 Task

### Soal Prioritas (100)
*Harus Dikerjakan oleh Seluruh Peserta

#### 1. Menghitung Luas Permukaan Kubus (30)
Buatlah sebuah fungsi untuk menghitung luas permukaan kubus: `L = 6 x s x s`.
kamu akan diberikan sebuah inputan sisi (_s) sebuah kubus.

##### Contoh Test Cases
```
Input: s = 10
Output: L = 600
```

##### Code
```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CubeSurfaceArea {
  function getCubeSurfaceArea(uint256 _s) public pure returns (uint256) {
    // Code Disini
  }
}
```

#### 2. Grade Nilai (40)
Seorang pengajar sedang memeriksa ujian mahasiswa dan akan memberikan deskripsi nilai dari A-E dengan ketentuan sebagai berikut:
- Nilai 80 - 100: A
- Nilai 65 - 79: B
- Nilai 50 - 64: C
- Nilai 35 - 49: D
- Nilai 0 - 34: E
- Nilai kurang dari 0 atau lebih dari 100 maka tampilkan 'Nilai Invalid'

Buat fungsi untuk menampilkan deskripsi nilai dan nama siswa saat pengajar tersebut memasukkan nilai dan nama yang dia inginkan.

##### Code
```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentScore {
  function getStrudentScore(int8 _score) public pure returns (string memory) {
    // Code Disini
  }
}
```

#### 3. Membuat Kalkulator (30)
Buat 4 buah fungsi yang masing-masing terdapat 2 parameter value (value a dan b) yang mempunyai ketentuan berikut:
- fungsi `add` untuk menjumlahkan (a + b)
- fungsi `subtract` untuk mengurangi (a - b)
- fungsi `multiply` untuk mengkali (a * b)
- fungsi `divide` untuk membagi (a / b)

##### Code
```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
  // Code Disini
}
```

### Soal Eksplorasi (30)
*Opsional dan akan dapat nilai tambah jika dikerjakan oleh peserta

#### 1. Bilangan Prima (10)
Dalam matematika, bilangan prima adalah bilangan asli yang lebih besar dari angka 1, yang faktor pembaginya adalah 1 dan bilangan itu sendiri. 2 dan 3 adalah bilangan prima. 4 bukan bilangan prima karena 4 bisa dibagi 2. Kamu diminta untuk membuat fungsi untuk menentukan bahwa sebuah bilangan termasuk bilangan prima atau tidak.

##### Sample Test Cases
```
Input: 7
Output: True

Input: 10
Output: False
```

##### Code
```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrimeNumber {
  function isPrimeNumber(int16 _number) public pure returns (bool) {
    // Code Disini
  }
}
```

#### 2. Palindrome (10)
Kata palindrome adalah sebuah kata yang jika dibalik, tetap sama. Contoh, 'katak' dibalik tetaplah 'katak'. Buatlah sebuah fungsi untuk mendeteksi sebuah string merupakan palindrom atau tidak!

##### Sample Test Cases
```
Input: katak
Output: true

Input: mister
Output: false
```

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Palindrome {  
  function isPalindrome(string memory _keyword) public pure returns (bool) {
    // Code Disini
  }
}
```

#### 3. Exponentiation (10)
Given two integers x and n, write a function to compute x^n. We may assume that x and n are small and overflow doesn’t happen.

##### Sample Test Cases
```
Input : x = 2, n = 3
Output : 8

Input : x = 7, n = 2
Output : 49
```

##### Code
```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Exponantial {
  function getExponantial(int8 _x, int8 _n) public pure returns (int256) {
    // Code Disini
  }
}
```
