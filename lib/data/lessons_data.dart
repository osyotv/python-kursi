// Auto-generated file. Do not edit manually.

class Lesson {
  final int lessonNumber;
  final String title;
  final String introduction;
  final String vocabularyRaw;
  final List<Exercise> exercises;

  const Lesson({
    required this.lessonNumber,
    required this.title,
    required this.introduction,
    required this.vocabularyRaw,
    required this.exercises,
  });
}

class Exercise {
  final int number;
  final String question;
  final String answer;

  const Exercise({
    required this.number,
    required this.question,
    required this.answer,
  });
}

const List<Lesson> pythonLessons = [
  Lesson(
    lessonNumber: 1,
    title: '''Kerakli Dasturlar (Python va Anaconda)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/ilk-qadamlar/01-software.md).

## PYTHON

Kod yozish uchun avvalo kompyuterimizda Python o'rnatilgan bo'lishi kerak. Biz buning uchun Pythonni to'g'ridan-to'g'ri o'rnatib emas, balki [Anaconda ](https://www.anaconda.com)platformasini o'rnatish orqali amalga oshiramiz.&#x20;

Bunday qilishimizning bir nechta sabablari bor:

* Anaconda Python nisbatan tezroq
* Anaconda biz uchun kerakli bo'lgan qo'shimcha dasturlar va muhim paketlar bilan birga o'rnatiladi
* Anacondada turli dasturlar (loyihalar) uchun alohida muhit yaratish mumkin

### Repl.it

Agar siz turli sabablarga ko'ra kompyuteringizga Python o'rnata olmasangiz, [repl.it ](https://repl.it/)sahifasi yordamida Python dasturlarini to'g'ridan-to'g'ri brauzerda ham yozishingiz mumkin.&#x20;

Biz darsimiz davomida yozilgan kodlarni va mashg'ulotlarning javoblarini Repl.it sahifasiga yuklab boramiz.

## ANACONDA

Anaconda platformasini o'rnatamiz.

* [ ] Kompyuterimizda brauzerni ochib, <https://www.anaconda.com/products/individual> sahifasiga kiramiz va **Download** tugmasini bosamiz.
* [ ] Kompyuterimizda o'rnatilgan operatsion tizim uchun mos keluvchi faylni yuklab olamiz (*agar yuqoridagi jumlani tushunmagan bo'lsangiz, katta ehtimollik bilan sizda 64-Bit Windows operatsion tizimi o'rnatilgan*)&#x20;

![](/files/-ML1AuAJQ98DZ8YlWQ95)

* [ ] Yuklab olingan faylni ochamiz, va o'rnatamiz *(hech qanday o'zgartirishlarga hojat yo'q, NEXT, ACCEPT, FINISH tugmalarini bosib turamiz xolos)*

![](/files/-ML2HWsOxe_iYlnnEZ_7)

* [ ] Anaconda o'rnatilganidan so'ng Windowsdagi dasturlar orasida Anaconda Navigator dasturini ochamiz.

![](/files/-ML2HvAPZCq3SSQEn4St)

## **SPYDER IDE**

**Spyder** — Python tilida kod yozich uchun mo'ljallangan dasturlash muhiti va bizning asosiy ish qurolimizdir. Ingliz tilida dasturlash muhiti - **IDE** (Integrated Development Environment) deyiladi.

Dastur yozish uchun yuzlab turli muhitlar bor. Aslida, umuman muhitsiz, oddiy matn redaktorida ham kod yozishimiz mumkin edi. Lekin Spyder va unga o'xshash muhitlar dasturchilarning ishini yengillatishga qaratilgan. Muhitlar turli qo'shimcha funktsiyalar va foydali xossalarga boy bo'ladi.&#x20;

![Python uchun mavjud Dasturlash Muhitlari. Manba: https://www.indianaiexpert.com/best-python-ide-2019/ ](/files/-MLGXzH-guf3bonKAauD)

Kelajakda siz o'zingiz uchun qulay muhitni tanlab, yangi dasturlarni yangi muhitda yozishingiz mumkin. Boshlanishiga esa biz Anaconda bilan birga keladigan qulay va sodda, lekin shu bilan birga funktsiyalarga boy bo'lgan Spyder muhitini tanlaymiz.&#x20;

Spyder dasturini Android Navigator yoki Windows orqali to'g'ridan-to'g'ri ochish mumkin.

![Spyder IDE ochamiz](/files/-MLGnNCvg8E60dGivcBt)

## **KITE**

Spyder dastruni ilk marotaba ochganimizda [**Kite** ](https://www.kite.com/)dasturlash yordamchisini (pogramming assistant) o'rnatishni taklif qilishi mumkin.&#x20;

**Kite** —sun'iy intellekt asosida ishlovchi virtual yordamchi bo'lib, kod yozishni osonlashtiradi. Kite yordamida istalgan funktsiya yoki komanda haqida qo'shimcha ma'lumot olishingiz mumkin. Shungdek Kite sizga kodlarni to'g'ri yozishda ishora (подсказка) ham ko'rsatib turadi.

![Kite yordamida kod yozish bir muncha osonlashadi](/files/-MLGv_dB46bpOG19eQl2)

Maslahatim, 5 minut vaqtingizni qizg'anmay, Kite yordamchisini ham o'rnatin&#x67;**:**

![Install Kite tugmasini bosing](/files/-MLGr_ZfpBJw8qUxLJvu)

![Kite yordamchisini o'rnatish jarayoni](/files/-MLGtLjrA3KjZSRQ7g8L)

**Va nihoyat Spyder IDE ochiladi:**

![Spyder IDE](/files/-MLGthL66xfIc6WU2EWQ)

**Yuqoridagi qadamlarni muvaffqaiyatli yakunlagan bo'lsangiz, siz birinchi dasturingizni yozishga tayyorsiz!**

## **AMALIYOT**

Kompyuteringizga Anaconda platformasini o'rnating.

---''',
    vocabularyRaw: '''Anaconda	Python distributivi va paketlar menejeri	Anaconda Navigator
VS Code	Eng mashhur bepul kod muharriri	VS Code extensions
Terminal	Buyruqlar satri (Command Line)	cmd / bash''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Terminalni ochib Python versiyasini tekshirish buyrug\'ini yozing.''',
        answer: '''python --version''',
      ),
      Exercise(
        number: 2,
        question: '''Spyder kabi kod yozish va tahrirlash uchun mo'ljallangan dasturlash muhiti qisqacha nima deb ataladi?''',
        answer: '''IDE''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 2,
    title: '''Hello World! — Birinchi Dastur''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/ilk-qadamlar/hello-world.md).

Mavzuning aksar qismi video darsimizda yoritilgan bo'lsada, quyidagi matnlarga ham ko'z yugurtirib chiqish foydadan xoli bo'lmaydi.

## SPYDER IDE BILAN TANISHAMIZ

Spyder muhiti uch qismdan iborat:

1. **Matn muharriri** —dasturlar yozish uchun.
2. **Konsol** —qisqa kodlarni bajarib, tekshirib ko'rish uchun.
3. **Qo'shimcha ma'lumotlar** oynasi. Bu yerda quyidagi ma'lumotlarni ko'rish mumkin:
   1. Turli funktsiyalar haqida yordam
   2. Dasturdagi o'zgaruvchilar ro'yhati
   3. Grafiklar
   4. Fayllar

![Spyder IDE](/files/-MLN8tAjkGkzepC07BST)

Konsolda qisqa kodlarni bajarib, natijasini ko'rish mumkin. Misol uchun oddiy arifmetik amallarni bajarib ko'raylik:

![Konsolda qisqa buyruqlarni bajarib ko'rish mumkin](/files/-MLN9wD_L2n5kcTn7Amu)

## BIRINCHI DASTURIMIZ —"Hello World!"

Keling an'anaga ko'ra barcha dasturchilar birinchi yozadigan dastur, "Hello World!" dasturini yozamiz.&#x20;

Buning uchun Spyder IDE yuqorisidagi menuda **File --> New File** bo'limini tanlaymiz (yoki klaviaturada Ctrl+N tugmalarini bosamiz). Math muhrarrirda yangi, **untitled0.py** fayli yaratildi.

Faylga ma'nili nom beramiz, buning uchun **File --> Save as..** menusini tanlaymiz (yoki Ctrl+Shift+S) va yangi ochilgan oynada faylga ma'nili nom beramiz.

Faylni nomlashda quyidagi qoidalarga amal qiling:&#x20;

* Fayl nomi *qisqa, kichkina  lotin harflari bilan* va eng muhimi *bo'shliq (пробел) qo'ymasdan* yozilgan bo'lishi kerak
* Fayl nomi **.py** bilan tugashi kerak (misol uchun `faylnomi.py`)
* Faylga ikki so'zdan iborat nom qo'ymoqchi bo'lsangiz so'zlar orasini tire (-) yoki pastki chiziq (\_) bilan ajrating. Misol uchun: `hello-world.py` yoki `hello_world.py`
* Fayl nomini sonlar bilan boshlamang
  

Yuqoridagi qoidalarga amal qilgan holda faylga `hello.py` deb nom beramiz (siz istlagnahca nomalshingiz mumkin) va **Save** tugmasini bosamiz.

![Faylni nomlaymiz](/files/-MLNDDHnbGos-bUEqPGC)

Matn muharririda quyidagi kodni yozamiz:

```python
print("Hello World!")
```

**print()** bu Pythondagi mahsus funktsiya bo'lib, () ichida berilgan matn yoki ifodalarni ekranga (konsolga) chiqarish vazifasini bajaradi.&#x20;

Dars davomida berilgan kodlarni albatta o'zingiz ham bajaring. **Bu juda muhim!**

Kodimizni bajarish uchun **Run** (**►**) tugmasini (yoki F5) bosamiz (yangi ochilgan oynada ham **Run** tugmasini bosamiz) va konsolda natijani ko'ramiz:

![Birinchi dasturimiz va uning natijasi](/files/-MLNFDLHkkI8Bh_8jfxw)

Konsolda `Hello World!` yozuvini ko'rgan bo'lsangiz, **TABRIKLAYMIZ!** Siz Pythonda birinchi dasturingizni yozdingiz.

![](/files/-MLQ4UF-16vD1m0atzQ1)

## AMALIYOT

Spyder konsolida va matn muharririda quyidagi kodlarni yozib, bajarib ko'ring. Siz kutgan natijalar chiqdimi?

```python
print('Assalom alaykum')
```

```python
print(Hayrli tong!)
```

```python
print(2+4*2)
```

```python
print(19/5)
```

```python
print(2**4)
```

---''',
    vocabularyRaw: '''print()	Ekranga matn chiqaruvchi funksiya	print(\"Salom\")
Syntax	Dasturlash tilining qoidalari (imloshi)	SyntaxError''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Ekranga \'Salom Python\' matnini chiqaruvchi kod yozing.''',
        answer: '''print(\'Salom Python\')''',
      ),
      Exercise(
        number: 2,
        question: '''Qo\'shtirnoq ichiga yozilgan matnli ma\'lumot turi qanday ataladi?''',
        answer: '''string''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 3,
    title: '''Print(), Sinteks va Arifmetik Amallar''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/ilk-qadamlar/03-print.md).

## PRINT()

Avvalgi darsimizning yakunida bir nechta kodlarni pythonda bajarib ko'rishni vazifa qilgan edik. Keling shu kodlarning natijasini ko'ramiz:

```python
print("Assalom alaykum")
```

Natija: `Assalom alaykum`

Kutilganidek, yuqoridagi kod Assalom alaykum matnini konsolda ko'rsatdi. Keling endi keyingi kodni kiritamiz:

```python
print(Hayrli tong!)
```

Natija: **`SyntaxError: invalid syntax`**

Bu safar esa `Hayrli tong!` yozuvi o'rniga, **Syntax Error (**&#x73;inteksda xatolik) xabari chiqdi. Xatolik qayerda?

Avval aytganimizdek, print() funktsiyasi matn yoki ifodalarni konsolga chiqarish vazifasini bajaradi. Lekin bu funktsiya to'g'ri ishlashi uchun bir nechta qoidalarga amal qilish lozim. Jumladan, agar konsolga matn chiqarmoqchi bo'lsak, matnimiz albatta qo'shtirnoq yoki (`" "`) yoki birtirnoq(`' '`) orasida yozlishi kerak. Demak `Hayrli tong!` so'zini konsolda chiqarish uchun to'g'ri kod:

```python
print("Hayrli tong!")
```

yoki

```python
print('Hayrli tong!')
```

bo'ladi.&#x20;

Natija: `Hayrli tong!`

Qo'shitrnoq yoki birtirnoq ishlatishning afzalliklaridan biri, agar siz chiqarmoqchi bo'lgan matnda ikkovidan biri qatnashgan bo'lsa, `print()` funktsyasida ikkinchisidan foydalanasiz. Keling quyidagi misolni ko'ramiz:

```python
print('Men "Dell" markasidagi noutbuk sotib oldim')
```

&#x20;Natija: `Men "Dell" markasidagi noutbuk sotib oldim`

Yuqoridagi matnda `"Dell"` so'zi qo'shtirnoq ichida eda. Bu matnni konsolga chiqarish uchun esa, `print()`funktsyasi ichida matnni birtirnoq ichiga oldik.

Agar matnni bir necha qatorga bo'lib yozish talab qilinsa, uchtalik qo'shtirnoq`(""" """)`yoki birtirnoqdan `(u0027u0027u0027 u0027u0027u0027)`foydalanish mumkin:

```python
print("""Odami ersang, demagil odami,
Oniki, yo'q xalq g'amidin g'ami""")
```

Natija:&#x20;

`Odami ersang, demagil odami,`

`Oniki, yo'q xalq g'amidin g'ami`

Qatorga bo'lishning yana bir usuli, qator so'nggida `\n` belgisini qo'yish.

```python
print("Odami ersang, demagil odami,\nOniki, yo'q xalq g'amidin g'ami")
```

Natija:&#x20;

`Odami ersang, demagil odami,`

`Oniki, yo'q xalq g'amidin g'ami`

Yuoqridagi matnni birtirnoq orqali ham konsolga chiqarish mumkinmi? Matndagi `yo'q`, `g'am` so'zlaridagi birtirnoqlar bunga to'sqinlik qilmaydimi? **Qiladi.**

Buning oldini olish uchun esa matndagi birtirnoq belgisidan avval `\` belgisini qo'yish lozim.&#x20;

```python
print('Odami ersang, demagil odami, \nOniki, yo\'q xalq g\'amidin g\'ami')
```

Natija:&#x20;

`Odami ersang, demagil odami,`&#x20;

`Oniki, yo'q xalq g'amidin g'ami`

Yuqoridagi kodga e'tibor bergan bo'lsangiz "yo'q" so'zi `yo\'q` ko'rinishida "g'am" so'zi esa `g\'am` ko'rinishida yozilgan. Umuman olganda `\` belgisi har qanday mahsus belgi oldidan qo'yiladi.

Agar yuqordagi kodimizda `\` belgisini ishlatmaganimizda natija qanday bo'lar edi?

```python
print('Odami ersang, demagil odami,\nOniki, yo'q xalq g'amidin g'ami')
```

Natija: **`SyntaxError: invalid syntax`**

Keling shu o'rinda **Syntax Error** (sinteksda xatolik) haqida ham gaplashaylik.&#x20;

## SINTEKS XATOLIK (SYNTAX ERROR)

Har bir tilda orfografik va grammatik qoidalar bo'lgani kabi, dasturlash tillarining ham o'ziga yarasha qonun-qoidalari bor. Bu qoidalar to'plami **sinteks (syntax)** deb ataladi. **Sinteks xatolik** (Syntax Error) deb esa shu qoidalarning buzilishiga aytiladi.&#x20;

Misol uchun keraksiz joyda qo'yilgan nuqta, vergul yoki bo'sh joy, shuningdek ma'lum funktsiyalar nomini xato yozish (`print()` o'rniga `prit()`), ochilmay yoki yopilmay qolgan qavs, noo'rin bo'shliq, qolib ketgan kalit so'z (keyword) kabilar ham Syntax Error hisoblanadi.

Syntax Error eng ko'p uchraydigan xatolik bo'lib, Python bunday xatolik bor dasturlarni **bajarmaydi**.&#x20;

Biz darslarimiz davomida turli sinteks qoidalar haqida o'z o'rnida yana to'xtalamiz.

## ARIFMETIK AMALLAR

Amaliyotga qaytamiz, `print()` funktsiyasi nafaqat matn, balki turli ifodalarni ham konsolga chiqaradi.

Keling quyidagi kodlarni ham bajaramiz:

```python
print(2+4*2)
```

Natija: `10`

Python arifmetik amallarni bajarishda Matematika qoidalariga amal qiladi:

* Qavs ichidagi amallar qavs ortidagilardan avval bajariladi
* Darajaga oshirish (ildiz chiqarish) ko'paytirish va bo'lishdan avval bajariladi
* Ko'paytirish va bo'lish, qo'shish va ayirishdan avval bajariladi
* Boshqa holatlarda ifodalar chapdan o'ngga qarab bajariladi

Yuqoridagi misolda ham avval ko'paytirish (`4*2=8`), keyin esa qo'shish amali (`2+8=10`) bajarildi.

```python
print(19/5)
```

Natija: `3.8`

Ko'rib turganingizdek, `/` belgisi bo'lish amalini bajaradi va natija har doim o'nlik son ko'rinishida bo'ladi (agarchi bo'lish amali natijasida butun son xosil bo'lsa ham):

```python
print(20/5)
```

Natija: `4.0`

Bo'lish amalidan butun son ko'rinishidagi natija olish uchun `//` belgisidan foydalanamiz:

```python
print(16//4)
```

Natija: `4`

```python
print(10//3)
```

Natija: `3`

Amaliyotimizdagi keyingi kodni ham bajaraylik:

```python
print(2**4)
```

Natija: `16`

Yuqoridagi `**` belgisi darajaga oshirishni anglatadi, ya'ni `2**4` ifodasi 2 ning 4-darajasini beradi.

Pythonda oddiy arifmetik amallar quyidagi jadvalda berilgan.

| Operator | Tavsif                         | Misol        |
| -------- | ------------------------------ | ------------ |
| +        | Qo'shish                       | 5+6=11       |
| -        | Ayirish                        | 5-6=-1       |
| \*       | Ko'paytirish                   | 5\*6=30      |
| /        | Bo'lish                        | 5/6=0.833333 |
| //       | Bo'lish va butun qismini olish | 5//6=0       |
| \*\*     | Exponenta (daraja/ildiz)       | 5\*\*6=15625 |
| %        | Bo'linmaning qoldig'ini olish  | 15%6=3       |

`print()` yordamida matn va ifodalarni jamlab chiqarish ham mumkin. Buning uchun har bir ifoda va matn vergul (`,`) bilan ajratiladi:

```python
print("To'qqizning kvadrati", 9**2, "ga teng")
```

Natija: `To'qqizning kvadrati 81 ga teng`

```python
print('3x3=',3*3)
```

Natija:`3x3= 9`

## IZOHLAR (COMMENTS)

Yaxshi dasturchilarning odatlaridan biri har qanday kodni izohlar bilan tushuntirib ketish. Izohlar kelajakda o'zimiz uchun ham, boshqalar uchun ham dasturimiz qanday ishlashini tushunishda yordam beradi.&#x20;

Quyidagi ikki misolga e'tibor bering, va ulardan qay biri tushunarliroq ekanini solishtiring

```python
print(2*5*3.14159)
```

```python
#Radiusi 5 ga teng bo'lgan aylananing uzunligi quyidagicha hisoblanadi
print(2*5*3.14159)
```

Yuqoridagi misolda `#` belgisidan keyin yozilgan matn **izoh** (**comment**) deyiladi.&#x20;

Izoh alohida qatorda yoki qator oxiridan ham yozilishi mumkin. Python `#` dan keyingi har qanday matnni (qator oxirigacha) e'tiborsiz qoldiaradi. `#` dan keyin yozligan kodlar ham bajarilmaydi:

```python
print("Assalom alaykum!") # Bu matn konsolda chiqadi
#Keyingi qator esa bajarilmaydi
#print("Mening ismim Anvar")
```

Natija: `Assalom alaykum!`

## AMALIYOT

Quyidagi matnni aynan shunday ko'rinishda konsolda chiqaring:

`"Nexia", "Tico", 'Damas' ko'rganlar qilar havas`

Quyidagi misollarga yechimni Pythonda chiqaring. Har bir misoldan avval misol matnini izoh ko'rinishida yozing:

1. 5 ning 4-darajasini toping
2. 22 ni 4 ga bo'lganda qancha qoldiq qoladi?
3. Tomonlari 125 ga teng kvadratning yuzi va perimetrini toping
4. Diametri 12 ga teng bo'lgan doiraning yuzini toping  (\$\$\pi=3.14\$\$ deb oling)
5. Katetlari 6 va 7 bo'lgan to'g'ri burchakli uchburchakning gipotenuzasini toping ([Pifagor teoremasidan ](https://fayllar.org/pifagor-teoremasi-va-uning-turli-hil-isbotlari-mavzusida-tajer.html)foydalaning)

Javoblarni savol va yechim ko'rinishida chiqaring: `5 ning 4-darajasi 625`

## MISOLLARGA JAVOBLAR

Yuqoridagi misollarni o'zingiz ishlashga harakat qiling, so'ngra quyidagi bog'lamadagi javoblar bilan solishtiring.

03-dars javoblari

---''',
    vocabularyRaw: '''+	Qo\'shish amali	print(2+3)
*	Ko\'paytirish amali	print(2*3)
**	Darajaga ko\'tarish (kvadrat, kub...)	print(5**2)
%	Bo\'lishdan qolgan qoldiq	print(10%3)
//	Bo\'lishdan chiqqan butun qism	print(10//3)''',
    exercises: [
      Exercise(
        number: 1,
        question: '''9 ning kvadratini hisoblab ekranga chiqaruvchi kod yozing.''',
        answer: '''print(9**2)''',
      ),
      Exercise(
        number: 2,
        question: '''21 ni 4 ga bo\'lgandagi qoldiqni chiqaruvchi kod yozing.''',
        answer: '''print(21%4)''',
      ),
      Exercise(
        number: 3,
        question: '''15 ni 4 ga bo\'lgandagi butun qismini chiqaruvchi kod yozing.''',
        answer: '''print(15//4)''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 4,
    title: '''O\'zgaruvchilar (Variables)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/ozgaruvchilar-va-malumot-turlari/04-variables.md).

## O'ZGARUVCHI (VARIABLE)

**O'zgaruvchi** —kompyuter xotirasida ma'lum bir qiymatni saqlash uchun ajratilgan joy. Soddaroq qilib tushuntirsak, o'zgaruvchini quti, quti ichidagi narsani esa qiymat deb tasavvur qilish mumkin. Pythonda qiymatlar son, matn, ro'yxat va hokazo ko'rinishida bo'lishi mumkin.

![O'zgaruvchilarni kerakli buyumlar (ma'lumotlat) saqlanadigan, nomlangan qutilarga o'xshatish mumkin](/files/-MLgfAikZVcuHp-u5tHP)

Quyidagi misolga e'tibor bering, biz 2 ta o'zgaruvchi yaratdik (`ism` va `yosh`) va ularga qiymatlar yukladik (Pythonda boshqa tillardagi ka'bi o'zgaruvchilarni avvaldan e'lon qilish yo'q):

```python
ism = "Abdulloh"
yosh = 25
print(ism)
print(yosh)
```

Natija:

`Abdulloh`

`25`

O'zgaruvchi (variable) bunday deyilishiga sabab, uning qiymati istalgan vaqt o'zgartirilishi mumkin:

```python
ism = "Abdulloh"
print(ism)
ism="Muhammad"
print(ism)
```

Natija:

`Abdulloh`

`Muhammad`

Yuqoridagi misolda `ism` nomli o'zgaruvchiga avval `Abdulloh` keyin esa `Muhammad` qiymatlarini berdik.

## O'ZGARUVCHILARNI NOMLASH

O'zgaruvchilarga nom berishda quyidagi qoidalarga amal qiling:

* O'zgaruvchi nomi harf yoki pastki chiziq (`_`) bilan boshlanishi kerak
* O'zgaruvchi nomi raqam bilan boshlanishi mumkin emas
* O'zgaruvchi nomida faqatgina lotin alifbosi harflari (`A-z`), raqamlar (`0-9`) va pastki chiziq (`_`) qatnashishi mumkin
* O'zgaruvchi nomida bo'shliq (пробел) bo'lishi mumkin emas
* O'zgaruvchi nomida katta-kichik harflar turlicha talqin qilinadi (`ism`, `ISM`, va `Ism` uchta turli o'zgaruvchi)
  

Qo'shimcha qoida sifatida:&#x20;

* O'zgaruvchi nomini kichik harflar bilan yozing.&#x20;
* O'zgaruvchi nomida 2 va undan ortiq so'z qatnashsa ularning orasini pastki chiziq (\_) bilan ajrating (`ism_sharif="Anvar Narzullaev"`)
* O'zgaruvchiga tushunarli nom bering (`y=20` emas `yosh=20`, `d="Korea"` emas `davlat = "Korea"` va hokazo)
* Shuningdek o'zgaruvchilarga Pythonda ishlatiladigan funktsiyalar va maxsus kalit so'zlarning (keywords) nomini bermang. Kalit so'zlar ro'yhatini ko'rish uchun Spyder konsolida avval `help()` deb yozing va Enter tugmasini bosing. Keyin esa `keywords` deb kiritib, yana Enter bosing. Marhamat, ekraningizda Pythondagi maxsus kalit so'zlar ro'yhatini ko'ryapsiz:

![Bu so'zlardan o'zgaruvchilarni nomlashda foydalanmang](/files/-MLW-W018dbAzZRednoA)

## AMALIYOT

Quyidagi mashqlarni bajaring:

* `"Hello World!"` matnini yangi o'zgaruvchiga yuklang va `print()` yordamida konsolga chiqaring
* `xabar` deb nomlangan o'zgaruvchiga biror matn yuklang va konsolga chiqaring, keyin esa o'zgaruvchiga yangi qiymat berib uni ham konsolga chiqaring.
* `class` den nomlangan o'zgaruvchi yarating, unga biror qiymat bering va konsolga chiqaring (siz kutgan natija chiqdimi?)
* Quyidagi kodni bajaring:

```python
radius = 5
pi = 3.14159
aylana_yuzi = pi * radius**2
print("Radiusi" , radius, "ga teng aylananing yuzi=", aylana_yuzi)
```

## JAVOBLAR

04-dars javoblari

---''',
    vocabularyRaw: '''ism = \"Ali\"	O\'zgaruvchiga qiymat yuklash amali	ism = \'Ali\'
variable	o\'zgaruvchi atamasi ingliz tilida	variable name
lowercase	Kichik harflar (o\'zgaruvchi nomlari uchun tavsiya etiladi)	user_name''',
    exercises: [
      Exercise(
        number: 1,
        question: '''ism nomli o\'zgaruvchiga \'Olim\' qiymatini yuklang.''',
        answer: '''ism = \'Olim\'''',
      ),
      Exercise(
        number: 2,
        question: '''yosh o\'zgaruvchisiga 20 sonini yuklang.''',
        answer: '''yosh = 20''',
      ),
      Exercise(
        number: 3,
        question: '''a va b o\'zgaruvchilarini qo\'shib ekranga chiqaring.''',
        answer: '''a = 5
b = 3
print(a + b)''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 5,
    title: '''String (Matn bilan ishlash)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/ozgaruvchilar-va-malumot-turlari/05-string.md).

## **STRING VA UNICODE**

**STRING** (matn) —Pythondagi eng mashxur ma'lumot turlaridan biri. Avvalgi darsda ko'rganimizdek, o'zgaruvchiga matn yuklash uchun matn qo'shtirnoq (`" "`) yoki birtirnoq (`' '`) ichida yozilishi kerak.

```python
shahar = "Қўқон"
viloyat = 'Фарғона'
```

Pythonda matnlar [Unicode ](https://unicode-table.com/en/)jadvalidagi istalgan belgilaridan iborat bo'lishi mumkin (jumladan o'zbek, arab, hind, xitoy alifbosidagi harflar yoki turli emoji-smayliklar).&#x20;

```python
matn = "Men yangi 📱 oldim"
print(matn)
```

Natija: `Men yangi 📱 oldim`

![UNICODE jadvalidagi harf va belgilarga misol](/files/-MLjVgUODxYRloFHWptm)

## STRING USTIDA AMALLAR

### Matnlarni qo'shish operatori (`+`)

Matnlarni qo'shish uchun `+` operatoridan foydalanmiz:

```python
ism = 'Ahmad'
print("Mening ismim " + ism)
```

Natija: `Mening ismim Ahmad`

```python
ism = 'Ahad'
familiya = 'Qayum'
print(ism + familiya)
```

Natija: `AhadQayum`

Yuqoridagi kodda ism va familiya orasiga bo'shliq belgisini qo'shmaganimiz uchun ikki matn qo'shilib yozildi. Buni to'g'rilash uchun, 3-qatorni quyidagicha yozamiz:

```python
ism = 'Ahad'
familiya = 'Qayum'
print(ism + ' ' + familiya) # ikki o'zgaruvchi orasiga bo'sh joy qo'shamiz
```

Natija: `Ahad Qayum`

### f-string

Ikki (va undan ko'p) matn ko'rinishidagi o'zgaruvchilarni birlashtirish uchun f-string usulidan  `f"{matn1} {matn2}"` ham foydalansak bo'ladi:

```python
ism = "Ahad"
familiya = 'Qayum'
ism_sharif = f"{ism} {familiya}"
print(ism_sharif)
```

Bu usul yordamida uzun matnlarni ham yasash mumkin:

```python
ism = "James"
familiya = 'Bond'
print(f"Salom, mening ismim {familiya}. {ism} {familiya}!")
```

Natija: `Salom, mening ismim Bond. James Bond!`

### Mahsus belgilar

Matnga bo'shliq qo'shish uchun `\t` belgisidan, yangi qatordan boshlash uchun `\n` belgisidan foydalanamiz:

```python
print('Hello World!')
print('Hello \tWorld!')
print('Hello \nWorld!')
```

Natija:

`Hello World!`&#x20;

`Hello    World!`&#x20;

`Hello`&#x20;

`World!`

## STRING METODLARI

Pythonda string ustida amalga oshirish mumkin bo'lgan tayyor amallar to'plami mavjud. Bunday amallar to'plami **metodlar** deb ataladi.&#x20;

Metodlarni qo'llash uchun metod nomi matndan so'ng `.metod_nomi()` ko'rinishida yoziladi. Keling shunday metodlarning ba'zilari bilan tanishaylik.

### `upper()` va `lower()` metodlari

`upper()` metodi matndagi har bir harfni katta harfga o'zgartiradi.&#x20;

```python
ism = 'Ahad'
familiya = 'Qayum'
ism_sharif = f"{ism} {familiya}"
print(ism_sharif.upper())
```

Natija: `AHAD QAYUM`

`lower()` metodi esa aksincha, har bir harfni kichik harfga o'zgartiradi.

```python
ism = 'Ahad'
familiya = 'Qayum'
ism_sharif = f"{ism} {familiya}"
print(ism_sharif.lower())
```

Natija: `ahad qayum`

### `title()` va `capitalize()` metodlari

`title()` metodi matndagi har bir so'zning birinchi harfini katta harf bilan yozadi.&#x20;

```python
ism_sharif = 'james bond'
print(ism_sharif.title())
```

Natija: `James Bond`

`capitalize()` esa faqatgina eng birinchi so'zning birinchi harfini katta bilan yozadi.

```python
ism_sharif = 'james bond'
print(ism_sharif.capitalize())
```

Natija: `James bond`

Metodlarni faqat o'zgaruvchilarga emas, balki to'g'ridan-to'g'ri matnga ham qo'llash mumkin (aslida o'zgaruvchi ham matnning (yoki boshqa ma'lumotning) manzili xolos)

```python
print('james bond'.upper())
```

Natija: `JAMES BOND`

### `strip()`, `rstrip()` va `lstrip()` metodlari

Bu metodlar matnning boshi va oxiridagi bo'sh joylarni olib tashlaydi.

* `lstrip()` — matn boshidagi bo'shliqni,
* `rstrip()` – matn oxiridagi bo'shliqni,
* `strip()` — matn boshi va oxiridagi bo'shliqlarni olib tashlaydi

```python
meva = "     olma     "
print("Men " + meva.lstrip() + " yaxshi ko'raman")
print("Men " + meva.rstrip() + " yaxshi ko'raman")
print("Men " + meva.strip() + " yaxshi ko'raman")
print("Men " + meva + " yaxshi ko'raman")
```

> Men olma      yaxshi ko'raman&#x20;
>
> Men       olma yaxshi ko'raman&#x20;
>
> Men olma yaxshi ko'raman&#x20;
>
> Men       olma      yaxshi ko'raman

Matnlar bilan ishlaydigan metodlar ko'p. Ularning ba'zilari bilan kelajakda yana tanishamiz, to'liq ro'yhatni esa quyidagi [sahifada ](https://www.w3schools.com/python/python_ref_string.asp)ko'rishingiz mumkin.

**Metodlar o'zgaruvchi ichidagi asl matnni o'zgartirmaydi!**

## INPUT —FOYDALANUVCHI BILAN MULOQOT

Shu paytgacha biz o'zgaruvchilarning qiymatini dasturning ichida berayotgan edik. Keling endi qiymatni o'zimiz emas, balki dastur foydalanuvchilariga kiritish imkonini beramiz.&#x20;

Buning uchun `input()` funktsyasidan foydalanamiz.&#x20;

```python
ism = input("Ismingiz nima?")
print("Assalom alaykum, " + ism)
```

Yuqoridagi dastur, avval 1-qatorda foydalanuvchining ismini so'raydi. Foydalanuvchi ismini kiritib, **Enter** tugmasini bosgach, foydalanuvchi kiritgan matn`ism` degan o'zgaruvchiga yuklanadi va dasturining 2-qatori bajaradi:

Natija:

`Ismingiz nima?anvar`

`Assalom alaykum, anvar`

Keling yuqoridagi kod va uning natijasini chiroyliroq ko'rinishga keltiramiz.

```python
ism = input("Ismingiz nima?\n>>>") # Foydalanuvchi ismini yangi qatordan kiritadi
print("Assalom alaykum, " + ism.title())
```

![Foydalanuvchidan qiymat olish](/files/-MLgalhJF6uRE0GABSmk)

## AMALIYOT

Quyidagi mashqlarni bajaring:

* Quyidagi o'zgaruvchilarni yarating:&#x20;
  * `kocha="Bog'bon"`
  * `mahalla="Sog'bon"`
  * `tuman="Bodomzor"`&#x20;
  * `viloyat="Samarqand"`
* Yuqoridagi o'zgaruvchilarni jamlab, quyidagi ko'rinishda konsolga chiqaring:
  * `Bog'bon ko'chasi, Sog'bon mahallasi, Bodomzor tumani, Samarqand viloyati`
* Yuqoridagi o'zgaruvchilarning (`kocha`, `mahalla`, `tuman`, `viloyat`) qiymatini foydalanuvchidan so'rang. Va avvalgi mashqni takrorlang.
* Yuqoridagi matnni konsolga chiqarishda har bir verguldan keyin yangi qatordan yozing
* Yuqoridagi matnni **f-string** yordamida, yangi, `manzil` deb nomlangan o'zgaruvchiga yuklang
* `manzil`ga biz yuqorida o'rgangan `title()`, `upper()`, `lower()` , `capitalize()` metodlarini qo'llab ko'ring.
* Quyidagi o'zgaruvchilarni yarating:&#x20;
  * `kocha="Bog'bon"`
  * `mahalla="Sog'bon"`
  * `tuman="Bodomzor"`&#x20;
  * `viloyat="Samarqand"`
* Yuqoridagi o'zgaruvchilarni jamlab, quyidagi ko'rinishda konsolga chiqaring:
  * `Bog'bon ko'chasi, Sog'bon mahallasi, Bodomzor tumani, Samarqand viloyati`
* Yuqoridagi o'zgaruvchilarning (`kocha`, `mahalla`, `tuman`, `viloyat`) qiymatini foydalanuvchidan so'rang. Va avvalgi mashqni takrorlang.
* Yuqoridagi matnni konsolga chiqarishda har bir verguldan keyin yangi qatordan yozing
* Yuqoridagi o'zgaruvchilarni **f-string** yordamida, yangi, `manzil` deb nomlangan o'zgaruvchiga yuklang
* `manzil`ga biz yuqorida o'rgangan `title()`, `upper()`, `lower()` , `capitalize()` metodlarini qo'llab ko'ring.

## JAVOBLAR

05-dars javoblari

---''',
    vocabularyRaw: '''f-string	Matn ichiga o\'zgaruvchi joylash formatlash turi	f\"Salom {ism}\"
.upper()	Matnni to\'liq katta harfga o\'tkazish	text.upper()
.lower()	Matnni to\'liq kichik harfga o\'tkazish	text.lower()
.title()	So\'zlar bosh harfini katta qilish	text.title()
.strip()	Ikki tarafdagi bo\'shliqlarni tozalash	text.strip()''',
    exercises: [
      Exercise(
        number: 1,
        question: '''ism=\'ali\' o\'zgaruvchisini bosh harfini katta qilib chiqaradigan metodni yozing.''',
        answer: '''ism = \'ali\'
print(ism.title())''',
      ),
      Exercise(
        number: 2,
        question: '''f-string yordamida ism=\'Anvar\' va familiya=\'Narz\' o\'zgaruvchilarini birlashtirib chiqaring.''',
        answer: '''ism = \'Anvar\'
familiya = \'Narz\'
print(f\"{ism} {familiya}\")''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 6,
    title: '''Sonlar (Integers va Floats)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/ozgaruvchilar-va-malumot-turlari/06-sonlar.md).

Dasturlash davomida turli sonlar bilan ishlash tabiiy hol. Pythonda sonlarning bir necha turlari bor. Keling ular bilan yaqindan tanishaylik.

## INTEGERS — BUTUN SONLAR

Butun sonlarni ham o'zgaruvchida saqlash, ularning ustida qo'shish (`+`), ayirish (`-`), ko'paytirish(`*`), bo'lish (`/`) kabi [arifmetik amalarni ](https://python.sariq.dev/ilk-qadamlar/03-print#arifmetik-amallar)bajarish mumkin:

```python
a = 20  # Sonlar musbat yoko
b = -30 # manfiy bo'lishi mumkin
c = a + b
print(c)
```

Natija: `-10`

Python - operatorlar orasidagi bo'shliqlarni inobatga olmaydi. O'qishga qulay bo'lishi uchun yuqoridagi kabi (bo'shliqlar bilan) yozishingiz mumkin.

```python
# Kvadratning yuzini hisoblaymiz
kvdrt_tmni = 20 # Kavdratning tomoni 20 ga teng
kvdrt_yuzi = kvdrt_tmni**2 # Kvadrat yuzini hisoblaymiz
print(kvdrt_yuzi)
```

Natija: `400`

## FLOATS — O'NLIK SONLAR

Pythonda o'nlik sonlar **floating point numbers** yoki qisqa qilib **floats** deyiladi. "*Floating point numbers*" atamasini o'zbek tiliga "*suzuvchi nuqtali sonlar*" deb tarjima qilish mumkin. Ingliz tilida o'nlik sonlarni yozishda vergul (`,`) emas nuqta (`.`) belgisi ishlatiladi, va bu nuqta sonning katta kichikligiga qarab joyi o'zgargani uchun *"floating"* *(suzuvchi)* deyiladi.

```python
pi = 3.14159 # o'nlik son (float)
radius = 10  # butun son (integer)
diametr = 2*radius
print("Aylana uzunligi ", pi*diametr, " ga teng.")
```

Natija: `Aylana uzunligi 4.712384999999999 ga teng.`

## BUTUN SONDAN O'NLIK SONGA

Avval aytganimizdek ikki butun sonni bo'lish (`/`) natijasida o'nlik son hosil bo'ladi (natija butun bo'lsa ham).&#x20;

```python
a = -20
b = 40
c = b/a
print(c) # natija o'nlik son bo'ladi
```

Natija: `-2.0`

Shuningdek butun va o'nlik sonlar o'rtasidagi har qanday arifmetik amallarning natijasi ham o'nlik son bo'ladi.

```python
a = 2
b = 3.0
# Quyidagi arifmetik amallarning natijasi o'nlik son hosil qiladi
print(a+b) 
print(a*b)
print(a**b)
print(2*(a+b))
```

Natijalar:

`2.0`

`5.0`

`6.0`

`8.0`

`10.0`

## UZUN SONLARNI KIRITISH

Uzun sonlarni kiritishda, qulaylik uchun, raqamlarni pastki chiziq (`_`) yordamida guruhlash mumkin. Python - son tarkibidagi pastki chiziqlarni (`_`) inobatga olmasdan, uzun sonligicha qabul qiladi.

```python
aholi_soni = 7_594_000_000 # o'zmizga qulay bo'lishi uchun shinday yozdik
print("Yer kurrasida", aholi_soni, " ga yaqin odam yashaydi")
```

Natija: `Yer kurrasida 7594000000 ga yaqin odam yashaydi`

## KONSTANTA

Aksar dasturlash tillarida konstant qiymatlar tushunchasi bor. Konstantlar o'zgarmas bo'ladi (misol uchun\$\$\pi\$\$ ning qiymati konstant, o'zgarmas qiymat). Pythonda konstant tushunchasi yo'q, shuning uchun dasturchilar bunday o'zgaruvchilarning nomini katta harflar bilan yozadilar (*ogohlantirish sifatida*). Bu albatta qat'iy qonun emas, lekin kelajakda o'zgaruvchilar orasida konstant qiymatlarni ajratish uchun yaxshi usul.

```python
PI = 3.14159
raduis = 21.2
```

## BIR NECHTA O'ZGARUVCHIGA QIYMAT BERISH

Birdaniga bir nechta o'zgaruvchiga qiymat berish uchun o'zgaruvchilar va ularga mos qiymatlar vergul `(,)` bilan ajratiladi:

```python
x, y, z = 10, -7.25, -30
```

Yuqoridagi kod `x` ga `10`, `y` ga `-7.25`, va `z` ga `-30` qiymatini yuklaydi.

## O'ZGARUVCHI TURINI ALMASHTIRISH

Keling quyidagi misolni ko'raylik, maqsadimiz `ism` va `yosh` degan ikki o'zgaruvchini yangi `xabar` degan o'zgaruvchiga yuklab, `"Jobir 16 yoshda"` degan matnni konsolga chiqarish:

```python
ism = 'Jobir'
yosh = 36
xabar = ism + ' ' + yosh + ' yoshda'
print(xabar)
```

Natija: **`TypeError: can only concatenate str (not "int") to str`**

Afsuski, kutilgan natija o'rniga xatolik chiqdi. Agar xatoni ingliz tilidan tarjima qilsak, matn (str) va son (int) ni jamlab bo'lmaydi degan ma'no chiqadi.&#x20;

Demak Pythonda matn (string) va son (int, float) turidagi o'zgaruvchilarni jamlab bo'lmas ekan. Xo'sh, bunga yechim bormi? **Albatta**.&#x20;

Pythonda bir turdagi o'zgaruvchini boshqa turga o'tkazish mumkin, bu ingliz tilida ***typecasting*** detiladi. Buning uchun Pythonda mahsus funktsiyalar bor, keling ular bilan tanishamiz:

* `str()`— int yoki float turidagi sonlarni matnga o'zgartiradi.
* `int()`— matn yoki float ko'rinishidagi qiymatlarni butun songa o'zgartiradi. Bunda matn butun son ko'rinishida bo'lishi kerak.
* `float()`— matn yoki int ko'rinishidagi qiymatlarni o'nlik songa o'zgartiradi.

Demak, yuqoridagi kod to'g'ri ishlashi uchun 3-qatorni quyidagicha o'zgartiramiz:

```python
ism = 'Jobir'
yosh = 36
xabar = ism + ' ' + str(yosh) + ' yoshda'
print(xabar)
```

Natija: `Jobir 36 yoshda`

`str(yosh)` kodi `yosh` degan o'zgaruvchining qiymatini matn ko'rinishida ko'rsatdi xolos. Asl o'zgaruvchining qiymati sonligicha qoladi. `int()` va `float()`ham huddi shunday ishlaydi.

## O'ZGARUVCHI TURINI TEKSHIRISH

Kodimizda o'zgaruvchilar ko'payib ketdi. Yuqoridagi kabi xatolar qilmaslik uchun ba'zida o'zgaruvchinig turini tekshrish talab qilinadi. Buning uchun `type()` funktsiyasidan foydalanamiz:

```python
ism = 'Jobir'
yosh = 36
print(type(ism))  # ism degan o'zgaruvchining turini konsolga chiqaramiz
print(type(yosh)) # ismyosh degan o'zgaruvchining turini konsolga chiqaramiz
```

Natija:&#x20;

`<class 'str'>`

`<class 'int'>`

Kurib turganingizdek, `ism` nomli o'zgaruvchi`'str'` ya'ni matn, `yosh` esa `'int'` son turida ekan.

## `INPUT()` VA SONLAR

Avvalgi darsimizda foydalanuvchidan ma'lumot olish uchun input() funktsyasidan foydalanishni o'rgandik. Kelin endi shu funktsiya yordamida foydalanuvchidan son olishni ko'raylik. Quyidagi kod foydalanuvchining tug'ilgan yilini so'raydi va uning yoshini hisoblab beradi:

```python
#1 foydalanuvchining tug'ilgan yilini so'raymiz
t_yil = input("Tug'ilgan yilingizni kiriting: ")
#2 foydalanuvchi yoshini xisoblaymiz
yosh = 2020 - t_yil # 
#3 foydalanuvchi yoshini konsolga chiqaramiz
print("Siz " + yosh + " yoshda ekansiz")
```

![](/files/-MLlO3YahEjv90pUVBMt)

Natija: **`TypeError: unsupported operand type(s) for -: 'int' and 'str'`**

Kutilgan natija o'rniga xatolik. Lekin xato qayerda? Dastur tug'ilgan yilimni so'radi, men `1983` deb kiritdim va shu zaxoti xato ro'y berdi va dastur to'xtadi. Xatoni tarjima qilsak son (int) va matn (str) o'rtasida ayirish (`-`) amalini bajarib bo'maydi deyapti.

Gap shundaki, `input()` funktsiyasi har qanday kiritilgan qiymatni matn (string) ko'rinishida qabul qiladi (garchi biz son kiritgan bo'lsak ham). Keling, konsolda `t_yil` degan o'zgaruvchining turini tekshirib ko'ramiz.

![](/files/-MLlPEmNc-bRsDfbd3Ib)

Ko'rib turganingizdek `t_yil` o'zgaruvchisi saqlayotgan qiymat `str` ya'ni matn ekan. Kodimizning 2 va 6-qatorlarini o'zgartiramiz:

```python
#1 foydalanuvchining tug'ilgan yilini so'raymiz va qiymatni int ga aylantiramiz
t_yil = int(input("Tug'ilgan yilingizni kiriting: "))
#2 foydalanuvchi yoshini xisoblaymiz
yosh = 2020 - t_yil # 
#3 foydalanuvchi yoshini konsolga chiqaramiz
print("Siz " + str(yosh) + " yoshda ekansiz")
```

Natija:&#x20;

`Tug'ilgan yilingizni kiriting: 1983`&#x20;

`Siz 37 yoshda ekansiz`

Yuqoridagi kodning 2-qatoriga e'tibor bersangiz, biz ikki funktsiyani bir biriga joylab yozdik (`int(input()`). Aslida, ajratib ham yozishimiz mumkin edi:

```python
#1.1 foydalanuvchining tug'ilgan yilini so'raymiz
t_yil = input("Tug'ilgan yilingizni kiriting: ")
#1.2 t_yil o'zgaruvchini int ga aylantiramiz
t_yil = int(t_yil)
#2 foydalanuvchi yoshini xisoblaymiz
yosh = 2020 - t_yil # 
#3 foydalanuvchi yoshini konsolga chiqaramiz
print("Siz " + str(yosh) + " yoshda ekansiz")
```

## AMALIYOT

Quyidagi dasturlarning har birini alohida fayl ko'rinishida yozing va bajaring:

* Foydalanuvchi kiritgan sonning kvadrati va kubini konsolga chiqaruvchi dastur

![](/files/-MLqbUCW4fuICo4zdkrD)

* Foydalanuvchining yoshini so'rab, uning tug'ilgan yilini hisoblab, konsolga chiqaruvchi dastur

![](/files/-MLlYLnFPKXzahFJOvR5)

* Foydalanuvchidan ikki son kiritshni so'rab, kiritilgan sonlarning yig'indisi, ayirmasi, ko'paytmasi va bo'linmasini chiqaruvchi dastur

![](/files/-MLmD9nxgqMpimSgbVKf)

## JAVOBLAR

---''',
    vocabularyRaw: '''int	Butun sonlar turi (Integer)	yosh = 15
float	Kasr sonlar turi (Floating point number)	pi = 3.14
type()	Ma\'lumot turini aniqlash funksiyasi	type(x)''',
    exercises: [
      Exercise(
        number: 1,
        question: '''type(4.5) funksiyasi qanday javob qaytaradi?''',
        answer: '''<class \'float\'>''',
      ),
      Exercise(
        number: 2,
        question: '''int(\'15\') stringni qaysi turga o\'tkazadi?''',
        answer: '''integer''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 7,
    title: '''List (Ro\'yxat) bilan tanishuv''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/ozgaruvchilar-va-malumot-turlari/07-lists.md).

## LIST BILAN TANISHAMIZ

Avvalgi darsimizda biz o'zgaruvchi yaratish, va uning ichida biror qiymatni (matn yoki son) saqlashni o'rgandik. Bunda biz bitta o'zgaruvchiga bitta qiymat berdik xolos.&#x20;

Bugun o'rganadigan navbatdagi mal'umot turi **List** (**ro'yxat**) deb ataladi. Ro'yxat o'z nomi bilan, bitta o'zgaruvchida bir nechta qiymatlarni saqlash imkonini beradi. Bu qiymatlar List **elementlari** deyiladi. Ro'yxatda son, matn yoki aralash turdagi elementlarni saqlash mumkin.&#x20;

List quyidagicha yaratiladi:

```python
mevalar = ['olma', 'anjir', 'shaftoli', "o'rik"] # mevalar ro'yxati (matnlar)
narhlar = [12000, 18000, 10900, 22000] # narhlar ro'yxati (sonlar)
sonlar = ['bir', 'ikki', 3, 4, 5] # sonlar va matnlar aralash ro'yxat
ismlar = [] # bo'sh ro'yxat
```

Ro'yxat saqlaydigan o'zgaruvchilarni nomlashda *-lar*  (ko'plik) qo'shimchasini qo'shish maqsadga muvofiq bo'ladi (inlgiz tilida *-s*).&#x20;

Misol uchun: `mevalar`, `uylar`, `cars`, `toys`, `books`&#x20;

## LIST ELEMENTLARI

Ro'yxatdagi har bir element tartib bilan joylashgani sababli, biz istalgan elementga uning tartib raqami (indeksi) bo'yicha murojat qilishimiz mumkin.&#x20;

Dasturlash olamida indeks `0` dan boshlanadi! Ya'ni Listning birinchi elementing tartib raqami (indeksi) `0` ga, ikkinchi elementning indeksi `1` ga teng va hokazo.

```python
mevalar = ['olma', 'anjir', 'shaftoli', "o'rik"] # mevalar ro'yxati (matnlar)
print("Birinchi meva: ", mevalar[0])
print("Ikkinchi meva: ", mevalar[1])
```

Natija:&#x20;

`Birinchi meva: olma`&#x20;

`Ikkinchi meva: anjir`

Agar list ichidagi elementlar matn ko'rinishid bo'lsa, ularga [string metodlarni](https://python.sariq.dev/ozgaruvchilar-va-malumot-turlari/05-string#string-metodlari) qo'llashimiz mumkin:

```python
mevalar = ['olma', 'anjir', 'shaftoli', "o'rik"] # mevalar ro'yxati (matnlar)
print("Birinchi meva: ", mevalar[0].title())
print("Ikkinchi meva: ", mevalar[1].upper())
```

Natija:

`Birinchi meva: Olma`&#x20;

`Ikkinchi meva: ANJIR`

List elementlari ustida arifmetik amallar bajarish:

```python
narhlar = [12000, 18000, 10900, 22000]
print(narhlar[2] + narhlar[3])
```

Natija: `32900`

Pythonda Listning eng oxirgi elementiga `-1` indeksi orqali ham murojat qilish mumkin. Bu usul Listning uzunligini bilmaganda juda asqotadi.

```python
car_models = ['Toyota', 'GM', 'Volvo', 'BMW', 'Hyundai', 'Kia', 'Volkswagen']
print(car_models[-1]) # Listning eng oxirgi elementiga -1 bilan murojat qilamiz 
```

Natija: `Volkswagen`

## ELEMENTLARNI QO'SHISH, O'CHIRISH VA O'ZGARTIRISH

Dastur davomida listning tarkibi o'zgarishi, yangi elementlar qo'shilishi, ba'zi elementlar o'chirilishi tabiiy hol. Misol uchun "Bozorlik ro'yxati" degan dasturni tasavvur qilaylik, foydalanuvchi ro'yxatga yangi mahsulotlar qo'shishi, sotib olganlarini esa o'chrishi mumkin.&#x20;

### &#x20;Elementni o'zgartirish

Ro'yxatdagi biror elementning qiymatini o'zgartirish uchun, o'sha elementga indeksi bo'yicha murojat qilamiz va yangi qiymat yuklaymiz

```python
narhlar = [12000, 18000, 10900, 22000]
narhlar[0] = 13000 # 1-qiymatni 13000 ga o'zgartiramiz
narhlar[2] = 11000 # 3-qiymatni 11000 ga o'zgartiramiz
narhlar[3] = narhlar[3]+2000 # 4-qiymatga 2000 qo'shamiz
print(narhlar)
```

Natija: `[13000, 18000, 11000, 24000]`

### Yangi element qo'shish

#### `.append()` metodi

Ro'yxatga yangi element qo'shishning oson usuli bu **`.append()`** metodi yordamida ro'yxatning **oxiriga** qiymat qo'shish:

```python
mevalar = ['olma', 'anjir', 'shaftoli', "o'rik"]
mevalar.append("tarvuz") # mevalar ga tarvuz qo'shamiz
print(mevalar)
```

Natija: `['olma', 'anjir', 'shaftoli', "o'rik", 'tarvuz']`

**`.append()`** metodi bo'sh ro'yxatni to'ldrisihda juda qulay usul. Odatda dastur boshida bo'sh ro'yxat yaratilib, dastur davomida ro'yxat foydalanuvchi tomonidan to'ldirib borilishi odatiy hol.

```python
cars = [] # bo'sh ro'yxat yaratamiz
cars.append('Lacetti') # ro'yxatga Lacetti mashinasini qo'shamiz
cars.append('Nexia 3') # ro'yxatga Nexia 3 mashinasini qo'shamiz
cars.append('Cobalt')  # ro'yxatga Cobalt  mashinasini qo'shamiz
print(cars)
```

Natija: `['Lacetti', 'Nexia 3', 'Cobalt']`

#### `.insert()` metodi

Ro'yxatning istalgan joyiga yangi element qo'shish uchun **`.insert()`** metodidan foydalanamiz. `.insert()` metodi ichida yangi elementning indeksi va qiymati beriladi:

```python
cars = ['Lacetti', 'Nexia 3', 'Cobalt']
cars.insert(0, 'Malibu') # 1-o'ringa yangi qiymat qo'shamiz
print(cars)
```

Natija: `['Malibu', 'Lacetti', 'Nexia 3', 'Cobalt']`

```python
cars.insert(2, 'Damas') # 3-o'ringa yangi qiymat qo'shamiz
print(cars)
```

Natija: `['Malibu', 'Lacetti', 'Damas', 'Nexia 3', 'Cobalt']`

### Elementni o'chirish

Ro'yxatdan biror elementni olib tashlash uchun uning indeksini yoki qiymatini bilishimiz lozim.

Inedks yordamida olib tashlash uchun **`del`** operatoridan foydalanamiz:

```python
mevalar = ['olma', 'anjir', 'shaftoli', "o'rik", 'anor']
del mevalar[1] # 2-element (anjir) ni o'chirib tashlaymiz
print(mevalar)
```

Natija: `['olma', 'shaftoli', "o'rik", 'anor']`

Element qiymati bo'yichi o'chirish uchun esa **`.remove(qiymat)`** metodidan foydalanamiz. Buning uchun qavs ichida o'chirib tashlash kerak bo'lgan qiymatni yozamiz

```python
mevalar = ['olma', 'anjir', 'shaftoli', "o'rik", 'anor']
mevalar.remove('shaftoli') # Ro'yxatdan shaftolini o'chirdik
print(mevalar)
```

Natija: `['olma', 'anjir', "o'rik", 'anor']`

**`.remove(qiymat)`** metodi ro'yxatda uchragan birinchi mos keluvchi qiymatni o'chiradi. Agar ro'yxatning ichida 2 va undan ko'p bir hil qiymatli elementlar bo'lsa, ulardan eng birinchisi o'chadi.

```python
hayvonlar = ['it', 'mushuk', 'sigir', 'qo\'y', 'quyon', 'mushuk']
hayvonlar.remove("mushuk") # Ro'yxatda 2 ta mushuk bor, ulardan birinchisi o'chadi
print(hayvonlar)
```

Natija: `['it', 'sigir', "qo'y", 'quyon', 'mushuk']`

### Elementni sug'urib olish

Ba'zida biror elementni butunlay o'chirib tashlash emas, balki uni ro'yxatdan sug'urib olish va undan foydalanish talab qilinishi mumkin. Buning uchun Pythonda **`.pop(indeks)`** metodidan foydalanmiz.

```python
bozorlik = ["yog'", 'un', 'piyoz', 'banan', "go'sht"]
mahsulot = bozorlik.pop(3) # Ro'yxatdan banan ni sug'urib olamiz
print("Men " + mahsulot + " sotib oldim")
print("Olinmagan mahsulotlar: ", bozorlik)
```

Natija:

`Men banan sotib oldim`&#x20;

`Olinmagan mahsulotlar: ["yog'", 'un', 'piyoz', "go'sht"]`

Agar **`.pop()`** metodida indeks berilmasa, ro'yxatdan o'xirgi qiymat sug'urib olinadi.

## AMALIYOT

Quyidagi mashqlarni bajaring:

* `ismlar` degan ro'yxat yarating va kamida 3 ta yaqin do'stingizning ismini kiriting
* Ro'yxatdagi har bir do'stingizga qisqa xabar yozib konsolga chiqaring:&#x20;

![](/files/-MLvbRkA4uEAqqhKk6Yi)

* `sonlar` deb nomlangan ro'yxat yarating va ichiga turli sonlarni yuklang (musbat, manfiy, butun, o'nlik).&#x20;
* Yuqoridagi ro'yxatdagi sonlar ustida turli arifmetik amallar bajarib ko'ring. Ro'yxatdagi ba'zi sonlarning qiymatini o'zgartiring, ba'zilarini esa almashtiring.&#x20;
* `t_shaxslar`va `z_shaxslar` degan 2 ta ro'yxat yarating va biriga o'zingiz eng ko'p hurmat qilgan tarixiy shaxslarning, ikkinchisiga esa zamonamizdagi tirik bo'lgan shaxslarning ismini kiriting.&#x20;
* Yuqoridagi ro'yxatlarning har biridan bittadan qiymatni sug'urib olib (**`.pop()`**), quyidagi ko'rinishda chiqaring:

![](/files/-MLyyn0plvxsTJKVHnxQ)

* `friends`nomli bo'sh ro'yxat tuzing va unga `.append()` yordamida 5-6 ta mehmonga chaqirmoqchi bo'lgan do'stlaringizni kiriting.&#x20;
* Yuqoridagi ro'yxatdan mehmonga kela olmaydigan odamlarni `.remove()` metodi yordamida o'chrib tashlang.&#x20;
* Ro'yxatning oxiriga, boshiga va o'rtasiga yangi ismlar qo'shing.
* Yangi `mehmonlar`deb nomlangan bo'sh ro'yxat yarating. `.pop()` va `.append()` metodlari yordamida mehmonga kelgan do'stlaringizning ismini friends ro'yxatidan sug'urib olib, mehmonlar ro'yxatiga qo'shing.

## JAVOBLAR

\#07-dars javoblari

---''',
    vocabularyRaw: '''[]	Ro\'yxat yaratish qavslari	mevalar = []
append()	Ro\'yxat oxiriga element qo\'shish metodi	list.append(\'olma\')
insert()	Belgilangan indeksga element qo\'shish	list.insert(0, \'anor\')''',
    exercises: [
      Exercise(
        number: 1,
        question: '''mevalar = [\'olma\', \'anor\'] ro\'yxatiga \'uzum\'ni append() orqali qo\'shing.''',
        answer: '''mevalar = [\'olma\', \'anor\']
mevalar.append(\'uzum\')
print(mevalar)''',
      ),
      Exercise(
        number: 2,
        question: '''mevalar ro\'yxatining 1-indeksidagi elementini ekranga chiqaring.''',
        answer: '''print(mevalar[1])''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 8,
    title: '''Ro\'yxat elementlari va Tuples''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/ozgaruvchilar-va-malumot-turlari/08-list-tuple.md).

## RO'YXATNI TARTIBLASH

Aksar holatlarda ro'yxat ichidagi elementlarni alifbo ketma-ketligida tartiblash talab qilinishi mumkin. Buning uchun list uchun maxsus **`.sort()`** metodidan foydalanamiz.

```python
cars = ['bmw','mercedes benz', 'volvo', 'general motors', 'tesla', 'audi']
cars.sort()
print(cars)
```

Natija: `['audi', 'bmw', 'general motors', 'mercedes benz', 'tesla', 'volvo']`

Kurib turibsiz, yuqoridagi ro'yxatimiz alifbo bo'yicha tartiblandi.

**Diqqat!** Tartiblashda katta harflar kichik harflardan avval kelishini hisobga oling. Agar matndagi so'zlarning bosh harfi katta-kichik aralash yozilgan bo'lsa, ularni bir ko'rinishga keltirib olish maqsadga muvofiq bo'ladi.

```python
cars = ['Bmw','mercedes benz', 'volvo', 'gm', 'tesla', 'audi']
cars.sort()
print(cars)
```

Natija: `['Bmw', 'audi', 'gm', 'mercedes benz', 'tesla', 'volvo']`

Yuqoridagi misolda 'Bmw' elementi katta harf bilan boshlangani uchun ro'yxatning boshidan joy oldi.

Ro'yxatni teskari tartibda saqlash uchun `.sort()` metodi ichida `reverse=True` argumentini ham kiritamiz.&#x20;

```python
cars = ['bmw','mercedes benz', 'volvo', 'general motors', 'tesla', 'audi']
cars.sort(reverse=True)
print(cars)
```

Natija: `['volvo', 'tesla', 'mercedes benz', 'general motors', 'bmw', 'audi']`

**`.sort()`** metodi ro'yxatni tartiblaydi. Ba'zida asl ro'yxat ichidagi elementlarning ketma-ketligini buzmagan holda ro'yxatni tartiblash talab qilinishi mumkin. Buning uchun **`sorted()`** funktsiyasidan foydalanamiz:

```python
mehmonlar = ['Odil', 'Hamid', 'Temur', 'Avazbek', 'Farruh', 'Shamsiddin']
print("sorted() qaytargan ro'yxat:", sorted(mehmonlar))
print("Asl ro'yxat o'zgarmas qoldi:", mehmonlar)
```

Natija:

`sorted() qaytargan ro'yxat: ['Avazbek', 'Farruh', 'Hamid', 'Odil', 'Shamsiddin', 'Temur']`

`Asl ro'yxat o'zgarmas qoldi: ['Odil', 'Hamid', 'Temur', 'Avazbek', 'Farruh', 'Shamsiddin']`

**`sorted()`** funktsiyasi yordamida teskari tartiblash uchun ham **`reverse=True`** argumentini beramiz:

```python
print(sorted(mehmonlar, reverse=True))
```

Natija: `['Temur', 'Shamsiddin', 'Odil', 'Hamid', 'Farruh', 'Avazbek']`

Yuoqridagi ikki usul bilan sonli ro'yxatlarni ham tartiblashimiz mumkin:

```python
ages = [12, 98, 34, 65, 34, 76, 11]
ages.sort()
print(ages)
print(sorted(ages, reverse=True))
```

Natija:

`[11, 12, 34, 34, 65, 76, 98]`

`[98, 76, 65, 34, 34, 12, 11]`

## RO'YXATNI AYLANTIRISH

Ba'zida ro'yxatni aylantirish (boshini oxiriga, oxirini boshiga) talab qilinishi mumkin. Buning uchun **`.reverse()`** metodidan foydalanamiz.

```python
fruits = ['pear','banana','apple','watermelon','lemon']
fruits.reverse()
print(fruits)
```

Natija: `['lemon', 'watermelon', 'apple', 'banana', 'pear']`

Natija va asl ro'yxatni solishtiring.

## RO'YXATNING UZUNLIGINI BILISH

Ro'yxatning uzunligi, ya'ni uning ichidagi elementlar sonini aniqlash uchun **`len()`** funktsiyasidan foydalanamiz:

```python
fruits = ['pear','banana','apple','watermelon','lemon']
print("Elementlar soni:",len(fruits)) # len(fruits) ro'yxat uzunligini qaytaradi
```

Natija: `Elementlar soni: 5`

## `range()` FUNKTSIYASI

Bu funktsiya yordamida biz ma'lum oraliqdagi sonlar ketma-ketligini yaratishimiz mumkin. **`list()`** funktsiyasi yordamida esa bu oraliqni ro'yxat shaklida saqlab olamiz:

```python
sonlar = list(range(0,10)) # 
print(sonlar)
```

Natija: `[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]`

Yuqoridagi misolda `range(0,10)` funktsiyasi `0` dan `9` gacha sonlar ketma-ketligini shakllantirdi, `list(range(0,9))` esa bu ketma-ketlikni ro'yxatga aylantirdi.

**Diqqat!** E'tibor qiling **`range()`** funktsiyasi ikkinchi indeksdan bitta avval to'xtaydi.

**`range()`** yordamida qadamni ham berishimiz mumkin:

```python
juft_sonlar = list(range(0,20,2)) # 0 dan 20 gacha 2 qadam bilan
toq_sonlar = list(range(1,20,2))  # 1 dan 20 gacha 2 qadam bilan
print("Juft sonlar: ", juft_sonlar)
print("Toq sonlar: ", toq_sonlar)
```

Natija:

`Juft sonlar: [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]`&#x20;

`Toq sonlar: [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]`

Agar sonlar ketma-ketligi 0 dan boshlansa, `range()` funktsiyasida yakuniy indeksni ko'rsatish kifoya. Misol uchun `range(0,10)` emas `range(10)` deb yozsak ham bo'laveradi.

## SONLI RO'YXAT USTIDA SODDA AMALLAR

Pythonda ro'yxatlar ustida ba'zi sodda amallarni ham bajarish mumkin. Misol uchun ro'yxatdagi eng kichik sonni topish uchun **`min()`** funktsiyasidan, eng katta sonni topish uchun esa **`max()`** funktsiyasidan, sonlarning yig'indisini topish uchun esa **`sum()`** funktsyasidan foydalansak bo'ladi:

```python
narhlar = [12000, 22500, 23456, 9800, 5600, 9934, 32874]
arzon = min(narhlar)
qimmat = max(narhlar)
jami = sum(narhlar)
print("Eng arzon narh ", arzon, ". Eng qimmati ", qimmat, ". Jami: ", jami)
```

Natija: `Eng arzon narh 5600 . Eng qimmati 32874 . Jami: 116164`

## RO'YXATNI KESISH

Ba'zida ro'yxatning ma'lum bir bo'lagini ajratib olish talab qilinishi mumkin, deylik biz quyidagi cars degan ro'yxatdan birinchi 3 ta elementni ajratib olmoqchimiz, buning uchun biz boshlang'ich va oxirgi indekslarni beramiz:

```python
cars = ['bmw','mercedes benz', 'volvo', 'general motors', 'tesla', 'audi']
my_cars = cars[0:3] # 0-indeskdan boshlab 3 ta element ajratib olamiz
print(my_cars) 
```

Natija: `['bmw', 'mercedes benz', 'volvo']`

**Diqqat!** Python 2-indeksdan bitta avval to'xtaydi. Yuqoridagi misolda ham 0,1,2-elementlar ajratib olindi.

Bu usul bilan ro'yxatning istalgan joyidan bo'lishimiz mumkin:

```python
print(cars[2:5]) # 2-3-4-elementlarni ajratib olamiz (5 kirmaydi)
```

Natija: `['volvo', 'general motors', 'tesla']`

Agar boshlang'ich indeksni bermasangiz, Python avtomat ravishda `0` indeksdan boshlab kesadi. Agar 2-indeksni kiritmasangiz, ro'yxat oxirigacha kesadi:

```python
print(cars[:4]) # Ro'yxat boshidan 4-gacha kesadi (0,1,2,3)
print(cars[2:]) # 2-elementdan boshlab ro'yxat oxirigacha kesib oladi
```

Natija:

`['bmw', 'mercedes benz', 'volvo', 'general motors']`&#x20;

`['volvo', 'general motors', 'tesla', 'audi']`

## RO'YXATDAN NUSXA OLISH

Dastur davomida biror ro'yxatdan nusxa olish talab qilinishi mumkin. Buning uchun biz tenglik(`=`) belgisidan foydalansak bo'ladimi? Quyidagi misolga e'tibor bering:

```python
sonlar = [1, 2, 3, 4, 5] # donlar degan ro'yxat yaratamiz
sonlar2 = sonlar # sonlar2 degan ro'yxatni sonlar ga tenglaymiz
sonlar2.append(6) # sonlar2 ga 6 sonini qo'shamiz
sonlar2.append(7) # sonlar2 ga 7 sonini qo'shamiz
print("Bu sonlar ro'yxati:", sonlar)
print("Bu sonlar2 ro'yxati:", sonlar2)
```

Natija:

`Bu sonlar ro'yxati: [1, 2, 3, 4, 5, 6, 7]`&#x20;

`Bu sonlar2 ro'yxati: [1, 2, 3, 4, 5, 6, 7]`

Natija biz kutgandek chiqdimi? Yo'q. Biz 6 va 7 sonlarini `sonlar2` degan ro'yxatga qo'shgan edik, lekin bu ikki son `sonlar` degan asl ro'yxatga ham qo'shilib qoldi.&#x20;

Demak yuqorida biz `sonlar2=sonlar` deb yozgan komandamiz yangi ro'yxat yaratish o'rniga, ikkala o'zgaruvchini ham bitta ro'yxatga bog'lab (yo'naltirib) qo'ydi. Biz `sonlar` yoki `sonlar2` ustida bajargan amallarimiz aslida bitta ro'yxat ustida bajarilyapti.

![Ikki o'zgaruvchi, bir ro'yxat](/files/-MMJv_JeF1G7uIfp5RRc)

Unda, qanday qilib ro'yxatdan nusxa olamiz? Buning uchun yuoqirdagi ka'bi ro'yxatni kesish usulidan foydalanamiz. Faqatgina, kvadrat qavs ichida ikkala indeksni ham ko'rsatmasdan, bo'sh qoldiramiz:

```python
sonlar = [1, 2, 3, 4, 5] # donlar degan ro'yxat yaratamiz
sonlar2 = sonlar[:] # [:] ro'yxatni to'liq ko'chirib oladi
sonlar2.append(6) # sonlar2 ga 6 sonini qo'shamiz
sonlar2.append(7) # sonlar2 ga 7 sonini qo'shamiz
print("Bu sonlar ro'yxati:", sonlar)
print("Bu sonlar2 ro'yxati:", sonlar2)
```

Natija:

`Bu sonlar ro'yxati: [1, 2, 3, 4, 5]`&#x20;

`Bu sonlar2 ro'yxati: [1, 2, 3, 4, 5, 6, 7]`

## TUPLES - O'ZGARMAS RO'YXAT

Dastur yaratish davomida o'zgarmas ro'yxat tuzish talab qilinishi mumkin. Pythonda bunday ro'yxatlar **tuples** deb yuritiladi. Tuple ichidagi qiymatlarni bir marta, dastur boshida beriladi va so'ngra o'zgartirib bo'lmaydi. List dan farqli ravishda, Tuple e'lon qilishda kvadrat qavslar `[]` o'rniga oddiy qavslar `()` ishlatiladi:

```python
tomonlar = (20, 30, 55.2)
print(tomonlar)
```

Natija: `(20, 30, 55.2)`

Tuple ichidagi elementlarga huddi ro'yxat elementlariga murojat qilingani kabi murojat qilinaveradi:

```python
toys = ('bus','car','bear','dino','snake','lizard')
print(toys[0])
print(toys[-1])
print(toys[2:5])
```

Natija:

`bus`&#x20;

`lizard`&#x20;

`('bear', 'dino', 'snake')`

Keling Tuple ichidagi biror elementning qiymatini o'zgartirib ko'ramiz:

```python
toys = ('bus','car','bear','dino','snake','lizard')
toys[3] = 'dragon'
```

Natija: **`TypeError: 'tuple' object does not support item assignment`**

Demak yuqorida ko'rib turganingiz kabi, bu operatsiya xatolikka olib keldi. Shu kabi ro'yxatdan biror elementni o'chirish yoki yangi element qo'shish ham mumkin emas.

Agar Tuple ga o'zgartirish talab qilinsa, yagona yo'li o'zgarmas ro'yxatni `list()` funktsiyasi yordamida **List** (oddiy ro'yxat) ko'rinishiga keltirib olish, o'zgarishlarni bajarsih va qaytarib `tuple()` funktsiyasi yordamida o'zgarmas ro'yxatga o'tkazish mumkin:

```python
toys = ('bus','car','bear','dino','snake','lizard') # o'zgarmas ro'yxat
toys = list(toys) # o'zgarmas ro'yxatni oddiy ro'yxatga (List) aylantiramiz
# Ro'yxatga o'zgartirishlar kiritamiz
toys.append('dragon')
toys.remove('bus')
toys[1] = 'mcqueen'
toys = tuple(toys) # Ro'yxatni qaytadan o'zgarmas ro'yxatga (Tuple) aylantiramiz
print(toys)
```

Natija: `('car', 'mcqueen', 'dino', 'snake', 'lizard', 'dragon')`

## AMALIYOT

* O'zingizga ma'lum davlatlarning ro'yxatini tuzing va ro'yxatni konsolga chiqaring
* Ro'yxatning uzunligini konsolga chiqaring
* `sorted()` funktsiyasi yordamida ro'yxatni tartiblangan holda konsolga chiqaring
* `sorted()` yordamida ro'yxatni teskari tartibda konsolga chiqaring
* Asl ro'yxatni qaytadan konsolga chiqaring
* `reverse()` metodi yordamida ro'yxatni ortidan boshlab chiqaring
* `sort()` metodi yordamida ro'yxatni avval alifbo bo'yicha, keyin esa alifboga teskari tartibda konsolga chiqaring.
* `120` dan `1200` gacha bo'lgan juft sonlar ro'yxatini tuzing
* Ro'yxatdagi sonlar yig'indisini hisoblang va konsolga chiqaring
* Ro'yxatdagi eng katta va eng kichik son o'rtasidagi ayirmani hisoblang va konsolga chiqaring
* Ro'yxatdagi elementlar sonini hisoblang
* Ro'yxatning boshidan, o'rtasidan va oxiridan 20 ta qiymatni konsolga chiqaring
* `taomlar` degan ro'yxat yarating va ichiga istalgan 5ta taomni kiriting
* `nonushta` degan yangi ro'yxatga `taomlar`dan nusxa oling
* Yangi ro'yxatda faqat nonushtaga yeyiladigan taomlarni qoldiring, va qo'shimcha 2 ta taom qo'shing
* Ikkala ro'yxatni ham (`taomlar` va `nonushta`) konsolga chiqaring
* Yuqoridagi nonushta ro'yxatini o'zgarmas ro'yxatga aylantiring va `nonushta[0] = "qaymoq va non"` deb qiymat berib ko'ring.

## JAVOBLAR

\#08-dars javoblari

---''',
    vocabularyRaw: '''.sort()	Ro\'yxatni alifbo bo\'yicha doimiy tartiblash	list.sort()
sorted()	Vaqtinchalik tartiblash funksiyasi	sorted(list)
len()	Ro\'yxat uzunligini (elementlar sonini) aniqlash	len(list)
tuple	O\'zgarmas ro\'yxat turi	t = (1, 2, 3)''',
    exercises: [
      Exercise(
        number: 1,
        question: '''sonlar = [5, 2, 8] ro\'yxatini tartiblovchi metodni yozing.''',
        answer: '''sonlar = [5, 2, 8]
sonlar.sort()
print(sonlar)''',
      ),
      Exercise(
        number: 2,
        question: '''Tuple yaratish qaysi qavslar yordamida bajariladi?''',
        answer: '''oddiy qavslar''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 9,
    title: '''For Takrorlash Operatorlari''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/ozgaruvchilar-va-malumot-turlari/09-for-loop.md).

## `for` BILAN TANISHAMIZ

Dasturlash davomida kodimizning biror qismini bir necha marta takrorlash talab etilishi mumkin. Misol uchun, ro'yxat ichidagi har bir elementni alohida qatordan konsolga chiqarish, yoki bo'lmasa har bir elementni kvdartaga oshirish va hokazo.&#x20;

Mana shunday vaziyatlarda bizga **`for`** operatori yordam beradi. Dasturlashda bu **tsikl** (**loop**) deb ataladi.&#x20;

Keling quyidagi misolni ko'ramiz. Bizda mehmonlar ro'yxati bor, biz har bir mehmonning ismini yangi qatordan chiqarmoqchimiz. Buning uchun quyidagi kodni yozamiz:

```python
mehmonlar = ['Ali','Vali','Hasan', 'Husan','Olim']
for mehmon in mehmonlar:
    print(mehmon)
```

Natija:

`Ali`

`Vali`

`Hasan`

`Husan`

`Olim`

Keling, kodni tahlil qilaylik.&#x20;

* 1-qatorda biz `mehmonlar` degan ro'yxat yaratdik va uni mehmonlarning ismi bilan to'ldirdik.
* 2-qatorda `for` tsiklini bohladik. Bu qator Pythonga `mehmonlar` degan ro'yxatdan har bir elementini olib uni yangi, `mehmon` degan o'zgaruvchiga yuklashni buyuryapti (*o'zgaruvchiga istalgan nom berishingiz mumkin. Biz tushunarli bo'lishi uchun* `mehmon` *deb atadik*)
* 3-qatorda biz `mehmon` degan o'zgaruvchining qiymatini konsolga chiqardik. Bu tsikl to `mehmonlar` ro'yxatida elementlar tugagunga qadar takrorlanadi.

"**For**" so'zi ingliz tilidan "**uchun**" deb tarjima qilinadi.

Yuqoridagi kodni oddiy tilga tarjima qilsak *"Mehmonlar ro'yxatidagi har bir mehmon **uchun** uning ismini konsolga chiqar"* degan ma'noni beradi.&#x20;

## `for` QANDAY ISHLAYDI

Keling yana bir misol ko'raylik.&#x20;

```python
mehmonlar = ['Ali','Vali','Hasan', 'Husan','Olim']
for mehmon in mehmonlar:
    print(f"Hurmatli {mehmon}, sizni 20 Dekabr kuni nahorga oshga taklif qilamiz")
    print("Hurmat bilan, Palonchiyevlar oilasi")
```

Natija:

![](/files/-MMPQyZT5FQp6KY-8-aY)

Yuqoridagi kodda 2-qator bu tsikl boshi deyiladi. Aynan shu qator kodimiz nech marta takrorlanishini aniqlaydi. Bizning holatimizda tsikl `mehmonlar` ro'yxati ichidagi elementlar tugagunga qadar takrorlanadi. Tsikl boshlanishi ikki nuqta (`:`) bilan tugaydi. Undan keyingi 3 va 4-qatorlar bu tsiklning badani deyiladi. &#x20;

Tsikl badani surilish (indentation) bilan ajratiladi, ya'ni tsiklning takrorlanuvchi qismi asosiy koddan bir muncha o'ngroqqa surilgan bo'ladi. Agar biz mana shu surilishni tark qilsak kodimiz xato beradi:

```python
mehmonlar = ['Ali','Vali','Hasan', 'Husan','Olim']
for mehmon in mehmonlar:
print(f"Hurmatli {mehmon}, sizni 20 Dekabr kuni nahorga oshga taklif qilamiz")
print("Hurmat bilan, Palonchiyevlar oilasi\n")
```

Natija: **`IndentationError: expected an indented block`**

Ko'rib turganingizdek for dan keyingi qatorni o'ngga surmaganimiz uchun **indentation error** (surishda xatolik) degan xabarni oldik.

Shunigdek, ko'pchilik yo'l qo'yadigan yana bir xato, qo'shimcha qatorlarni surish esdan chiqishi:

```python
mehmonlar = ['Ali','Vali','Hasan', 'Husan','Olim']
for mehmon in mehmonlar:
    print(f"Hurmatli {mehmon}, sizni 20 Dekabr kuni nahorga oshga taklif qilamiz")
print("Hurmat bilan, Palonchiyevlar oilasi\n")
```

Natija:

![](/files/-MMPUnWYBNdp6X7_11Mx)

Yuqoridagi kodimizda 4-qatorni o'ngga surmaganimiz uchun, Python bu qatorni tsikl tashqarisida deb qabul qildi va faqatgina 1 marta, tsikl tugaganidan so'ng bajardi.&#x20;

Huddi shu kabi agar takrorlanishi kerak bo'magan kodni tsikldan so'ng o'ngga surib qo'ysak Python bu qatorni tsiklning tarkibida deb hisoblab, qayta-qayta bajaradi:

```python
mehmonlar = ['Ali','Vali','Hasan', 'Husan','Olim']
for mehmon in mehmonlar:
    print(mehmon)
    
    print(mehmonlar) # bu qator tsikl tashqarisida bo'lishi kerak edi
```

![](/files/-MMPV_aHRkWeJtIwqwGW)

Yuoqirdagi misolda 5-qator o'ngga surilib qolgani uchun Python bu qatorni ham bir necha bor takrorlab, konsolga chiqardi. To'g'ri kod quyidagicha bo'ladi:

```python
mehmonlar = ['Ali','Vali','Hasan', 'Husan','Olim']
for mehmon in mehmonlar:
    print(mehmon)
    
print(mehmonlar)
```

## `for` YORDAMIDA SONLI RO'YXATLAR BILAN ISHLASH

Keling quyidagi misolni ko'ramiz

```python
sonlar = list(range(1,11))
for son in sonlar:
    print(f"{son} ning kvadrati {son**2} ga teng")
```

Natija:

![](/files/-MMPZMvGrHyynJZ4WQr7)

`for` yordamida yangi ro'yxat ham shakllantirish mumkin:

```python
sonlar = list(range(11)) # 1 dan 10 gacha sonlar ro'yxatini yaratamiz
sonlar_kvadrati =[] # bo'sh ro'yxat yaratamiz
for son in sonlar:  # sonlar dagi har bir son uchun
    sonlar_kvadrati.append(son**2) # uning kv.ni hisoblab, sonlar_kvadrati ga yuklaymiz

print(sonlar)
print(sonlar_kvadrati)
```

Natija:&#x20;

`[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

`[0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100]`

## `for` va `input()`

for operatori va input() funktsiyasini jamlab, ro'yxatni foydalanuvchidan olingan qiymatlar bilan to'ldirish mumkin:

```python
dostlar = [] # bo'sh ro'yxat
print("5 ta eng yaqin do'stingiz kim?")
for n in range(5): # n bu yerda 0 dan 4 gacha qiymatlar oladi
    dostlar.append(input(f"{n+1}-do'stingizning ismini kiriting: "))
print(dostlar)
```

Natija:

![](/files/-MMT-gtwhVd0_teSQ415)

Kodni tahlil qilamiz:

* 1-qatorda bo'sh `dostlar` ro'yxatini yaratdik
* 2-qatorda ekranga `"5 ta eng yaqin do'stingiz kim?"` degan xabarni chiqardik
* 3-qatorda tsiklni boshladik. `range(5)` funktsiyasi 0 dan 5 gacha sonlar ketma-ketligini yaratadi `(0,1,2,3,4)` tsikl esa `n` shularning har biriga teng bo'lib chiqquncha davom etadi.&#x20;
* 4-qatorda tsikl badani kelgan. Bu yerda biz foydalanuvchidan `n+1` do'stingizni kiriting deb so'radik. Nima uchun `n+1` (`n` emas)? Sababi `n` 0 dan 4 gacha qiymatlarni oladi, foydalanuvchiga tushunarli bo'lishi uchun esa biz "0-do'stingizni ismini kiriting:" deb emas, balki `n+1` ya'ni 1-ismni kiriting deb murojat qilyapmiz.
* 5-qatorda shakllangan ro'yxatni konsolga chiqardik.

**`for`** tsikli har qanday dasturlash tilining eng muhim qismlaridan hisoblanadi va biz bu operatoraga hali takror-takror qaytamiz.

## AMALIYOT

* Kamida 5 elementdan iborat ismlar degan ro'yxat tuzing, va ro'yxatdagi har bir ismga takrorlanuvchi xabar yozing
* Yuoqirdagi tsikl tugaganidan so'ng, ekranga "Kod `n` marta takrorlandi" degan xabarni chiqaring (`n` o'rniga kod necha marta takrorlanganini yozing)

![Kutilgan natija](/files/-MMP_FTr--cIleoE1pUk)

* 10 dan 100 gacha bo'lgan toq sonlar ro'yxatini tuzing. Ro'yxatning xar bir elementining kubini yangi qatordan konsolga chiqaring.

![](/files/-MMP_u9IVOIxvkgaD4R7)

* Foydalanuvchidan 5 ta eng sevimli kinolarini kiritshni so'rang, va `kinolar` degan ro'yxatga saqlab oling. Natijani konsolga chiqaring.
* Foydalanuvchidan bugun nechta odam bilan uchrashganini (suhbatlashganini) so'rang, va har bir suhbatlashgan odamning ismini birma-bir so'rab ro'yxatga yozing. Ro'yxatni konsolga chiqaring.

![](/files/-MMT5AHMlvPnOvBAj5Cg)

## JAVOBLAR

\#09-dars javoblar

---''',
    vocabularyRaw: '''for	Takrorlash tsikli boshlanishi	for x in list:
range()	Sonlar oralig\'ini yaratish funksiyasi	range(1, 10)
indentation	Kod bloklari uchun chapdan qoldiriladigan joy (4 ta space)	python block''',
    exercises: [
      Exercise(
        number: 1,
        question: '''range(5) qaysi sonlarni qaytaradi?''',
        answer: '''0, 1, 2, 3, 4''',
      ),
      Exercise(
        number: 2,
        question: '''for tsikli yordamida 0 dan 2 gacha bo\'lgan sonlarni ekranga chiqaring.''',
        answer: '''for i in range(3):
    print(i)''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 10,
    title: '''If-Else Shart Operatorlari''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/shartlar/10-if-else.md).

## TARMOQLANISH

Shu vaqtgacha yozgan dasturlarimizga e'tibor bersangiz, dasturimiz yuqoridan pastga qarab qatorma-qator bajarilib keldi. Bu chiziqli dastur deyiladi. Voqelikda esa aksar dasturlar ma'lum bir shart bajarilishi (yoki bajarilmaganiga) ko'ra kodning bir qismidan boshqa qismiga "sakrab" o'tishi tabiiy hol. Dasturlashda bu ***tarmoqlanish*** deb ataladi.&#x20;

![Tarmoqlanishga misol](/files/-MMcrT4AK37JNwfmXziF)

Ushbu darsimizda biz **`if`** operatori yordamida shunday shartlarni yozishni, tekshirishni va tekshiruv natijasiga ko'ra kodning turli qismlarini bajarishni o'rganamiz. &#x20;

## `if` OPERATORI

**`if`** so'zi ingliz tilidan **"agar"** deb tarjima qilinadi va deyarli barcha dasturlash tillarida shartlarni yozish uchun foydalaniladi.&#x20;

Keling quyidagi misolni ko'ramiz. Bizda `avtolar` ro'yxati bor:

```python
avtolar = ['audi','bmw','volvo','kia','hyundai']
```

Biz ro'yxatdagi har bil elementni katta harf bilan konsolga chiqarmoqchimiz. Bunda istisno sifatida "BMW" mashinasi nomini hamma harflarini katta bilan chiqarishimiz kerak.&#x20;

Demak quyidagi kodni yozamiz:&#x20;

```python
for avto in avtolar: # avtolar ichidadi har bir avto uchun ...
    if avto == 'bmw':  # ... agar avto bmw ga teng bo'lsa ...
        print(avto.upper()) # avto nomini hamma harflarini katta bilan yoz.
    else: # aks holda ... 
        print(avto.title()) # avto nomini faqat birinchi harfini katta bilann yoz.
```

Kodni tahlil qilaylik:

* 1-qatorda biz for tsiklini boshladik: *avto ichidagi har bir avto uchun.*
* 2-qatorda shart yozdik: *agar avto bmw ga teng bo'lsa* (bu yerda `==` belgisi tenglikni tekshirish belgisi hisoblanadi va **"`avto`** **`bmw` ga tengmi?"** deb o'qiladi).&#x20;
* 3-qator yuqoridagi shartning badani hisoblanadi va **faqatgina** shart bajarilgandagina ishga tushadi va avto nomini hamma harflarini katta bilan yozadi (`.upper()` metodi).&#x20;
* 4-qatorda yana bir yangi operator, **`else`** bilan tanishamiz. "**Else**" ingliz tilidan "**aks holda**" deb tarjima qilinadi va **`if`** sharti bajarilmaganda **`else`** qismi ichidagi kod bajariladi.&#x20;
* 5-qator esa `else` (aks holda, ya'ni 2- qatordagi shart bajarilmaganda) ishga tushadi va avto nomining faqat birinchi harfini katta bilan yozadi (`.title()` metodi)

**Diqqat!** Shart "badani" shartdan biroz o'ngga surib yoziladi (huddi `for` tsikli kabi). `if/else` dan keyin kelgan va o'ngga surib yozilgan har bir qator `if/else` shartining badani hisoblanadi.

Yuoqridagi kodni bajaramiz, va natijani ko'ramiz:

```python
avtolar = ['audi','bmw','volvo','kia','hyundai']
for avto in avtolar: # avtolar ichidadi har bir avto uchun ...
    if avto == 'bmw':  # ... agar avto bmw ga teng bo'lsa ...
        print(avto.upper()) # avto nomini hamma harflarini katta bilan yoz.
    else: # aks holda ... 
        print(avto.title()) # avto nomini faqat birinchi harfini katta bilan yoz.
```

Natija:

![](/files/-MMczNUKHUCFPNEElicg)

## TRUE/FALSE

Yuqorida shartni tekshirish uchun `==` operatoridan foydalandik. Bu operatorni oddiy tilga tarjima qilsak ***"tengmi?"*** degan ma'noni beradi.&#x20;

Agar shartning ikki tarafidagi qiymatlar teng bo'lsa ifoda **TRUE** qiymatini qaytaradi ("True" so'zi ingliz tilidan "haqiqiq" yoki "to'g'ri" deb tarjima qilinadi).

Aksincha, qiymatlar tenglik qanoatlantirilmasa, ifoda **FALSE** qiymatini qaytaradi ("False" so'zini ingliz tilidan "yolg'on" deb tarjima qilsak bo'ladi).

Quyidagi misollarga e'tibor bering. Biz `ism` degan o'zgaruvchi yaratdik, va unga `'Ali'` matnini yukladik. Keling endi `==` yordamida `ism` ning qiymatini tekshirib ko'ramiz:

![](/files/-MMeM0VfegmFez43z3oQ)

Ko'rib turganingizdek avval `ism=='Ali'` (`ism` `'Ali'` ga tengmi?) deb so'raganimizda, ifoda `TRUE` (Ha) degan javobni qaytardi, keyin esa `ism=='Vali'` (`ism` `'Vali'` ga tengmi?) deb so'raganimizda esa, ifoda `FALSE` (Yo'q) deb qiymat qaytardi.

Demak, `if/else` bog'lamasida, `if` ning badani ifoda `True` bo'lganda, `else` ning badani esa ifoda `False` bo'lganda bajariladi.&#x20;

## MATNLARNI SOLISHTIRISH

Aksar tizimlar foydalanuvchi kiritgan matnni ma'lum bir ko'rinishga keltirib oladi. Buning sababi, kompyuter uchun `'Ali'`, `'ALI'`, va `'ali'` bu uchta turli hil ism. Ularni solishtirish uchun esa bir ko'rinishga keltirib olish kerak.

Tasavvur qiling siz yangi email manzil ochmoqchisiz, va o'zingizga yangi foydalanuvchi ismini tanlashingiz kerak. Kompyuter siz kiritgan foydalanuvchi ismini tizimdagi mavjud foydalanuvchilar bilan solishtiradi va agar ism band bo'lsa sizga boshqa ism tanlashni aytadi. Solishtirish jarayonida esa, siz tanlagan ismni kichik harflarga o'tkazib, boshqa ismlar bilan solishtiradi.

![Yandex.uz sahifasida ro'yxatdan o'tish jarayoni](/files/-MMeU64riTA_t65PqoXr)

Yuqoridagi misolda, kimdur <anvar@yandex.ru> manzilini band qilgan, agarda men `'Anvar'`, yoki `'ANvar'`, yoki `'ANVAR'` deb login tanlasam ham, <anvar@yandex.ru> band bo'gani sababli men so'ragan loginlar rad qilinaveradi.&#x20;

Xo'sh, turli ko'rinishda yozilgan matnlarni qanday qilib solishtiramiz? Juda oddiy. Matnlarni solishtirishdan avval `.lower()` metodi yordamida kichik harflar ko'rinishiga keltirib olamiz:

```python
ism = 'Ali'
ism.lower() == 'ali'
```

Natija: `True`

## QIYMATLARNING TENG EMASLIGINI TEKSHIRISH

Agar ikki qiymatning teng emasligini tekshirish talab qilinsa, `!=` operatoridan foydalanilamiz.&#x20;

```python
ism = input('Ismingiz nima?\n>>>') # Foydalanuvchi ismini so'raymiz
if ism.lower() != 'ali': # Agar ism Aliga teng bo'lmasa ...
    print(f"Uzr, {ism.title()} biz Alini kutayapmiz.") # quyidagi xabar chiqadi
else:
    print("Salom, Ali")
```

![Natija](/files/-MMeqY-wx5KUYWFaega3)

Demak yuqoridagi kodning 2-qatorida `ism` ichidagi qiymat `'ali'` ga teng bo'lmasa *"Uzr, {ism} biz Alini kutyapmiz"* degan xabarni chiqar dedik. Aks holda (`else`), `"Salom, Ali"` degan xabar chiqadi.

Shartlarda `else` qismi bo'lishi majburiy emas. Bunga keyingi bo'limlarda tushunarliroq misollar ko'ramiz.

## SONLARNI SOLISHTIRISH

Sonlarni solishtirishda yuqoridagi teng (`==`) va teng emas (`!=`) shartlariga qo'shimcha ravishda quyidagi mantiqiy shartlar ham qo'shiladi:

* Kichik: `a<b`
* Kichik yoki teng: `a<=b`
* Katta: `a>b`
* Katta yoki teng: `a>=b`

```python
javob = float(input("12x6 nechiga teng?>>>"))
if javob!=72:
    print("Javob xato!")
```

![Natija](/files/-MMewgPWSwRz8L_i122u)

```python
yosh = int(input("Yoshingiz nechida?>>>"))
if yosh>=18: # yosh 18 dan katta yoki teng bo'lsa
    print('Xush kelibsiz!')
else: # ask holda
    print('Kirish mumkin emas!')
```

![](/files/-MMey0qAvKQC3JlG-f8D)

```python
login = input("Yangi login tanlang:")
if len(login)<=5: # login uzunligini tekshiramiz
    print("Login 5 harfdan ko'proq bo'lishi shart!")
```

![Natija](/files/-MMf-xwdyOFBTQcaNrUL)

Sonlarni solishtirishda arifmetik ifodalar ham yozishimiz mumkin:

```python
yil = int(input("Tug'ilgan yilingizni kiriting:"))
if 2020-yil<18: # foydalanuvchining yoshini hisoblaymiz
    print(f"Yoshingiz {2020-yil}da ekan.")
    print("Kirish mumkin emas!")
else:
    print("Xush kelibsiz!")
```

![Natija](/files/-MMf8QjPej7q6ji1ysU-)

## BIR QATOR `if/else`

Qisqa kodlar uchun shart va uning badanini 1 qatorga jamlab yozishimiz ham mumkin:

```python
yosh = int(input("Yoshingiz nechida?>>>"))
if yosh>65: print("Siz COVID-19 risk guruhida ekansiz")
```

![Natija](/files/-MMiwqXQb3zenzlMiWF0)

Yoki:

```python
x, y = 25, 50 # x=25 va y=50
print("x>y") if x>y else print("x<y")
```

Natija: `x<y`

## AMALIYOT

* Yangi `cars = ['toyota', 'mazda', 'hyundai', 'gm', 'kia']` degan ro'yxat tuzing, ro'yxat elementlarining birinchi harfini katta qilib konsolga chqaring. GM uchun ikkala harfni katta qiling.

![](/files/-MMhuWawX7du_nPXqnli)

* Yuqoridagi mashqni teng emas (`!=`) operatori yordamida bajaring.&#x20;
* Foydalanuvchi login ismini so'rang. Agar login admin bo'lsa, *"Xush kelibsiz, Admin. Foydalanuvchilar ro'yxatini ko'rasizmi?"* xabarini konsolga chiqaring. Aks holda, *"Xush kelibsiz, `{foydalanuvchi_ismi}!`"*  matnini konsolga chiqaring.
* Foydalanuvchidan 2 ta son kiritishni so'rang. Agar ikki son bir-biriga teng bo'lsa, "Sonlar teng" ekan degan yozuvni konsolga chiqaring.
* Foydalanuvchidan istalgan son kiritishni so'rang. Agar son manfiy bo'lsa konsolga "Manfiy son", agar musbat bo'lsa "Musbat son" degan xabarni chiqaring.&#x20;
* Foydalanuvchidan son kiritishni so'rang, agar son musbat bo'lsa uning ildizini hisoblab konsolga chiqaring. Agar son manfiy bo'lsa, "Musbat son kiriting" degan xabarni chiqaring.&#x20;

## JAVOBLAR

---''',
    vocabularyRaw: '''if	Shart tekshirish boshlanishi	if x > 0:
else	Shart bajarilmagandagi muqobil blok	else:
==	Tenglikni tekshirish operatori	ax == 5''',
    exercises: [
      Exercise(
        number: 1,
        question: '''a=5 bo\'lsa, u 0 dan kattaligini tekshiruvchi oddiy if shartini yozing.''',
        answer: '''a = 5
if a > 0:
    print(\'Katta\')''',
      ),
      Exercise(
        number: 2,
        question: '''Teng emaslikni tekshiruvchi taqqoslash belgisi qanday yoziladi?''',
        answer: '''!=''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 11,
    title: '''Bir Nechta Shartlarni Tekshirish (Elif)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/shartlar/11-if-elif-else.md).

## `if-elif-else` KETMA-KETLIGI

Dastur davomida bir nechta shartni tekshirish talab qilinishi mumkin. Bunday holatda biz **`if-elif-else`** ketma-ketligidan foydalanamiz. `elif` - *else* va if so'zalrining jamlanmasi bo'lib, *"aks holda, agar"* deb tarjima qilinadi. Bunday `if` bilan boshlangan ketma-ketlik bir nechta `elif` lardan iborat bo'lishi mumkin.&#x20;

Python avval `if` shartini tekshiradi, shart bajarilmasa `elif` ga o'tadi, birinchi `elif` sharti bajarilmasa keyingi `elif` ga o'tadi va hokazo davom etaveradi.

&#x20;**Diqqat!`if-elif-else`** ketma-ketlikda biror shart bajarilishi bilan, Python qolgan shartlarni tekshirmaydi.

Keling bir misol ko'ramiz. Hayvonot bo'giga kirish quyidagicha belgilangan:

* 4 yoshdan kichik bolalarga kirish bepul
* 4 yoshdan 12 yoshgacha kirish 5000 so'm
* 12 yoshdan kattalarga 10000 so'm

Foydalanuvchidan yoshini so'rab, hayvonot bog'iga kirish chiptasi narhini chiqaruvchi dastur yozamiz.

```python
yosh = int(input('Yoshingiz nechida? '))
if yosh<=4:
    print('Sizga kirish bepul.')
elif yosh<=12:
    print('Sizga kirish 5000 so\'m')
else:
    print('Sizga kirish 10000 so\'m')
```

Yuqoridagi kod avval foydalanuvchi yoshini so'raydi. 2-qatorda yosh 4 dan kichik ekanligini tekshiradi. Agar bu shart bajarilsa shartlarni tekshirish shu yerdayoq to'xtaydi va keyingi shartlar tashlab o'tib ketiladi.

![if yosh<=4 bajarilgandagi natija](/files/-MMjpNkdsEtesg-eep1u)

Agar `yosh<=4` sharti bajarilmasa, keyingi `elif yosh<=12` sharti tekshiriladi, agar shart bajarilsa quyidagi natija chiqadi:

![if yosh<=12 uchun natija](/files/-MMjpwVqO6oJRXWggerf)

Agar yuoqridagi ikki shart ham bajarilmasa navbat o'z-o'zidan `else` bilan kelgan kod bajariladi:

![else](/files/-MMjpqGPy1REfNXK9aA6)

Kod yozishda yaxshi amaliyotlardan biri, kodlarni qisqa yozish va buyruqlarni qayta-qayta takrorlamaslik. Bu kelajakda kodni o'zgartirishda ham juda qo'l keladi.&#x20;

```python
yosh = int(input('Yoshingiz nechida? '))
if yosh<=4:
    price = 0
elif yosh<=12:
    price = 5000
else:
    price = 10000
    
print(f"Sizga kirish {price} so'm")
```

Avval aytganimizdek,  `if-elif-else` zanjirida bit nechta `elif` lar bo'lishi mumkin. Misol uchun, hayvonot bog'i qariyalar uchun chegirma e'lon qilsa, kodimizni quyidagicha o'zgartirishimiz mumkin:

```python
yosh = int(input('Yoshingiz nechida? '))
if yosh<=4: # yosh bolalarga bepul
    price = 0
elif yosh<=12: # 4 dan 12 yoshgacha 5000 so'm
    price = 5000
elif yosh<65: # 12 dan katta va 65 dan kichiklarga narh 10000 so'm
    price = 10000
else: # qariyalarga esa 8000 so'm
    price = 8000
print(f"Sizga kirish {price} so'm")
```

![](/files/-MMjuxwGoMHPNVrtNUKk)

`if-elif-else` zanjirida ham `else` qismi majburiy emas:

```python
yosh = int(input('Yoshingiz nechida? '))
if yosh<=4:
    price = 0
elif yosh<=12:
    price = 5000
elif yosh<65:
    price = 10000
elif yosh>=65:
    price = 8000    
print(f"Sizga kirish {price} so'm")
```

## `AND`, `OR` OPERATORLARI

Yuqorida aytganimizdek, `if-elif-else` zanjirida shartlarning biri bajarilishi bilan, Python qolgan shartlarni tekshirmaydi va ularni bajarmaydi. Lekin ba'zida biz 2 yoki undan ko'p shartlarni tekshirishni talab qilishimiz mumkin, buing uchun AND va OR operatorlaridan foydalanamiz.

### `OR` OPERATORI

OR ingliz tilidan "yoki" deb tarjima qilinadi, va ikki va undan ko'p shartlardan **biri** bajarilishini tekshirishda ishlatiladi. Quyidagi misolni ko'raylik, foydalanuvchidan hafta kunini so'raymiz va agar kun shanba yoki yakshanba bo'lsa, bugun dam olish kuni degan xabarni chiqaramiz, aks holda bugun ish kuni degan xabarni chiqaramiz:

```python
kun = input("Bugun nima kun?>>>")
if kun.lower()=='shanba' or kun.lower()=='yakshanba':
    print('Bugun dam olish kuni.')
else:
    print('Bugun ish kuni.')
```

2-qatrodagi **`or`** operatoriga e'tibor qiling, bu operator `kun.lower()=='shanba'` yoki `kun.lower()=='yakshanba'` shartlaridan **biri** bajarilsa TRUE qiymatini qaytaradi

![](/files/-MMxN7R3y0LACKq21d1U)

### `AND` OPERATORI

AND ingliz tilidan "va" deb tarjima qilinadi, va ikki va undan ko'p shartlarning **barchasi** bajarilishini tekshirishda ishlatiladi. `AND` operatori bilan yozilgan shartlarning **barchasi** bajarilgandagina `TRUE` qiymati qaytadi, agar shartlardan biri bajarilmay qolsa ham `FALSE` qiymati qaytadi.

Quyidagi misolni ko'ramiz:

```python
kun = input("Bugun nima kun?")
harorat = float(input("Havo harorati qanday?"))
if kun.lower()=='yakshanba' and harorat>=30:
    print("Cho'milgani ketdik!")
elif kun.lower()=='yakshanba' and harorat<30:
    print("Uyda dam olamiz!")
```

3-qatordagi `and` operatori `kun.lower()=='yakshanba'` va `harorat>=30` shartlarining **ikkisi ham** bajarilgandagina `TRUE` qiymatini qaytaradi, aks holda qiymat `FALSE` bo'ladi.

![](/files/-MMyRucXD7wJFL06Ep1y)

### BIR NECHTA SHARTLARNI KETMA-KET YOZISH

Shartlarni yozishda bir nechta and or operatorlarini aralashtirib ham yozish mumkin.

```python
kun = input("Bugun nima kun?")
harorat = float(input("Havo harorati qanday?"))
if (kun.lower()=='shanba' or kun.lower()=='yakshanba') and harorat>=30:
    print("Cho'milgani ketdik!")
elif (kun.lower()=='shanba' or kun.lower()=='yakshanba') and harorat<30:
    print("Uyda dam olamiz!")
```

3-qatorga e'tibor bersangiz biz avval kun shanba yoki yakshanba ekanligini so'ngra haroratni tekshirdik. Bu shart bajarilishi uchun kun shanba **yoki** yakshanba **va** harorat 30 dan baland bo'lishi shart.

## BOOLEAN MA'LUMOTLAR TURI

Avvalgi darsimizda biz turli ifodalarni solishtirishda TRUE yoki FALSE qiymatlari qaytishini ko'rdik. Bu qiymatlar boolean (mantiqiy) qiymatlar deb ataladi, va dasturlashda juda keng qo'llaniladi. Pythonda o'zgaruvchilarda boolean qiymatlarni ham saqlash mumkin.&#x20;

Quyidagi dasturga e'tibor bering. Deylik, restoranimizga kelgan mijoz 15000 so'mlik taom oldi, biz mijoz qo'shimcha choy va salat ham olgan (olmaganiga) qarab ularning narhini ham  yakuniy narhga qo'shishimiz kerak. Mijozning choy yoki salat olgan (olmaganini) biz `TRUE` va `FALSE` qiymatlari bilan belgiladik.

```python
narh = 15000 # mijoz 15000 so'mga taom oldi.
choy = True # mijoz choy ham oldi
salat = False # mijoz salat olmadi

if choy and salat: # agar mijoz choy ham salat ham olgan bo'lsa
    narh = narh + 10000 # narhga 10000 so'm qo'shamiz
elif choy or salat: # agar choy yoki salat olgan bo'lsa
    narh = narh + 5000 # narhga 5000 so'm qo'shamiz

print(f"Jami {narh} so'm") # yakuniy narhni chiqaramiz
```

Natija: `Jami 20000 so'm`

E'tibor bering, `choy` va `salat` boolean (mantiqiy) qiymatlar bo'gani uchun, 5 va 7-qatorlarda biz `choy==True` yoki `salat==True` deb yozib o'tirishimiz shart emas.

Yuoqirdagi misolda `choy = True` (choy oldi) va `salat = False` (salat olmadi) bo'lgani uchun yakuniy narh `narh+5000=20000` chiqdi.

Boolean o'zgaruvchilarni saqlashda `TRUE` va `FALSE` qiymatlari o'rniga `1` va `0` sonlarini ham ishlatish mumkin.

## SHARTLARNI KETMA-KET TEKSHIRISH

`if-elif-else` zanjirining kamchiligidan biri, shartlardan biri bajarilishi bilan, qolgan shartlar tekshirilmaydi. Shung uchun ba'zida shartlarni ketma ket tekshirish uchun, har bir shartni alohida if bilan ajratish talab qilinishi mumkin.

Yuqoridagi misolni kengaytiraylik:

```python
narh = 15000 # mijoz 15 so'mga ovqat oldi
choy = True
salat = False
non = True
kompot = True
assorti = False
#Quyidagi har bir shart alohida tekshiriladi va bir-biriga bog'liq emas
if choy:   # agar choy olsa
    print("Mijoz choy oldi.")
    narh = narh + 3000
if salat:  # agar salat olsa
    print("Mijoz salat oldi.")
    narh = narh + 5000
if non:    # agar non olsa
    print("Mijoz non oldi.")
    narh = narh + 2000
if kompot: # agar kompot olsa
    print("Mijoz kompot oldi.")
    narh = narh + 5000
if assorti: # agar assorti olsa
    print("Mijoz assorti oldi.")
    narh = narh + 15000
    
print(f"Jami {narh} so'm")
```

![](/files/-MMxaYC1sF8-Np4PbgOS)

Yuqoridagi dasturda har bir `if` alohida tekshiriladi va avvalgi yoki keyingi `if` ga bog'liq emas.

## RO'YXAT TARKIBINI TEKSHIRISH

### `in` OPERATORI

**`in`** operatori yordamida biz ro'yxatning tarkibida ma'lum bir element borligini tekshirishimiz mumkin.

```python
menu = ['osh','qazonkabob','shashlik','norin','somsa']
'manti' in menu # menu da manti bormi?
```

Natija: `False`

```python
menu = ['osh','qazonkabob','shashlik','norin','somsa']
'osh' in menu # menu da osh bormi?
```

Natija: `True`

```python
menu = ['osh','qazonkabob','shashlik','norin','somsa']
ovqat = input('Nima ovqat yeysiz?>>>')
if ovqat.lower() in menu:
    print('Buyurtma qabul qilindi.')
else:
    print('Afsuski bizda bunday ovqat yo\'q')
```

![](/files/-MMxXSYaml4L6_rHJLUH)

### `not in` OPERATORI

&#x20;**`not in`** operatori yordamida esa biror element ro'yxatda yo'qligini tekshirishimiz mumkin.

```python
menu = ['osh','qazonkabob','shashlik','norin','somsa']
'manti' not in menu # menu da manti yo'qmi?
```

Natija: `True`

```python
menu = ['osh','qazonkabob','shashlik','norin','somsa']
'osh' not in menu # menu da osh yo'qmi?
```

Natija: `False`

```python
menu = ['osh','qazonkabob','shashlik','norin','somsa']
ovqat = input('Nima ovqat yeysiz?>>>')
if ovqat.lower() not in menu:
    print('Afsuski bizda bunday ovqat yo\'q')
else:
    print('Buyurtma qabul qilindi.')
```

`not` operatorini boshqa shartlarning oldidan ham qo'yishimiz mumkin. Misol uchun: `if not a==5` ifodasi `if a!=5` ifodasi bilan bir hil natija qaytaradi.

### IKKI RO'YXATNI SOLISHTIRISH

Ikki ro'yxatning tarkibi quyidagicha tekshiriladi:

```python
menu = ['osh','qazonkabob','shashlik','norin','somsa']
buyurtmalar = ["osh","somsa","manti", "shashlik"]

for taom in buyurtmalar:
    if taom in menu:
        print(f"Menuda {taom} bor")
    else:
        print(f"Kechirasiz, menuda {taom} yo'q")
```

![](/files/-MMy5QQpc8eT6oaNgxln)

### RO'YXAT BO'SH EMASLIGINI TEKSHIRISH

Yuqoridagi dasturimizda biz foydalanuvchi buyurtma berdi deb tasavvur qilyapmiz. Lekin foydalanuvchidan bo'sh ro'yxat kelsachi? Demak for tsiklini bajarishdan avval ro'yxat bo'sh emasligiga amin bo'lishimiz kerak. Buning uchun avvalgi kodimizni quyidagicha o'zgartiramiz:

```python
menu = ['osh','qazonkabob','shashlik','norin','somsa']
buyurtmalar = ["osh","somsa","manti", "shashlik"]

if buyurtmalar: # ro'yxatda biror element bo'lsa bu ifoda TRUE qaytaradi
    for taom in buyurtmalar:
        if taom in menu:
            print(f"Menuda {taom} bor")
        else:
            print(f"Kechirasiz, menuda {taom} yo'q")
else: # agar ro'yxat bo'sh bo'lsa
    print("Savatchangiz bo'sh!")
```

Demak `if royxat_nomi:` ifodasi agar ro'yxatda bir dona element bo'lsa ham `TRUE` qiymat qaytaradi, aks holda `FALSE` qiymatini qaytaradi.

## AMALIYOT

Quyidagi dasturlarni alohida fayllarga yozing va bajaring:

* Foydalanuvchidan juft son kiritishni so'rang. Agar foydalanuvchi juft son kiritsa "Rahmat!", agar toq son kiritsa "Bu son juft emas" degan xabarni chiqaring.

![](/files/-MMyGSunx9I7XFfWhs1_)

* Foydalanuvchi yoshini so'rang, va muzeyga kirish uchun chipta narhini quyidagicha chiqaring:
  * Agar foydalanuvchi 4 yoshdan kichkina yoki 60 dan katta bo'lsa bepul
  * Agar foydalanuvchi 18 dan kichik bo'lsa 10000 so'm
  * Agar foydalanuvchi 18 dan katta bo'lsa 20000 so'm
* Foydalanuvchidan ikita son kiritishni so'rang, sonlarni solishtiring va ularning teng yoki katta/kichikligi haqida xabarni chiqaring

![](/files/-MMyUBJ8wqYU6YcYSkLo)

* `mahsulotlar` degan ro'yxat yarating va kamida 10 ta turli mahsulotni kiriting. Yangi, `savat` degan bo'sh ro'yxat yarating va foydalanuvchidan savatga kamida 5 ta mahsulot kiritishni so'rang. Savatdagi elementlarni, `mahsulotlar` ro'yxati bilan solishtiring va qaysi biri ro'yxatda bo'lsa "*Mahsulot* do'konimizda bor" aks holda, "*Mahsulot* do'konimizda yo'q" degan xabarlarni chiqaring.

![](/files/-MMyWtzMNXaeikFhIRfZ)

* Yuqoridagi dasturni quyidagicha o'zgartiring: foydalanuvchidan 5 ta mahsulot kiritishni so'rang. Foydalanuvchi so'ragan va do'konda bor mahsulotlarni yang, `bor_mahsulotlar` degan ro'yxatga, do'konda yo'q mahsulotlarni esa `mavjud_emas` degan ro'yxatga qo'shing.  Agar mavjud\_emas ro'yxati bo'sh bo'lsa, "Siz so'ragan barcha mahsulotlar do'konimizda bor" degan xabarni, aks holda esa "Quyidagi mahsulotlar do'konimizda yo'q: ....." degan xabarni chiqaring.

![](/files/-MN3g9xpnFVkpr2XFDt7)

* `foydalanuvchilar` degan ro'yxat tuzing, va kamida 5 ta login qo'shing. Foydalanuvchidan yangi login tanlashni so'rang va foydalanuvchi kiritgan loginni foydalanuvchilar degan ro'yxatning tarkibi bilan solishtiring. Agar ro'yxatda bunday login mavjud bo'lsa, "Login band, yangi login tanlang!" aks holda "Xush kelibsiz, *foydalanuvchi*!" xabarini chiqaring.

![](/files/-MMyZryOyr7yF_Ja3yzr)

* Foydalanuvchidan biror butun son kiritishni so'rang. Foydalanuvchi kiritgan sonni 2 da 10 gacha bo'lgan sonlardan qay biriga qoldiqsiz bo'linishini konsolga chiqaring.&#x20;

![](/files/-MN12bxIh50b3x01rFwN)

## JAVOBLAR

11-dars javoblari

---''',
    vocabularyRaw: '''elif	Keyingi shartni tekshirish bloki	elif x == 0:
and	Mantiqiy va operatori	cond1 and cond2
or	Mantiqiy yoki operatori	cond1 or cond2
not	Mantiqiy inkor operatori	not cond''',
    exercises: [
      Exercise(
        number: 1,
        question: '''x=10 bo\'lsa, u 5 dan katta va 15 dan kichikligini and yordamida tekshiring.''',
        answer: '''x = 10
if x > 5 and x < 15:
    print(\'Mos\')''',
      ),
      Exercise(
        number: 2,
        question: '''and operatori ishlashi uchun barcha shartlar qanday bo\'lishi kerak?''',
        answer: '''to\'g\'ri''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 12,
    title: '''Xatolar bilan ishlash''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/lirik-chekinish-1/12-xatolar.md).

## XATOLAR

Har qanday dasturchi kod yozishda xato qiladi. Ko'p yozgan odam esa ko'p xato qiladi va bu tabiiy. Ba'zi xatolarimiz Python tomonidan dastur bajarilishdan avvaloq aniqlanadi. Ba'zilari esa dastur bajarish jarayonida aniqlanib, dasturimiz to'xtab qoladi. Keling, bugun dasturlashni yangi boshlaganlar eng ko'p yo'l qo'yadigan xatolar bilan tanishamiz.

## **SyntaxError** - SINTEKS XATOLIK

Biz *syntax error* bilan [3-darsimizda ](https://python.sariq.dev/ilk-qadamlar/03-print)tanishgan edik. Bu eng ko'p uchraydigan xato bo'lib, odatda dasturlash tili qoidalariga amal qilmaslik natijasida kelib chiqadi. Aksar dasturlash muhitlari sintaks xatolikni dastur bajarilishidan avvaloq aniqlab, dasturchiga ishora beradi. Sintaks xatolik bor dasturni Python bajarmaydi.

```python
print "Hello World!"
```

Natija: **`SyntaxError: Missing parentheses in call to 'print'. Did you mean print("Hello World!")?`**

Odatda dasturlash muhiti xatoning turi bilan birga (SyntaxError), xato haqida qo'shimcha ma'lumot ham beradi (`Missing parentheses in call to 'print'. Did you mean print("Hello World!")?`). Agar ingliz tilini tushunmasangiz, [Google Translate](https://translate.google.com/?ui=tob\&sl=en\&tl=ru\&op=translate) sahifasi yordamida matnni rus yoki o'zbek tiliga tarjima qilib olishingiz mumkin.&#x20;

Agar rus tilini bilsangiz, xato matnini rus tilga tarjima qiling. O'zbek tilidagi tarjimalar hali biroz tushunarsiz.

![Xatoning rus tilidagi tarjimasi](/files/-MN6WUMJlEOmcASMDcxT)

![Xatoning o'zbek tilidagi tarjimasi](/files/-MN6W_hZ_qfpVM8jsSo7)

### EOL va EOF xatolik

EOL (End of Line - qator yakuni) xatoligi sintaks xatolikning bir turi bo'lib, odatda qator oxirida qo'shtirnoq (birtirnoq) ni yopish esdan chiqqanda yuzaga keladi.

```python
print("Hello World!
```

Natija: **`SyntaxError: EOL while scanning string literal`**

EOF (End of function - funktsiya yakuni) xatoligi esa funktsiya oxirida qavsni yopish esdan chiqqanda yuzaga keladi. &#x20;

```python
print("Hello World!"
```

Natija: **`SyntaxError: unexpected EOF while parsing`**

EOF xatoligining muammoli tarafi, Python aynan qaysi funktsiya yopilmay qolganini ko'rsata olmaydi, ya'ni kodni sinchiklab ko'zdan kechirib chiqish talab qilinadi.

## IndentationError - JOY TASHLASHDA XATOLIK

Python tilida qator boshidan yoki joy tashlab yozish muhim ahamiyatga ega. Qator boshidan asossiz joy qoldirish IndentationError ga olib keladi.&#x20;

Quyidagi kodga e'tibor bering, qator boshida 1 dona bo'sh joy qolgani uchunoq Spyder muhiti xatolikni aniqlab, qizil bilan belgilab qo'ydi.

![Asossiz bo'sh joy qoldirish ham xato](/files/-MN6e3ewh_GD-rUVnjx5)

![IndentationError](/files/-MN6ePDjpDvBQXM7MK5Y)

Ba'zi joylarda esa aksincha, bo'sh joy tashlab yozish talab qilinadi. Masalan, `for` tsiklida yoki `if-elif-else` shartlarining ichida va hokazo.

```python
print("O'ngacha sanaymiz")
for n in range(10):
print(n+1)
```

Natija: `IndentationError: expected an indented block`

```python
son = 50
if son>=0:
    print("Musbat son")
else:
print("Manfiy son")
```

Natija: `IndentationError: expected an indented block`

### QANCHA JOY TASHLAYMIZ?

Yuqoridagi misollarda IndentationError oldini olish uchun joy tashlash talab qilindi. Xo'sh, qancha joy tashlash kerak va qanday qilib?

Aslida, hech bo'lmaganda 1 harflik bo'sh joy qoldirish ham bizni IndentationError dan xalos qiladi. LEKIN, biz dastur davomida bir hil joy tashlashga odatlanishimiz kerak.&#x20;

Qoida sifatida kamida 4 ta harflik joy yoki 1 ta TAB (klaviaturadagi tab tugmasi) joy tashlashni odat qilishimiz kerak. Va eng muhimi ikkalasini aralashtirmasligimiz lozim. Ya'ni agar siz joy tashlash uchun Space (probel) ishlatsangiz, oxirigacha shunday qiling, agar Tab ishlatsangiz oxirigacha tab ishlating. Ikkalasini aralashtirmang!

![Joy tashlash uchun yoki 1 tab yoki 4 space ishlating](/files/-MN6hZauiOId_z_XH8Mw)

## RUN TIME ERROR - DASTURNI BAJARISHDA XATOLIK

**Run time error** — dastur bajarish jarayonida kelib chiqadi va dasturning ishlashini to'xtatadi. Sintaks xatolikdan farqli ravishda Python bunday xatolarni dasturni bajarishdan avval aniqlay olmaydi. Run time error ning bir necha turi bor. Keling, ulardan ba'zilari bilan tanishamiz.

### TypeError

Biror amalni (funktsiya, metod) noto'g'ri ma'lumot turi ustida bajarish.&#x20;

```python
son = input("Istalgan son kiriting: ")
print(f"{son} ning kvadrati {son**2} ga teng")
```

Natija: **`TypeError: unsupported operand type(s) for ** or pow(): 'str' and 'int'`**

Yuqoridagi kodda biz foydalanuvchi kiritgan qiymatni matndan songa o'tkazib olishni unutdik, natijada sonning kavdratini hisoblashda Python xato berdi.

### NameError

O'zgaruvchi, funktsiya, obyekt nomini noto'g'ri yozish natijasida kelib chiquvchi xatolik.

```python
prit("Hello World!")
```

Natija: `NameError: name 'prit' is not defined`

```python
mevalar = ['olma','uzum','nok','anor','anjir']
for meva in mvealar:
    print(meva)
```

Natija: `NameError: name 'mvealar' is not defined`

### ValueError

Funktsiyaga noto'g'ri qiymatni yuborish natijasidagi xatolik

```python
son = int(input("Istalgan son kiriting: "))
if son>=0:
    print("Musbat son")
else:
    print("Manfiy son")
```

![ValueError](/files/-MN6kzYnI1nnTmV2FtN_)

Yuqoridagi dasturning 1-qatorida foydalanuvchidan istalgan son kiritishni so'rayabmiz, va foydalanuvchi kiritgan qiymatni `int` ya'ni butun songa o'tkazyabmiz. Kodning o'zida xato yo'q, lekin dastur bajarish jarayonida foydalanuvchi butun son emas, o'nlik son kiritgani uchun ValueError xatosi chiqdi. Sababi int() funktsiyasi faqatgina butun sonlar ko'rinishidagi matn bilan ishlaydi.

Dastur xato bermasligi uchun yoki `int()` funktsiyasini `float()` ga almashtrishimiz kerak, yoki foydalanuvchidan butun son kiritishni talab qilishimiz kerak.

### IndexError

Yangi dasturchilar yo'l qo'yadigan yana bir xato bu indeks xatolik. Ya'ni ro'yxat elementlariga murojat qilishda indeksni noto'g'ri kiritish.

```python
mevalar = ['olma','anor','uzum']
print(mevalar[3])
```

Natija: **`IndexError: list index out of range`**

Bizda mevalar degan ro'yxat bor va ro'yxatda uchta meva bor. Biz 3-elementni konsolga chiqarmoqchimiz va print(mevalar\[3]) deb yozdik va IndexError natijasini oldik. Sababi, dasturlashda indeks 0 dan boshlanadi va 3-elementga murojat qilish uchun 2-indeksni tanlaymiz. Demak, to'g'ri kod:

```python
mevalar = ['olma','anor','uzum']
print(mevalar[2])
```

Natija: `uzum`

### ZeroDivisionError

Dastur jarayonida 0 ga bo'lish yuzaga kelgandagi xatolik

```python
x, y = 50, 50
z = 250/(x-y)
```

Natija: `ZeroDivisionError: division by zero`

## MANTIQIY XATOLAR

Mantiqiy xatolar - dasturchi tomonidan yo'l qo'yilgan va kutilgan natijani berishda to'sqinlik qiluvchi xatolar. Bunday xatolar eng ko'p uchraydigan va aniqlash eng qiyin bo'lgan xatolar hisoblanadi. Aksar holatlarda Python mantiqiy xatolarni aniqlamaydi va dastur bajarilaveradi (lekin kutilgan natija chiqmaydi).&#x20;

Mantiqiy xatolar turli ko'rinishda bo'lishi mumkin, masalan sonlar bilan ishlashda:

```python
radius = 5
pi = 4.14
aylana_yuzi = pi*radius**2
print(aylana_yuzi)
```

Natija: `103.49999999999999`

Yuqoridagi kod bajarildi, va natija ham chiqdi. Lekin natija xato. Nima uchun? Sababi biz \$\$\pi=4.14\$\$ deb, xato yozib ketdik.

Yana bir misol ko'raylik:

```python
son = float(input("Istalgan son kiriting: "))
ildiz = son**1/2
print(f"{son} ning ildizi {ildiz} ga teng")
```

![Natija](/files/-MN701wXTmevN_Ey98UH)

Yuqoridagi natijaga e'tibor bersangiz, 9 sonining ildizi 4.5 deb chiqdi. Sababi, 2-qatorda ildizni hisoblashda foydalanuvchi kiritgan son avval 1-darajaga oshirildi va undan keyin 2 ga bo'lindi. Kodni to'g'rilaymiz:

```python
son = float(input("Istalgan son kiriting: "))
ildiz = son**(1/2)
print(f"{son} ning ildizi {ildiz} ga teng")
```

![Natija](/files/-MN70bRD91k6nEB3xBUi)

Noo'rin bo'sh joy qoldirish (yoki qoldirmaslik) ham mantiqiy xatoga olib kelishi mumkin:

```python
mevalar = ['olma','uzum','nok','anor','anjir']
for meva in mevalar:
    print(meva)
    print("Dastur tugadi")
```

![Natija](/files/-MN7VqRxHm7PBPLhXNWb)

Yuqorida "Dastur tugadi" matni bir marta, dastur tugaganidan so'ng chiqishi kerak edi. Lekin o'ngga suriib qolgani uchun bir necha bor qaytarildi.&#x20;

Bundan boshqa ham mantiqiy xatoliklar juda ko'p uchraydi.&#x20;

Mantiqiy xatoliklar mutlaqo topilmasdan ham qolib ketishi, va dastur bozorga chiqqanidan so'ng aniqlanishi tabiiy hol. Shuning uchun ham aksar dasturlar tez-tez yangilanib turadi.

![](/files/-MN7Tct3drpUzN2KqcK5)

Dastur jarayonida bundan boshqa xatoliklar ham ko'p uchraydi. Biz ulardan ba'zilari bilan tanishdik xolos. Keyingi darslarimizda Runtime xatoliklarni qanday qilib dastur davomida aniqlash, va dastur to'xtab qolishining oldini olishni o'rganamiz.

## AMALIYOT

Quyida Repl.it sahifasida bir nechta kodlar berilgan, kodlar avvalgi darsdagi uy vazifalaridan iborat. Kodlardagi xatolarni toping va to'g'rilang. Har bir dasturda bir nechta xatolar mavjud bo'lishi mumkin. Xatolarni topish uchun dasturlarni bir necha marta, turli qiymatlar bilan bajarib ko'ring.&#x20;

Kodlarni kompyuterda tekshirish uchun quyidagi faylni yuklab oling:

12-dars savollar

## JAVOBLAR

12-dars javoblari (11-dars bilan bir hil)

---''',
    vocabularyRaw: '''SyntaxError	Sinteks qoidasi buzilgandagi xatolik	print(\"Salom
IndentationError	Kod surilishida xatolik yuz berganda	no space inside loop
ZeroDivisionError	Nolga bo\'lish xatoligi yuz berganda	5 / 0''',
    exercises: [
      Exercise(
        number: 1,
        question: '''5 / 0 kodi bajarilganda qanday xatolik yuz beradi?''',
        answer: '''ZeroDivisionError''',
      ),
      Exercise(
        number: 2,
        question: '''Qavslar noto\'g\'ri qo\'yilganda qanday xatolik yoziladi?''',
        answer: '''SyntaxError''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 13,
    title: '''GitHub Portfolio''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/lirik-chekinish-1/13-github.md).

Tajribali dasturchi, tajribasiz dasturchidan bir necha barobar qadrliroq. Dasturchi sifatida qilgan dasturlaringiz, qatnashgan loyihlaringiz haqida so'ralishingiz mumkin (masalan ish qidirish jarayonida). Tajribani ko'rsatishning eng qulay va oson usuli bu qilgan ishlaringizning onlayn portfoliosini yaratish.&#x20;

Sifatli va loyihalarga boy portfolio Universitet diplomi va turli sertifikatlardan ham qadrliroq.&#x20;

## GITHUB NIMA?

[GitHub](https://python.sariq.dev/lirik-chekinish-1/www.github.com) - dasturlarni saqlash, ulashish va nazorat qilish uchun mo'ljallangan onlayn xosting hizmati. GitHub dasturchilarga biror loyiha ustida bir-biriga halaqit qilmagan holda jamoa bo'lib ishlash, dasturning turli versiyalarini nazorat qilib borish imkonini beradi (lekin biz bu haqida keyingi darslarimizning birida to'xtalamiz).

Bu darsda esa biz qanday qilib GitHubga loyihalarimizni yuklash, ulashish va boshqalarning loyihalarini ko'chirib olish haqida gaplashamiz.

## GITHUBDA RO'YXATDAN O'TAMIZ

Boshlanishiga [github.com](https://github.com/) sahifasiga o'tamiz va yangi akkaunt yaratamiz.

![Github.com sahifasi](/files/-MNR82FtXt5zR1G82UAv)

GitHubdan ro'yxatdan o'tish jarayoni juda oddiy, muhimi, email manzilingizga yuborilgan xatni tasdiqlashni unutmang.&#x20;

Ro'yxatdan o'tganingizdan so'ng, o'zngiz haqingizda qisqacha ma'lumot kiritib qo'yishni ham unutmang.

![Profaylni yangilash](/files/-MNR98crW0qh4liqrVyo)

## REPOSITORY

GitHubda har bir loyiha (dastur) alohida repositoryda saqlanadi. Repository omma uchun ochiq (Pulbic) yoki yopiq (Private) bo'lishi mumkin. Misol uchun, bizning darslarimiz uchun ham alohida [public repository ochilgan](https://github.com/anvarnarz/python-darslar). U yerga kirib siz darslarimizga oid kodlarni ko'chirib olishingiz mumkin. Repository bir nechta fayllar va papkalardan iborat bo'lishi tabiiy hol.

![python.sariq.dev uchun public repository](/files/-MNRAMS6XYAXTzBLWEWv)

### LOYIHALARIMIZ UCHUN REPOSITORY YARATAMIZ

Bo'sh repository yaratish uchun, github.com sahifasida **New** tugmasini bosamiz.

![Yangi repository yaratamiz](/files/-MNRD0kpjfgyNgiru5TU)

Yanig ochilgan oynada:

1. Repositorga ma'nili nom beramiz. Nom berishda kichik harflar bilan yozing va bo'sh joy o'rniga chiziqcha (`-`) ishlating.
2. Repository ommaga ochiq (public)yoki yopiq (private) bo'lishini tanlaymiz. Buni keyin ham o'zgartirish mumkin.
3. README faylini qo'shish (qo'shmalikni) tanlaymiz. README faylida siz loyiha haqida batafsil ma'lumot berishingiz mumkin. Agar loyiha omma uchun bo'lsa albatta README faylini ham tanlang va loyihangiz haqida ma'lumot bering.
4. Create Repository tugmasini bosamiz.

![Repository yaratamiz ](/files/-MNRED5vK-beVksC0Ebt)

Marhamat, repository tayyor. O'ng burchakdagi qalam tugmasini bosib, README faylini o'zgartirishimiz mumkin.

![Yangi repository](/files/-MNREizM2125cMZtS0Df)

Hozircha repository bo'sh. Keling endi repositoryga fayllar qo'shamiz. Aksar dasturchilar gtihub bilan mahsus kommandalar yordamida ishlasada, biz osonroq usuldan, GitHub Desktop dasturidan foydalanamiz.

### GitHub DESKTOP DASTURI

Boshlanishiga GitHub Desktop dasturini o'rntaylik. Buning uchun [desktop.github.com](https://desktop.github.com/) sahifasiga kiramiz va Download tugmasini bosamiz.

![GitHub Desktop sahifasi](/files/-MNRFn1BRKd2IWpfnvBr)

Linux OS ga GitHub desktop dasturini o'rnatish uchun [quyidagi sahifaga ](https://dev.to/rahedmir/is-github-desktop-available-for-gnu-linux-4a69#:~:text=Currently%2C%20Github%20Desktop%20for%20GNU,Hat%2FCentOS%2FFedora%20distributions.)kiring.

Yuklab olingan faylni ochamiz, va dasturni o'rnatamiz. Bu yerda qiyin joi yo'q. Dasturni birinchi ochganimizda Login qilish talab qilinadi.&#x20;

Login qilgandan so'ng yangi oynada sizning Repositorylaringiz ko'rsatilgan oyna ochiladi. Shuyerdan oxirgi yaratgan repositoryni tanlang va pastdagi Clone tugmasini bosing.

![GitHub desktop](/files/-MNRTZXluU5emJHXLvm0)

Yangi ochilgan oynada Repository uchun kompyuterimizda joy tanlaymiz:

![Yangi Repository uchun joy tanlaymiz](/files/-MNRTuOy-hR7PnvinGkh)

**DIQQAT!** Papkalar (fayllar) nomida Kirill harflari bo'lmasin. Ba'zida, bu dasturni bajarishda xatolikka olib kelishi mumkin.&#x20;

Repository sizning kompyuteringizga yuklandi. Lekin repository hozircha bo'sh.&#x20;

![Bo'sh Repository](/files/-MNRUcJbqFCtIlKbpnFF)

File Manager yordamida yuqoridagi Repository uchun yaratilgan papkaga kodlaringizni ko'chiring va GitHub desktop dasturiga qayting. Papkadagi barcha o'zgarishlar GitHub desktopda ham paydo bo'ldi. O'zgarishlarni Repositorga qo'shish uchun, *Summary* degan joyda o'zgarishlar haqida qisqacha ma'lumot bering va **Commit to main** tugmasini bosing.

![O'zgarishlarni Repositoryga yuklaymiz](/files/-MNRVVdGqRaRnSMgAMSI)

Va nihoyat, Repositoryni onlyanga yuklash uchun **Push origin** tugmasini bosing:

![Repositoryni onlaynga yuklaymiz](/files/-MNRVwGMLsST2atGzmTm)

Mana endi GitHub.com sahifasiga qaytib, Repository ichiga kirsak barcha fayllarimiz onlaynda turibdi. Istlagan faylni tanlab, ichidagi kodni ham ko'rishimiz mumkin.

![Repository yangilandi](/files/-MNRWREgwx1xTQtjUNcJ)

## PUBLIC REPOSITORYNI KO'CHIRIB OLISH (CLONE)

Juda ko'p dasturchilar o'zlarining loyihalari bilan omma bilan ulashish uchun Repositoryni Public qilib qo'yadilar. Shunday Repositorylarni kompyuterga ko'chirib olish uchun avval reposytiry sahifasiga kiramiz, so'ngra burchakda Code tugmasini va yangi ochilgan Menuda esa Open with GitHub Desktop tugmalarini bosamiz.

![Repositoryni ko'chirib olish](/files/-MNRX-b5k9d9P14OZ6Mb)

Yuqoridagi ka'bi Repository uchun kompyuterimizda yangi joy tanlaymiz, va Clone tugmasini bosamiz.

![Repository uchun joy tanlaymiz](/files/-MNRXKCBvGrVDRp5BMIS)

Marhamat, Repository kompyuteringizga yuklandi. Endi kodni ochib, istalgancha o'zgartirishingiz mumkin.&#x20;

## AMALIYOT

1. [GitHub.com](https://python.sariq.dev/lirik-chekinish-1/www.github.com) sahifasidan ro'yxatdan o'ting
2. Kompyuteringizga [GitHub Desktop ](https://desktop.github.com/)dasturini o'rnating
3. GitHubda Python darslari uchun yangi repository yarating
4. Shu vaqtgacha yozgan kodlaringizni yangi repositoryga yuklang
5. Sahifamizga qo'yib borilayotgan mashg'ulotlarning javoblarini quyidagi [repositorydan ](https://github.com/anvarnarz/python-darslar)o'zingizga Clone qilib oling:

python.sariq.dev repository
{% endembed %}

---''',
    vocabularyRaw: '''Git	Versiyalar nazorati tizimi (local)	git init
GitHub	Git repozitoriylari xostingi (web)	github.com
Repository	Loyiha saqlanadigan papka (repozitoriy)	git clone''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Yangi mahalliy Git repozitoriyasini yaratish buyrug\'i nima?''',
        answer: '''git init''',
      ),
      Exercise(
        number: 2,
        question: '''Mahalliy o\'zgarishlarni GitHub serveriga yuborish buyrug\'i nima?''',
        answer: '''git push''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 14,
    title: '''Lug\'at Bilan Tanishuv (Dictionary)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/dictionary/14-dictionary.md).

Ushbu darsda yangi ma'lumot turi, Lug'at (Dictionary) bilan tanishamiz. Dars davomida lug'at yaratish, unga ma'lumot qo'shish, lug'atning ichida ro'yxat yoki aksincha ro'yxatning ichida lug'at saqlash ka'bi mavuzlar bilan tanishamiz.

Lug'at, ma'lumotlarni bizga tushunarliroq ko'rinishda saqlash imkonini beradi. Misol uchun biz biror avtomobilga oid lug'at yaratishimiz va lug'atda shu avtoga tegishli barcha ma'lumotlarni saqlashmiz mumkin (nomi, rangi, yili, motori, narhi va hokazo).&#x20;

## LUG'AT (DICTIONARY) NIMA?

Keling, nima uchun bu ma'lumot turi lug'at (dictionary) deyilishini tushunish uchun, oddiy lu'gatga qaraymiz. Odatda, lug'atdagi ma'umotlar ikki qismdan iborat bo'ladi: kalit so'z va izoh (yoki tarjima).

![Izholi Lug'at (savodxon.uz) / English-Uzbek Dictionary (SmartBox) dasturlari](/files/-MNaJDYQQBk0tbr92K29)

Xuddi oddiy lug'atlardagi ka'bi Python lug'atidagi ma'lumotlar ham ikki qismdan iborat bo'ladi: kalit so'z va qiymat (ingliz tilida *key-value pair* yoki *kalit so'z-qiymat juftligi* deyiladi).

Dasturlashda ko'p ishlatiladigan atamalarni ingliz tilida yodlab qolish juda muhim! Bu sizga kelajakda yangi ma'lumotlar izlashda, xatolar usitda ishlashda va umuman ish faoliyatingizda ko'p asqotadi. Shuing uchun variable, integer, float, string, list, tuple, dictionary, function, loop, va boshqa so'zlarni yaxshilab o'zlashtirib oling.

Keling, sodda lug'at yaratamiz:

```python
car_0 = {'model':'ferrari','rang':'qizil'}
```

Yuqorida `car_0` degan lug'at yaratdik. Lu'gatda 2 ta ma'lumot bor: mashinaning modeli (ferrari) va rangi (qizil). Bu yerda `'model'` va `'rang'` kalit so'zlar, `'ferrari'` va `'qizil'` esa mos keluvchi kalit so'zlarning qiymatlari. Kalit so'z va qiymat orasi ikki nuqta (`:`) bilan, lug'atdagi har bir juftlik esa vergul (`,`) bilan ajratilgan.&#x20;

## LUG'AT BILAN ISHLASH

Demak, Pytonda lug'at *kalit so'z-qiymat* juftliklarining yi'ginidisi ekan. Lug'atdagi biror qiymatni ko'rish uchun unga kalit so'z orqali murojat qilamiz:

```python
car_0 = {'model':'ferrari','rang':'qizil'}
print(car_0['model'])
```

Natija: `ferrari`

```python
print(car_0['rang'])
```

Natija: `qizil`

Lug'atdagi qiymatlar son (`int`, `float`), matn (`string`), ro'yxat (`list`, `tuple`) va hatto boshqa lug'at ham bo'lishi mumkin.

```python
talaba_0 = {'ism':'murod olimov','yosh':20,'t_yil':2000}
print(f"{talaba_0['ism'].title()},\
 {talaba_0['t_yil']}-yilda tu'gilgan,\
 {talaba_0['yosh']} yoshda")
```

Natija: `Murod Olimov, 2000-yilda tu'gilgan, 20 yoshda`

### YANGI JUFTLIK QO'SHISH

Lug'aga yangi kalit so'z va qiymatlar qo'shishimiz ham mumkin. Keling, yuqoridagi `talaba_0` nomli lu'gatga yana 2 ta yangi, kurs va fakultet nomli, kalit so'zlar va qiymatlar qo'shamiz:

```python
talaba_0['kurs'] = 4 # yangi, 'kurs' nomli kalit so'zga 4 qiymatini yuklaymiz
talaba_0['fakultet'] = 'informatika' # 'fakultet' ga esa 'informatika' 
```

Lug'atni konsolga chiqarib ko'ramiz:

```python
print(talaba_0)
```

Natija: `{'ism': 'abdulloh', 'yosh': 20, 't_yil': 2000, 'kurs': 4, 'fakultet': 'informatika'}`

### BO'SH LUG'AT

Ba'zida dastur boshida bo'sh lug'at yaratib, dastur davomida lug'atga yangi ma'lumotlar kiritib borish talab qilinishi mumkin. Bundah holatda bo'sh lug'at quyidagicha yaratiladi:

```python
talaba_1 = {}
```

Dastur davomida esa lug'atga qiymatlar kiritib borilishi mumkin:

```python
talaba_1['ism'] = 'qobil rasulov'
talaba_1['kurs'] = 3
talaba_1['yosh'] = 20
print(talaba_1)
print(f"Talaba {talaba_1['ism'].title()} {talaba_1['kurs']}-kurs")
```

Natija:&#x20;

`{'ism': 'qobil rasulov', 'kurs': 3, 'yosh': 20}`

`Talaba Qobil Rasulov 3-kurs`

Lug'atga kalit so'zlar qanday ketma-ketlikda kiritilsa, shu ketma-ketlik saqlanib qoladi.

### QIYMATNI O'ZGARTIRISH

Biror kalit so'zga tegishli qiymatni o'zgartirish esa quyidgachia amalga oshiriladi:

```python
talaba_1['kurs'] = 4 # 'kurs' ni 4 ga o'zgartiramiz.
print(f"Talaba {talaba_1['ism'].title()} {talaba_1['kurs']}-kurs")
```

Natija: `Talaba Qobil Rasulov 4-kurs`

### KALIT SO'Z-QIYMAT JUFTLIGINI O'CHIRISH

Lu'gatdagi biror juftlik kerak emas bo'lsa uni del operatori yordamida lug'atdan olib tashlashimiz mumkin:

```python
talaba_0 = {'ism':'murod olimov','yosh':20,'t_yil':2000}
print(talaba_0)
del talaba_0['yosh'] # yosh degan kalit so'z (va qiymatni) o'chiramiz
print(talaba_0)
```

Natija:

`{'ism': 'murod olimov', 'yosh': 20, 't_yil': 2000}`&#x20;

`{'ism': 'murod olimov', 't_yil': 2000}`

### LUG'ATNI QATORLARGA BO'LIB YOZISH

Uzung lug'atlarni bir necha qatorga bo'lib yozishimiz ham mumkin. Keling quyidagi misolni ko'ramiz, siz do'stlaringizdan ular qanday telefon ishlatishini so'radingiz va javoblarni bitta lug'atga joylamoqchisiz:

```python
telefonlar = {
    'ali':'iphone x',
    'vali':'galaxy s9',
    'olim':'mi 10 pro',
    'orif':'nokia 3310'
    }
```

Demak, lug'atni qatorga bo'lib yozish uchun katta qavs ochamiz, yangi qatordan joy tashlab, birinchi klit so'z va qiymatni kiritamiz, qator oxirida vergul qo'yib, yangi qatordan keyingi juftlikni yozamiz va hokazo. Oxirgi juftlikdan so'ng vergul qo'ymasdan qator tashlab, katta qavsni yopamiz.

Lug'atlarning ishlatilish doirasi juda keng va sizning yondoshuvingizga bog'liq xolos. Yuqoridagi lug'atga ham e'tibor qilsangiz, biz bir narsa (shaxs, avto) haqida ko'p ma'lumotlarni emas,  ko'pchilik haqida bir hil ma'lumotlarni saqladik.&#x20;

### `get()` METODI

Biz shu vaqtgacha lug'atdagi qiymatlarni ko'rish uchun to'g'ridan-to'g'ri kalit so'z orqali murojat qilayotgan edik. Bu usulning kamchiligi shundaki, agar lug'atda siz so'ragan kalit topilmasa, dastur **KeyError** xatoligi bilan to'xtab qoladi.

```python
phone = telefonlar['ali']
print(f"Alining telefoni {phone}")
```

Natija: `Alining telefoni iphone x`

```python
phone = telefonlar['hasan']
print(f"Hasanning telefoni {phone}")
```

Natija: **`KeyError: 'hasan'`**

Lug'atda `'hasan'` kalit so'zi bo'lmagani uchun, yuqoridagi kod **KeyError** degan xatoni qaytardi. KeyError ham [Run time error](https://python.sariq.dev/lirik-chekinish-1/12-xatolar#run-time-error-dasturni-bajarishda-xatolik) qatoriga kiradi.

Biz kelgusi darslarimizda Pythondagi xatolarni dastur bajarilishi jarayonida "tutib olishni" o'rganamiz. Hozircha esa `get()` metodi yordamida lug'atga murojat qilish va mavjud bolmagan kalitning o'rniga biror xabar qaytarishni ko'raylik.

```python
phone = telefonlar.get('hasan','Bunday ism mavjud emas')
```

Yuqorida, lug'at nomidan so'ng .get() metodini yozdik, va argumentlar sifatida kalit so'z (`'hasan'`) va kalit mavjud bo'lmaganda chiqadigan xabarni yozdik (`'Bunday ism mavjud emas'`).

```python
print(phone)
```

Natija: `Bunday ism mavjud emas`

Agar `.get()` metodida ikkinchi argumentni tashlab ketsangiz, va kalit mavjud bo'lmasa `.get()` metodi `None` degan qiymatni qaytaradi. `None` - qiymat mavjud emas degan ma'noni beradi.

```python
phone = telefonlar.get('hasan')
print(phone)
```

Natija: `None`

## AMALIYOT

* otam (onam, akam, ukam, va hokazo) degan lug'at yarating va lug'atga shu inson haqida kamida 3 ta m'alumot kiriting (ismi, tu'gilgan yili, shahri, manzili va hokazo). Lug'atdagi ma'lumotni matn shaklida konsolga chiqaring :`Otamning ismi Mavlutdin, 1954-yilda, Samarqand viloyatida tug'ilgan`
* Oila a'zolaringizning sevimli taomlari lug'atini tuzing. Lug'atda kamida 5 ta ism-taom jufltigi bo'lsin. Kamida uch kishining sevimli taomini konsolga chiqaring: `Alining sevimli taomi osh`
* Python izohli lu'gati tuzing: Lug'atga shu kunga qadar o'rgangan 10 ta so'z (atamani) kiriting (masalan integer, float, string, if, else va hokazo) va har birining qisqacha tarjimasini yozing.
* Foydalanuvchidan biror so'z kiritishni so'rang va so'zning tarjimasini yuqoridagi lug'atdan chiqarib bering. Agar so'z lu'gatda mavjud bo'lmasa, "Bunda so'z mavjud emas" degan xabarni chiqaring.

![](/files/-MNbnkUZgJ8dcfyFdjlZ)

* Yuqoridagi vazifani `if-else` yordamida qiling va natijani ham foydalanuvchiga tushunarli ko'rinishda chiqaring.

![](/files/-MNbofpMEB7oOR-awK4e)

## JAVOBLAR

Javoblar bizning [GitHub](https://github.com/anvarnarz/python-darslar) sahifamizda hamda quyidagi [Repl.it](https://repl.it/@anvarbek/javoblar-14-dars#main.py) portalida mavjud.

---''',
    vocabularyRaw: '''{}	Lug\'at yaratish qavslari	d = {}
key	Lug\'at kalit so\'zi (indeks o\'rnida)	\'ism\'
value	Kalitga mos keladigan qiymat	\'Murod\'''',
    exercises: [
      Exercise(
        number: 1,
        question: '''car = {\'model\': \'Lacetti\'} bo\'lsa, \'model\' kaliti qiymatini ekranga chiqaring.''',
        answer: '''car = {\'model\': \'Lacetti\'}
print(car[\'model\'])''',
      ),
      Exercise(
        number: 2,
        question: '''Lug\'at yaratishda qaysi qavslar ishlatiladi?''',
        answer: '''figurali qavslar''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 15,
    title: '''Lug\'at elementlari va Sets''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/dictionary/15-dictionary-sets.md).

Avvalgi darsimizda lug'at bilan tanishdik, va lug'atdagi elementlarga kalit so'z bo'yicha murojat qilishni o'rgandik. Lug'atlar katta yoki kichik bo'lishi mumkin. Ba'zida lug'atdagi barcha kalitlarni yoki qiymatlarni bilmasligimiz mumkin. Bunday holatda qanday yo'l tutamiz?&#x20;

Ushbu darsimizda lug'at elementlarini turli usullar yordamida chiqarishni o'rganamiz.

## `.items()` METODI

Ushbu metod yordamida lug'at ichidagi barcha kalit-qiymat juftliklarini ko'rishimiz mumkin.&#x20;

```python
talaba_0 = {
    'ism':'alijon',
    'familiya':'shamshiyev',
    'yosh':22,
    'fakultet':'matematika',
    'kurs':4
    }

print(talaba_0.items())
```

Natija: `dict_items([('ism', 'alijon'), ('familiya', 'shamshiyev'), ('yosh', 22), ('fakultet', 'matematika'), ('kurs', 4)])`

Bu metodni to'g'ridan-to'g'ri emas, for tsikli yordamida chaqirish orqali lug'atdagi barcha elementlarni tushunarliroq shaklda ko'rishimiz mumkin.

```python
for kalit, qiymat in talaba_0.items():
    print(f"Kalit: {kalit}")
    print(f"Qiymat: {qiymat} \n")
```

![Natija](/files/-MNggiVPXVuciLOgSZNr)

Yuoqirdagi kodda, `talaba_0` lug'atidagi har bir kalit va qiymat juftligini konslga chiqardik. E'tibor bering, `for` tsiklida biz bir emas ikkita o'zgaruvchi yaratib oldik (`kalit` va `qiymat`).

Bu usul ba'zi lug'atlardagi ma'lumotlarni chiroyli ko'rinishda chiqarish uchun juda qo'l keladi.

```python
telefonlar = {
    'ali':'iphone x',
    'vali':'galaxy s9',
    'olim':'mi 10 pro',
    'orif':'nokia 3310'
    }

for k, q in telefonlar.items():
    print(f"{k.title()}ning telefoni {q}")
```

![Natija](/files/-MNghg8x2TD37b7PDZ8X)

## `.keys()` METODI

Agar lug'atdagi kalit so'zlarni ko'rish talab qilinsa, .keys() metodidan foydalanishimiz mumkin.

```python
mahsulotlar = { # Do'kondagi mahsulotlar
    'olma':10000,
    'anor':20000,
    'uzum':40000,
    'anjir':25000,
    'shaftoli':30000
    }

print(mahsulotlar.keys())
```

Natija: `dict_keys(['olma', 'anor', 'uzum', 'anjir', 'shaftoli'])`

```python
print('Do\'kondagi mahsulotlar:')
for mahsulot in mahsulotlar.keys():
    print(mahsulot.title())
```

![Natija](/files/-MNgmjhB7f6522gb_qQp)

Yuqoridagi kodimizda, `for` tsiklida `.keys()` metodini ishlatmasak ham huddi shu natija chiqadi.

`for` tsikli va `if` sharti yordamida lug'atdagi biror qiymatlarni alohida chiqarishimiz ham mumkin:

```python
bozorlik = ['anor','uzum','non','baliq']
for mahsulot in mahsulotlar:
    if mahsulot in bozorlik:
        print(f"{mahsulot.title()} {mahsulotlar[mahsulot]} so'm")
```

![Natija](/files/-MNgkofDwlP-EAeMnZ2r)

Yuqordagi kodga e'tibor bering. Biz avval `borolik` degan ro'yxat yaratdik (uyga bozor qilyapmiz), keyin esa `mahsulotlar` lug'atidagi har bir mahsulotni bizdagi `bozorlik` ro'yxati bilan solishtirdik. Agar mahsulot bizning `bozorlik` ro'yxatimizda bo'lsa, uning narhini konsolga chiqardik.

Quyidagi misolda esa aksincha, bozorlik ro'yxatidagi har bir elementni do'kondagi mahsulotlar bilan solishtiramiz, va mahsulot do'konda yo'q bo'lsa, do'konga murojat qoldiramiz:

```python
for buyum in bozorlik:
    if buyum not in mahsulotlar:
        print(f"Iltimos, do'koningizga {buyum} ham olib keling")
```

![Natija](/files/-MNgnrZM-h2YkarCrrrr)

### LUG'AT ELEMENTLARINI TARTIB BILAN CHIQARISH

Pythonda lug'at elementlari siz (foydalanuvchi) kiritgan tartibda saqlanadi. Agar lug'at elementlarini alifbo bo'yicha chiqarish talab qilinsa, sorted() funktsiyasidan foydalanamiz.

```python
print("Do'konimizdagi mahsulotlar:")    
for mahsulot in sorted(mahsulotlar):
    print(mahsulot.title())
```

![Natija](/files/-MNgofYwolTO9GFvBEjB)

## `.values()` METODI

Agar lug'atdagi qiymatlarni chiqarish talab qilinsa .values() metodidan foydalanishimiz mumkin.&#x20;

```python
print(telefonlar.values())
```

Natija: `dict_values(['iphone x', 'galaxy s9', 'mi 10 pro', 'nokia 3310']`

```python
print('Foydalanuvchilar quyidagi telefonlarni ishlatishadi:')
for tel in telefonlar.values():
    print(tel)
```

![Natija](/files/-MNgpaTyEMgk9EaDcwjJ)

Yuqoridagi usul bilan qiymatlarni chiqrganimizda, lug'atdagi barcha qiymatlar chiqib keladi. Agar, biror qiymat ko'p marta qaytarilsa, konsolga ham ko'p marta chiqib keladi.

Quyidagi misloni ko'raylik:

```python
telefonlar = {
    'ali':'iphone x',
    'vali':'galaxy s9',
    'olim':'mi 10 pro',
    'orif':'nokia 3310',
    'hamida':'galaxy s9',
    'maryam':'huawei p30',
    'tohir':'iphone x',
    'umar':'iphone x'    
    }

print('Foydalanuvchilar quyidagi telefonlarni ishlatishadi:')
for tel in telefonlar.values():
    print(tel)
```

![Natija](/files/-MNgqhVwuvyYEg_bjo7p)

Yuoqirdagi natijaga e'tibor bersanigz, bir nechta foydalanuvchilar **iphone x** va **galaxy s9** telefonidan foydalanishar ekan, va bu modellar qayta-qayta konsolga chiqdi.&#x20;

Buning oldini olish uchun `set()` funktsiyasidan foydalanishimiz mumkin.

```python
print('Foydalanuvchilar quyidagi telefonlarni ishlatishadi:')
for tel in set(telefonlar.values()):
    print(tel)
```

![Natija](/files/-MNgrri2Sg7ZTr-nl-Tp)

Pythonda `set` yana bir ma'lumot turi bo'lib, ro'yxat va lug'at kabi bir nechta elementlarni saqlashga mo'ljallangan. Lug'at va ro'yxatdan farqli ravishda, set ichidagi elementlar biror tartibda saqlanmaydi, va ularga indeks orqali murojat qilib bo'lmaydi. Shuningdek, set ichida bir hil elementlar bo'lmaydi.

## AMALIYOT

* Python izohli lug'atini yarating va lug'atga kamida 10 ta so'z qo'shing. Lug'atdagi har bir kalit va qiymatni for tsikli yordamida, alifbo ketma-ketligida chiroyli qilib konsolga chiqaring.&#x20;

![Kutilgan natijaga misol](/files/-MNiJqfgxoHAfgiCaO8b)

* Davlatlar va ularning poytaxtlari lug'atini tuzing. Avval lug'atdagi davlatlarni, keyin poytaxtlarni alohida-alohida, alifbo ketma-ketligida konsolga chiqaring.&#x20;

![Kutilgan natijaga misol](/files/-MNiKbOCp4q0M37kcXqq)

* Foydalanuvchidan istalgan davlatni kiritishni so'rang va shu davlatning poytaxtini konsolga chiqaring. Agar foydalanuvchi lug'atda yo'q davlatni kiritsa, "Bizda bunday ma'lumot yo'q" degan xabarni chiqaring.

![Kutilgan natijaga misol](/files/-MNiMFqTfCba-zztFdqF)

* Restoran menusi lug'atini tuzing (kamida 10 ta taom-narh juftligini kiriting). Foydalanuvchidan 3 ta ovqat buyurtma berishni so'rang. Foydalanuvchi kiritgan taomlarni menu bilan solishtiring, agar taom menuda bo'lsa narhini ko'rsating, aks holda "bizda bunday taom yo'q" degan xabarni chiqaring.

![Kutilgan natijaga misol](/files/-MNiOagGFTFR_dnoSTLu)

## JAVOBLAR

JAvoblarni [GitHub repositoryda](https://github.com/anvarnarz/python-darslar) yoki Repl.it sahifamizda ko'rishingiz mumkin.

### GitHub

### Repl.it

---''',
    vocabularyRaw: '''.items()	Lug\'atning kalit va qiymatlarini juftlikda olish	d.items()
.values()	Lug\'atning faqat qiymatlarini olish	d.values()
set	Takrorlanmaydigan to\'plam turi	s = {1, 2, 3}
add()	Set ga element qo\'shish metodi	s.add(4)''',
    exercises: [
      Exercise(
        number: 1,
        question: '''s = {1, 2, 2} to\'plami yaratilganda elementlar soni (len) nechta bo\'ladi?''',
        answer: '''2''',
      ),
      Exercise(
        number: 2,
        question: '''Lug\'atning faqat kalitlarini qaytaradigan metod nomi?''',
        answer: '''keys()''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 16,
    title: '''Nesting (Ichma-ich tuzilmalar)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/dictionary/16-nesting.md).

## NESTING

Ba'zida dasturlash jarayonida lug'atning ichida ro'yxatlar yoki boshqa lug'atni, yoki aksincha ro'yxat ichida lug'atni saqlash ham qo'l kelishi mumkin. Bu ingliz tilida **Nesting** deyiladi. Nesting Pythondagi foydali xususiyatlardan biri.

Keling, bunga bir nechta misollar ko'ramiz.

## LUG'ATLAR RO'YXATI

Biz avvalgi darsimizda talabalarning ma'lumotlarini lug'at shaklida saqlashni ko'rgan edik. Shunday talabalardan yuzlab bo'lganda, ularning har biriga alohida lug'at qilishimiz tabiiy, lekin bu lug'atlar bilan ishlash qiyinchilik tug'dirishi mumkin. Shunday xolatda barcha lug'atlarni (talabalarni) bitta ro'yxatga joylab, ular ustida turli amallar bajarish mumkin.

Kelin quyidagi misolni ko'ramiz, bazamizda bir nechta mashinalar bor. Har bir mashina alohida lug'at shaklida.&#x20;

```python
car0 = {
        'model':'lacetti',
        'rang':'oq',
        'yil':2018,
        'narh':13000,
        'km':50000,
        'korobka':'avtomat'
        }

car1 = {
        'model':'nexia 3',
        'rang':'qora',
        'yil':2015,
        'narh':9000,
        'km':89000,
        'korobka':'mexanika'
        }

car2 = {
        'model':'gentra',
        'rang':'qizil',
        'yil':2019,
        'narh':15000,
        'km':20000,
        'korobka':'mexanika'
        }
```

&#x20;Agar biz har bir lug'atga alohida murojat qiladigan bo'lsak, lug'atlarning nomlarini yodlab qolishimiz talab qilinar edi:

```python
car = car0
print(f"{car['model'].title()},\
  {car['rang']} rang,\
  {car['yil']}-yil, {car['narh']}\$")

car = car1
print(f"{car['model'].title()},\
  {car['rang']} rang,\
  {car['yil']}-yil, {car['narh']}\$")

car = car2
print(f"{car['model'].title()},\
  {car['rang']} rang,\
  {car['yil']}-yil, {car['narh']}\$")  
```

![Natija](/files/-MNpwsfbOzsbD_t2fSwN)

Keling, barcha avtolarni bitta ro'yxatga joylaymiz, va for tsikli yordamida birma-bir konsolga chiqaramiz:

```python
cars = [car0, car1, car2]
for car in cars:
    print(f"{car['model'].title()}, "
          f"{car['rang']} rang, "
          f"{car['yil']}-yil, {car['narh']}\$")
```

![Natija](/files/-MNpyPHGOL5-O23uZsH1)

E'tibor bering, ishimiz bir muncha yengillashdi, kodimiz ham qisqardi. Natija esa bir hil.

Endi biz ro'yxat ichidagi istalgan lug'atga indeks bo'yicha murojat qilaveramiz (lug'at nomini yodlab qolish shart emas).

```python
print(cars[0])
```

Natija: `{'model': 'lacetti', 'rang': 'oq', 'yil': 2018, 'narh': 13000, 'km': 50000, 'korobka': 'avtomat'}`

Biror lug'atdagi elementga murojat qilish uchun esa quyidagi usuldan foydalanishimiz mumkin:

```python
print(cars[0]['model'])
```

Natija: `lacetti`

```python
print(f"{cars[2]['rang'].title()} "
      f"{cars[2]['model']}")
```

Natija: `Qizil gentra`

`for` tsikli yordamida biz bo'sh lug'atlar ro'yxatini ham yaratib olishimiz mumkin:

```python
malibus=[] # Malibu mashinalari uchun bo'sh ro'yxat yaratdik
for n in range(10):
    new_car = { # har bir yangi mashina uchun lug'at yaratamiz
        'model':'malibu',
        'rang':None, # rangi noaniq
        'yil':2020,
        'narh':None, # narhi belgilanmagan
        'km':0,
        'korobka':'avto'
        }
    malibus.append(new_car) # yangi lug'atni ro'yxatga qo'shamiz
```

Yuqoridagi misloda biz 10 ta Malibu mashinasidan iborat ro'yxat tuzdik. E'tibor qiling, `'rang'` kalitiga qiymat bermadik va `None` deb qoldirdik. Endi ishlab chiqarish jarayonida mashinalarga turli ranglarni berishimiz mumkin.  Misol uchun birinchi 3 ta mashinaga qizil rang beramiz:

```python
for malibu in malibus[:3]:
    malibu['rang']='qizil'
```

Keyingi 3 tasiga esa qora:

```python
for malibu in malibus[3:6]:
    malibu['rang']='qora'
```

Oxirgi 4 ta avtoni qora, lekin korobkasini mexanika qilamiz:

```python
for malibu in malibus[6:]: # ohirgi 4 ta mashinani
    malibu['rang']='qora'  # rangi qora
    malibu['korobka']='mexanika' # korobkasi mexanika
```

Keling endi, mashinalarning korobkasidan chiqqan holda narh belgilaymiz:

```python
for malibu in malibus:
    if malibu['korobka']=='avto':
        malibu['narh']=40000
    else:
        malibu['narh']=35000
```

![Natija](/files/-MNq8vU8dGx4tCTrTy2y)

## LUG'AT ICHIDA RO'YXAT

Bir kalitga bir nechta qiymatlar berish talab qilinganda, qiymatlarni ro'yxat ko'rinishida yozish o'rinlidir. Misol uchun, bir tashkilotda bir nechta dasturchilar ishlaydi va har bir dasturchi turli dasturlash tillarini biladi. Keling dasturchilar lug'atini tuzamiz va har bir dasturchi haqidagi ma'umotni konsolga chiqaramiz:

```python
dasturchilar = {
    'ali':['python','c++'],
    'vali':['html','css','js'],
    'hasan':['php','sql'],
    'husan':['python','php'],
    'maryam':['c++','c#']
    }

for ism, tillar in dasturchilar.items():
    print(f"\n{ism.title()} quyidagi dasturlash tillarini biladi:")
    for til in tillar:
        print(til.upper())
```

![Natija](/files/-MNqE-T60xXpDdk9hPT5)

Pythondagi `print()` funktsiyasi har bir matndan so'ng yangi qator tashlaydi. Buning oldini olish uchun quyidagi usuldan foydalanish mumkin: `print(string, end = '')`

```python
for ism, tillar in dasturchilar.items():
    print(f"\n{ism.title()} quyidagi dasturlash tillarini biladi:", end='')
    for til in tillar:
        print(f'{til.upper()} ', end='')
```

![Natija](/files/-MNqFUa1V-LYyyRDYyj3)

## LUG'AT ICHIDA LUG'AT

Bunday qilish tavsiya etilmasada, istisno holatlarda lug'at ichidagi qiymatlarni lug'at ko'rinishida ham saqlash mumkin. Misol uchun, ish joyingizdagi hamkasblaringiz haqidagi ma'lumotlarni saqlashda, hamkasbingizning ismi kalit, u haqidagi ma'lumotlarni esa lug'at ko'rinishida berilishi mumkin.

```python
hamkasblar = {
    'ali':{'familiya':'valiyev',
           'tyil':1995,
           'malumot':'oliy',
           'tillar':['python','c++']
           },
    'vali':{'familiya':'aliyev',
            'tyil':2001,
            'malumot':"o'rta-maxsus",
            'tillar':['html', 'css', 'js']},
    'hasan':{'familiya':'husanov',
             'tyil':1999,
             'malumot':'maxsus',
             'tillar':['python','php']}
    }
```

Hamkasblar to'g'risidagi ma'lumotlarni esa quyidagicha ko'rish mumkin:

```python
for ism, info in hamkasblar.items():
    print(f"\n{ism.title()} {info['familiya'].title()}, "
          f"{info['tyil']}-yilda tug'ilgan. "
          f"Ma'lumoti: {info['malumot']}. \n"
          "Quyidagi dasturlash tillarini biladi:")
    for til in info['tillar']:
        print(til.upper())
```

![Natija](/files/-MNqNfc5sBBrlfjVC11l)

Lug'at ichidagi lug'atlar bir hil tuzilishga ega bo'lgani ishingizni ancha yengillashtiradi, aks holda kodingiz murakkablashib ketishi mumkin.

## AMALIYOT

* Adabiyot (ilm-fan, san'at, internet) olamidagi 4 ta mashxur shaxlar haqidagi ma'lumotlarni lug'at ko'rinishida saqlang. Lug'atlarni bitta ro'yxatga joylang, va har bir shaxs haqidagi ma'lumotni konsolga chiqaring.

![Kutilgan natijaga misol](/files/-MNqVcYbotAHFkflO1Jx)

* Yuqoridagi lug'atlarga har bir shaxsning mashxur asarlari ro'yxatini ham qo'shing. For tsikli yordamida muallifning ismi va uning asarlarini konsolga chiqaring.

![Natija](/files/-MNqaJZEJsx8fmy5B9uD)

* Oila a'zolaringiz (do'stlaringiz) dan 3 ta sevimli kino-seriali haqida so'rang. Do'stingiz ismi kalit, uning sevimli kinolarini esa ro'yxat ko'rinishida lug'artga saqlang.  Natijani konsolga chiqaring.

![Kutilgan natijaga misol](/files/-MNqcX84QqZhYtVAo6Td)

* Davlatlar degan lug'at yarating, lug'at ichida bir nechta davlatlar haqida ma'lumotlarni lug'at ko'rinishida saqlang. Har bir davlat haqida ma'lumotni konsolga chiqaring.

![Kutilgan natijaga misol](/files/-MNqgphoTHjdFMfHVwBi)

* Yuqoridagi dasturga o'zgartirish kiriting: konsolga barcha davlatlarni emas, foydalanuvchi so'ragan davlat haqida ma'lumot bering. Agar davlat sizning lug'atingizda mavjud bo'lmasa, "*Bizda bu davlat haqida ma'lumot yo'q*" degan xabarni chiqaring.

![Kutilgan natijaga misol](/files/-MNqj4Q_4iY5_ZdY-85r)

## JAVOBLAR

### GitHub

### Repl.it

---''',
    vocabularyRaw: '''Nesting	Ichma-ich joylashgan ma\'lumotlar tuzilmasi	list of dicts
matrix	Ikki o\'lchamli ro\'yxatlar (Nesting namunasi)	[[1,2],[3,4]]''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Lug\'at ichida ro\'yxat yaratish mumkinmi?''',
        answer: '''ha''',
      ),
      Exercise(
        number: 2,
        question: '''Nesting nima?''',
        answer: '''ichma-ich joylashuv''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 17,
    title: '''While Tsikli''',
    introduction: '''Description: Fetched live

Source: https://python.sariq.dev/while/17-while-loop.md

---

> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/while/17-while-loop.md).

## YANA `input()`

Dasturlar foydalanuvchining muammolarini hal qilish uchun yoziladi. Buning uchun esa, foydalanuvchi bilan aloqa o'rnatish, undan turli ma'lumotlarni qabul qilib olib talab etiladi. Misol uchun, dasturimiz foydalanuvchiga ismi bilan murojat qilishi uchun, avval uning ismini so'rashi kerak. Yoki, foydalanuvchi istagan ma'lumotni topish uchun avval undan biror kalit so'z kiritishni so'rash kerak va hokazo.

Biz avvalgi darsimizda `input()` yordamida foydalanuvchidan qiymat qilishni o'rgangan edik. Dastur davomida `input()` funktsiyasini chaqirganimizda dastur foydalanuvchi biror matn kiritiib, Enter tugmasini bosgunga qadar to'xtab turadi.&#x20;

Foydalanuvchi kiritgan qiymatni biror o'zgaruvchiga yuklash, va undan dastur davomida foydalanish mumkin.

```python
ism = input("Ismingiz nima? ")
print(f'Salom, {ism.title()}')
```

![Natija](/files/-MOEVSU_iCKgJE7dktRn)

input() finktsiyasi ichidagi matn ingliz tilida prompt, savol deyiladi. Aslida biz savolni ham o'zgaruvchiga yuklab, shaxsiy so'rovnomalar ham yaratishimiz mumkin.

```python
ism = input("Ismingiz nima? ")
savol = f"Salom, {ism.title()}. Yoshingiz nechida? "
yosh = input(savol)
```

![Natija](/files/-MOEX4iI_UOcEortEje-)

Yuqorida birinchi input() bilan foydalanuvchi ismini so'radik va yangi savol matnini yasab oldik.&#x20;

### Sonlar va input()

`input()` funktsiyasi har qanday kiritilgan qiymatni matn sifatida qabul qilib oladi. Agar foydalanuvchidan son talab qilinsa, foydalanuvchi kiritgan qiymatni butun (integer) yoki on'lik (float) son ko'rinishiga o'tkazib olish kerak.

Buning uchun int() yoki float() funktsiyalaridan foydalanamiz.

```python
ism = input("Ismingiz nima? ")
savol = f"Salom, {ism.title()}. Yoshingiz nechida? "
yosh = input(savol)
yosh = int(yosh) # yosh ni butun songa o'tkazamiz
height = input("Bo'yingiz necha metr? ")
height = float(height) # bo'yni o'nlik songa o'tkazamiz
```

![Natija](/files/-MOEYiolw5xKF0PDt5j0)

Foydalanuvchidan qiymat so'raganingizda input()ichidagi savolni aniq va tushunarli qilib yozing. Masalan: `input("Tug'ilgan yilingizni kiriting: ")`

## `while` TSIKLI BILAN TANISHAMIZ

Biz avvalroq `for` tsikli bilan tanishgan edik. `for` tsikli ma'lum bir ro'yxatni olib, ro'yxat ichidagi qiymatlar tugaginga qadar biror kodni takrorlar edi. `while` ham takrorlash operatori bo'lib, `for` dan farqli ravishda, toki ma'lum bir shart to'g'ri (`True`) bo'lsa, kodni takrorlayveradi. &#x20;

while so'zi ingiz tilidan "toki" yoki "-gacha" deb tarjima qilinadi.

Keling sodda misol ko'ramiz, while yordamida 5 gacha sanaymiz:

```python
son = 1 # son ga 1 qiymatini beramiz
while son<=5: # toki son 5 dan kichik yoki teng ekan...
    print(son, end=' ') # son ni konsolga chiqaramiz,
    son = son+1 # songa 1 qo'shamiz.
```

Natija: `1 2 3 4 5`

Yuqoridagi kodni tahlil qilamiz:&#x20;

* avval `son` degan o'zgaruvchi yaratdik va unga `1` qiymatini berdik.&#x20;
* 2-qatorda esa toki `son` 5 dan kichik yoki teng ekan 3-4-qatorlarni bajar dedik.&#x20;
* 3-qatorda `son` ni konsolga chiqardik
* 4-qatorda `son` ga `1` qo'shdik.&#x20;
* 4-qatordan so'ng kod yana 2-qatorga qaytadi va `son<=5` shartini tekshiradi, agar shart bajarilsa 3-4 qator qayta-qayta bajarilaveradi.&#x20;
* 5-qadamdan so'ng `son=5` bo'lganda `while` tsikli to'xtaydi.

Pythonda += operatori bor. Bu operator o'ng tarafdagi qiymatni chap tarafdagi qiymatga qo'shadi. Misol uchun, yuqorida `son = son + 1` o'rniga `son += 1` deb yozishimiz mumkin.

## `while` va `input()`

Shu paytgacha yozgan dasturlarimiz faqatgina bir martta bajarilayotgan edi. while tsikli yordamida dasturni to'xtatish imkoniyatini foydalanuvchiga berishimiz mumkin.

```python
print("Kiritilgan sonning kvadratini qaytaruvchi dastur.")
savol = "Istalgan son kiriting "
savol += "(dasturni to'xtatish uchun 'exit' deb yozing): "
qiymat = ''
while qiymat != 'exit':
    qiymat = input(savol)
    if qiymat != 'exit':
        print(float(qiymat)**2)
```

![Natija](/files/-MOEiAxG-SUNnII030jU)

Yuoqridagi dasturimiz toki foydalanuvchi `exit` deb yozguniga qadar takrorlanaveradi.

### Ishora (flag)

Yuqoridagi dasturda dasturni to'xtatish uchun yagona shartni tekshirdik (qiymat!='exit'), katta dasturlarda bir emas bir nechta shartlarni tekshirish, va ulardan biri bajarilgan taqdirda dasturni to'xtatish talab qilinishi mumkin.&#x20;

Bunday holatlarda biror o'zgaruvchidan ishora (flag) sifatida foydalanishimiz mumkin. Agar dastur bajarilishi davomida dasturni to'xtatish shartlaridan biri bajarilganda ishora o'zgaruvchining qiymatini o'zgartiramiz va dastur o'z-o'zidan to'xtaydi.&#x20;

```python
print("Kiritilgan sonning kvadratini qaytaruvchi dastur.")
savol = "Istalgan son kiriting "
savol += "(dasturni to'xtatish uchun 'exit' deb yozing): "
ishora = True
while ishora:
    qiymat = input(savol)
    if qiymat == 'exit':
        ishora = False
    else:
        print(float(qiymat)**2)
```

## BREAK OPERATORI

`Break` operatori yordamida ma'lum bir shartni tekshirish va `while` tsikli bajarilishini to'xtatib qo'yish mumkin.&#x20;

```python
print("Kiritilgan sonning kvadratini qaytaruvchi dastur.")
savol = "Istalgan son kiriting "
savol += "(dasturni to'xtatish uchun 'exit' deb yozing): "

while True: # abadiy tsikl
    qiymat = input(savol)
    if qiymat == 'exit':
        break # tsiklni to'xtatish
    else:
        print(float(qiymat)**2)
```

`Break` operatori `for` tsiklini to'xtatish uchun ham ishlatiladi.

```python
sonlar = list(range(1,11))
for son in sonlar: 
    if son == 5: # son 5 ga teng bo'lsa kod to'xtaydi
        break
    print(f"{son} ning kvadrati {son**2} ga teng")
```

![Natija](/files/-MOEyqgUXvAlosTgqfpw)

`while` tsikli ichida bir nechta `break` operatori ham bo'lishi mumkin.

## CONTINUE OPERATORI

`Continue` operatori esa aksincha, ma'lum bir shart bajarilganda qadam tashlab o'tish uchun mo'ljallangan.

```python
sonlar = list(range(1,11))
for son in sonlar:
    if son == 5: # son 5 ga teng bo'lsa tiskl boshiga qaytadi
        continue
    print(f"{son} ning kvadrati {son**2} ga teng")
```

![Natija: 5 ning kvadrati qani?](/files/-MOEz3K3L9l1nE-VG4Pq)

```python
son = 0
while son<10:
    son += 1
    if son%2!=0:
        continue
    else:
        print(son)
```

`while` tsikli ichida bir nechta `continue` operatori ham bo'lishi mumkin.

## ABADIY TSIKL TUZOG'I

Tsikllar bilan ishlashda abadiy tsikl yaratib qo'yishdan ehtiyot bo'lishimiz kerak. Abadiy tsiklga turli mantiqiy xatolar sabab bo'lishi mumkin: noto'g'ri shart, o'zgarmas qiymat, kodlar ketma-ketligida xatolik va hokazo.&#x20;

Kelin ba'zi misollarni ko'ramiz:

```python
# infinite loop
son = 0
while son<10:
    if son%2!=0:
        continue
    else:
        print(son)
```

Yuqoridagi kod abadiy davom etadi, sababi biz `son` ning qiymatini o'zgartirishni esdan chiqardik.

```python
son = 0
while son<10:    
    if son%2!=0:
        continue
    else:
        print(son)
    son += 1
```

Bu kod ham abadiy davom etadi, lekin nima uchun?

```python
son = 1
while son>0: 
    son += 1
    if son%2!=0:
        continue
    else:
        print(son)
```

Yuqoridagi kodda esa xato shart tufayli (`son>0`) kod abadiy aylanadi.

Dastur bajarilishini to'xtatish uchun konsolda **Ctrl+C** tugmasini bosing

## AMALIYOT

1. Foydalanuvchidan yaxshi ko'rgan kitoblarini kiritishni so'rang. Foydalanuvchi `stop` so'zini yozishi bilan dasturni to'xtating
2. Muzeyga chipta narhi foydalanuvchining yoshiga bog'liq: 7 dan yoshlarga - 2000 so'm, 7-18 gacha 3000 so'm, 18-65 gacha 10000 so'm, 65 dan kattalarga bepul. Shunday while tsikl yozingki, dastur foydalanuvchi yoshini so'rasin va chipta narhini chiqarsin. Foydalanuvchi `exit` yoki `quit` deb yozganda dastur to'xtasin (ikkita shartni ham tekshiring).
   1. Yuqoridagi dasturni turli usullarda yozib ko'ring (break, ishora, yoki shart tekshirish)
3. Quyidagi dasturda bir nechta mantiqiy xatolar bor. Jumladan, xusisiy holatlarda tsikl abadiy qaytarilib qolmoqda. Xatolarni to'g'rilay olasizmi?

```python
savol ="Kiritilgan sonning ildizini qaytaruvchi dastur.\n"
savol += "Musbat son kiriting "
savol += "(dasturni to'xtatish uchun 'exit' deb yozing): "

while True:
    qiymat = input(savol)
    if qiymat<0:
        continue
    elif qiymat=='Exit':
        break
    else:
        ildiz = float(qiymat)**(0.5)
        print(f"{qiymat} ning ildizi {ildiz} ga teng")
```

## JAVOBLAR

### GitHub

### Repl.it

---''',
    vocabularyRaw: '''while	Shartli takrorlash tsikli boshlanishi	while x < 5:
break	Tsikldan zudlik bilan chiqish buyrug\'i	break
continue	Keyingi qadamga sakrash buyrug\'i	continue''',
    exercises: [
      Exercise(
        number: 1,
        question: '''1 dan 3 gacha sonlarni while tsikli yordamida chiqaruvchi kod yozing.''',
        answer: '''i = 1
while i <= 3:
    print(i)
    i += 1''',
      ),
      Exercise(
        number: 2,
        question: '''Tsiklni majburiy to\'xtatuvchi kalit so\'z qaysi?''',
        answer: '''break''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 18,
    title: '''While, Ro\'yxat va Lug\'atlar''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/while/18-while-lists.md).

Ro'yxatlar (lug'atlar) bilan ishlashda while tisklining foydalari juda ko'p. Misol uchun foydalanuvchidan bir nechta ma'lumotlarni qabul qilib olish, ro'yxatdan takrorlanuvchi qiymatlarni o'chirib tashlash yoki bir ro'yxatni ikkinchi ro'yxatga ko'chirishda while tsiklidan foydalanishimiz mumkin.

## `WHILE` YORDAMIDA RO'YXATNI TO'LDIRISH

Quyidagi dasturga e'tibor bering, avval ismlar degan bo'sh ro'yxat yaratib oldik. Keyin esa while tsikli yordamida foydalanuvchidan ro'yxatga ism qo'shishni so'raymiz. So'ngra foydalanuvchidan yana ism qo'shmoqchi yoki yo'q ekanin so'raymiz va foydalanuvchining javobiga ko'ra yoki while ni boshiga qaytamiz, yoki tsiklni to'xtatamiz.

```python
ismlar = []

print("Yaqin do'stlaringiz ro'yxatini tuzamiz.")
n=1 # ismlarni sanash uchun o'zgaruvchi
while True:
    savol = f"{n}-do'stingiz ismini kiriting:"
    ism = input(savol)
    ismlar.append(ism)
    javob = input("Yana ism qo'shasizmi? (ha/yo'q)")
    if javob =='ha':
        n+=1
        continue
    else:
        break
```

![Natija](/files/-MOPYjkoRnpAUY01Gcas)

```python
print("Do'stlaringiz ro'yxati:")
for ism in ismlar:
    print(ism.title())
```

![Natija](/files/-MOPZI7fGNQKPwHFinWO)

## `WHILE` YORDAMIDA LUG'ATNI TO'LDIRISH

Yuqoridagi usul bilan lu'gatlarni ham shakllantirishimiz mumkin. Quyidagi kodda `ism` bu kalit, `yosh` esa klaitga mos keluvchi qiymat. `while` tsiklining davomiyligi esa `ishora` ning qiymatiga bog'liq.

```python
print("Do'stlaringiz yoshini saqlaymiz.")
dostlar = {}
ishora = True
while ishora:
    ism = input("Do'stingiz ismini kiriting: ")
    yosh = input(f"{ism.title()}ning yoshini kiriting: ")
    dostlar[ism] = int(yosh) # ism kalit, yosh qiymat
    
    javob = input("Yana ma'lumot qo'shasizmi? (ha/yo'q)")
    if javob == "yo'q":
        ishora = False

for ism, yosh in dostlar.items():
    print(f"{ism.title()} {yosh} yoshda")
```

![Natija](/files/-MOR2S29ceRx5Cna4S0A)

## RO'YXAT ELEMENTLARINI O'CHIRISH

Avvalgi darslarimizning birida ro'yxat elementini o'chirish uchun `.remove(qiymat)` metodi bilan tanishgan edik. Esingizda bo'lsa, bu metod ro'yxatdan eng birinchi uchragan `qiymat`ni o'chiradi. Agar ro'yxatimizda ma'lum bir qiymat bir necha bor takrorlangan bo'lsa, ularning barchasini o'chirib tashlash uchun `while` tsiklidan foydalanishmiz mumkin.

```python
cars = ['lacetti','nexia','toyota','nexia','audi','malibu','nexia']
while 'nexia' in cars: # toki nexia cars ro'yxati ichida ekan...
    cars.remove('nexia') # nexia ni ro'yxatdan olib tashla
print(cars)
```

Natija: `['lacetti', 'toyota', 'audi', 'malibu']`

Yuqoridagi tsikl toki `cars` degan ro'yxatda `'nexia'` qiymati tugagunga qadar takrorlanaveradi.

## RO'YXATDAN RO'YXATGA ELEMENT KO'CHIRISH

Tasavvur qiling bizda ma'lum bir ro'yxat bor, biz ro'yxatdagi har bir element ustida biror amalni bajarib, uni birinchi ro'yxatdan ikkinchi ro'yxatga ko'chirib olmoqchimiz. Shunday holatlarda `while` tsikli juda qo'l keladi.&#x20;

Quyidagi misolni ko'raylik. Bizda `talabalar` ro'yxati bor. `while` tsikli toki ro'yxatda talabalar bor ekan aylanaveradi. Tsikl ichida biz `.pop()` metodi yordamida talabaning ismini ro'yxatdan sug'urib oldik va foydalanuvchidan talabani baholashni so'radik. Talabaning ismi va bahosini lug'at elementi ko'rinishida saqlab qo'ydik (`talaba` - kalit, `baho` - qiymat).

```python
talabalar = ['hasan', 'husan', 'olim', 'botir']
baholangan_talabalar = {}
while talabalar:
    talaba = talabalar.pop()
    baho = input(f"{talaba.title()}ning bahosini kiriting: ")
    print(f"{talaba.title()} baholandi")
    baholangan_talabalar[talaba] = baho
```

![Natija](/files/-MORKTU_xtqVWuUjW2xe)

Yuqorida biz while tsikli yordamida ro'yxat va lug'atlar ustida bajarish mumkin bo'lgan ba'zi misollarni ko'rdik. Albatta dasturlash davomida bundan boshqa holatlar ham uchrashi tabiiy.&#x20;

## AMALIYOT

1. Foydalanuvchidan buyurtma qabul qiluvchi dastur yozing. Mahsulotlar nomini birma-bir qabul qilib, yangi ro'yxatga joylang.
2. e-bozor uchun mahsulotlar va ularning narhlari lug'atini shakllantiruvchi dastur yozing. Foydalanuvchidan lug'atga bir nechta elementlar (mahsulot va uning narhi) kiritishni so'rang.
3. Yuqoridagi ikki dasturni jamlaymiz. Foydalanuvchi buyurtmasi ro'yxatidagi har bir mahsulotni e-bozordagi mahsulotlar bilan solishitiring (tayyor ro'yxat ishlatishingiz mumkin). Agar mahsuot e-bozorda mavjud bo'lsa mahuslot narhini chiqaring, aks holda "Bizda bu mahsulot yo'q" degan xabarni kor'sating.

## JAVOBLAR

### GitHub

### Repl.it&#x20;

---''',
    vocabularyRaw: '''pop()	Ro\'yxatdan elementni sug\'urib olish	list.pop()
flag	Tsikl holatini nazorat qiluvchi o\'zgaruvchi (True/False)	active = True''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Ro\'yxat bo\'sh bo\'lguncha while tsiklini yozish sharti qanday bo\'ladi?''',
        answer: '''while mevalar:''',
      ),
      Exercise(
        number: 2,
        question: '''while tsikli davomiyligini boshqaruvchi o\'zgaruvchi nima deyiladi?''',
        answer: '''flag''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 19,
    title: '''Funksiya (Functions)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/function/19-function.md).

## FUNKSIYA NIMA?

Funksiya ma'lum bir vazifani bajarishga mo'ljallangan kodlar yig'indisi. Biz shu paytgacha bir nechta tayyor funksiyalardan foydalanib keldik. Misol uchun [`print()`](https://python.sariq.dev/ilk-qadamlar/03-print#print) funksiyasi konsolga matn chiqarish uchun, [`range()`](https://python.sariq.dev/ozgaruvchilar-va-malumot-turlari/08-list-tuple#range-funktsiyasi) funksiyasi esa ma'lum oraliqdagi sonlarni yaratish uchun ishlatiladi. &#x20;

Aslida har qanday funksiyaning ortida ham bir necha qatordan iborat kod bo'ladi, lekin biz funksiyaga murojat qilganda uning nomini yozamiz xolos. Funksiya ortidagi kod esa biz uchun yashirin bo'lib qolaveradi. Funksiyalarning qulayligi ham shunda. Dastur davomida ma'lum bir kodlarni qayta-qayta yozmaslik uchun biz ularni jamlab, bitta funksiya ichiga joylashimiz va dastur davomida bu kodlarga funksiya nomi orqali murojat qilishimiz mumkin.&#x20;

Funksiyalar turlicha bo'ladi, ba'zi funksiyalar sizdan qiymat qabul qilib, konsolga biror ma'umot chiqaradi, ba'zilari esa sizdan qabul qilgan qiymat ustida turli amallar bajarib yangi qiymat qaytaradi. Foydalanuvchidan mutlaqo qiymat qabul qilmaydigan funksiyalar ham mavjud.&#x20;

Ushbu mavzuda siz qanday qilib Pythonda yangi funksiya yaratish, unga murojat qilish, tekshirish va to'g'rilashni o'rganasiz. Shuningdek darsimiz yakunida dasturimizni bir nechta faullarga ajratishni va funksiylarani alohida, module deb ataluvchi fayllarga joylashni ham o'rganamiz.

## FUNKSIYA YARATAMIZ

Keling oddiy, `salom_ber` deb nomlangan funksiya yaratamiz. Bu funksiya murojat qilganimizda konsolga "Assalom alaykum!" degan xabarni chiqarsin.

```python
def salom_ber():
    """Salom beruvchi funksiya"""
    print("Assalomu alaykum!")
```

Kodni qatroma-qator tahlil qilaylik:

1. Avvalo `def` operatori yordamida Pythonga funksiya yaratayotganimizni bildirdik. `def` dan so'ng esa funksiyamizga nom berdik va qavslarni ochib, yopdik. Bizning funksiyamiz foydalanuvchidan hech qanday qiymat qabul qilmaydi, shuning uchun ham qavs ichi bo'sh. Keyingi misollarda foydalanuvchidan qiymat qabul qiluvchi funksiyalarni ham ko'ramiz.
2. `def` qatoridan keyin o'ngga surib yozilgan har qanday kod funksiyaning badani hisoblanadi. 2-qatorda biz uchta ketma-ket qo'shtirnoq ichida funksiya haqida ma'lumot berdik. Python mana shu ma'lumotni o'qib, dasturchi funksiya haqida bilmoqchi bo'lganda aynan shu matnni ko'rsatadi.&#x20;
3. Oxirgi qatorimizda esa `"Assalomu alaykum!"` matnini konsolga chiqarishni buyurdik. Bizning sodda funksiyamizning asosiy vazifasi ham shu.

Mana funksiya tayyor. Endi bu funksiyadan foydalanish uchun uni *chaqiramiz*. Buning uchun funksiya nomini yozamiz va qavslarni ochib, yopamiz (esingizda bo'lsa bizning funksiyamiz qiymat qabul qilmaydi, shuning uchun qavslar ichi bo'sh).

```python
salom_ber()
```

Natija: `Assalomu alaykum!`

Funksiyaga nom berishda fe'l, ya'ni harakatni bildiruvchi so'zlar yoki jumlalardan foydalaning. Bu bilan siz o'zgaruvchi va funksiya o'rtasini farqlashingiz oson bo'ladi. Misol uchun, yuqorida biz funksiyamizni `salom` emas `salom_ber` deb nomladik.

### FUNKSIYAGA QIYMAT UZATISH

Avvalgi sodda funksiyamiz foydalanivchidan hech qanday qiymat olmaydi va barchaga birday `"Assalomu alaykum!"` deb javob qiladi. Keling funksiyaga o'zgartirish kiritamiz, funksiya foydalanuvchi ismini qabul qilib, unga ismi bilan murojat qilsin. Buning uchun funksiya nomidan keyin, qavs ichida foydalanuvchi berishi kerak bo'lgan qiymatni ko'rsatamiz.

```python
def salom_ber(ism):
    """Fodyalanuvchi ismini qabul qilib, unga salom beruvchi funksiya"""
    print(f"Assalomu alaykum, hurmatli {ism.title()}!")
```

Mana endi fuknsiyamiz foydalanuvchidan ism degan qiymatni ham kutadi.

```python
salom_ber('hasan')
```

Natija: Assalomu alaykum, hurmatli Hasan!

Agar funksiyaga murojat qilishda, unga qiymat bermasak xatolik vujudga keladi:

```python
salom_ber()
```

Natija: `TypeError: salom_ber() missing 1 required positional argument: 'ism'`

### DOCSTRING

Avval aytganimizdek, funksiya yaratganda, funksiya qanday ishlashi haqida qisqacha ma'lumot berib ketish o'zimiz uchun ham, kelajakda bizni funksiyamizni ishlatadigan boshqa dasturchilar uchun ham juda foydali bo'ladi. Quyidagi funksiyaning 2-qatorda biz funksiya haqida ma'lumot berdik. Bu qator **docstring** deyiladi. Murakkab funksiyalar uchun docstringni bir necha qatorga bo'lib yozishingiz mumkin

```python
def salom_ber(ism):
    """Fodyalanuvchi ismini qabul qilib, 
        unga salom beruvchi funksiya"""
    print(f"Assalomu alaykum, hurmatli {ism.title()}!")
```

Xo'sh, bu ma'lumot qachon va qayerda ko'rsatiladi? Dastur yozish jarayonida funksiya nomini yozishingiz bilan, docstring ko'rsatiladi:

![Docstring - funksiya haqida ma'lumot](/files/-MOeJsdlMhaALqFN97IQ)

Docstringni konsolga chiqarish uchun **`print(funksiya_nomi.__doc__)`** deb ham yozishimiz mumkin:

```python
print(salom_ber.__doc__)
```

![Docstring](/files/-MOePAVu5GKkM9s4Rq9B)

### FUNKSIYAGA BIR NECHA BOR MUROJAT QILISH

Funksiya yaratishning asl maqsadlaridan biri, biz unga qayta-qayta, yangi qiymatlar bilan murojat qilishimiz mumkin.&#x20;

```python
salom_ber('hasan')
salom_ber('olim')
```

Natija:

`Assalomu alaykum, hurmatli Hasan!`&#x20;

`Assalomu alaykum, hurmatli Olim!`

### ARGUMENT VA PARAMETER

Funksiya yaratishda, qavs ichida berilgan, funksiya to'g'ri ishlashi uchun uzatiladigan qiymat **parameter** deb ataladi. Yuqoridagi misolda `ism` bu `salom_ber` funksiyasining parametri.&#x20;

Foydalanuvchi funksiyaga murojat qilishda funksiyaga uzatgan qiymat esa **argument** deb ataladi. `salom_ber('hasan')` kodida `'hasan'` bu argument.&#x20;

Ba'zi manbalarda yoki darslarda argument va parametr so'zlari almashtirib ishlatilishi ham kuzatiladi.

## FUNKSIYAGA BIR NECHTA ARGUMENT UZATISH

Shunday funksiyalar bor, bir emas bir nechta parameter talab qilishi mumkin, foydalanuvchi esa o'z navbatida bir nechta argumentlar taqdim qilishi kerak. Funksiyaga argument uzatishning bir necha usuli bor, keling ular bilan birma bir tanishamiz.

### TO'G'RI TARTIBDA UZATISH

Bu usulda, funksiya parametrlari qaysi tartibda yozilgan bo'lsa, argumentlar ham aynan shu ketma-ketlikda uzatilishi kerak. Keling bitta misol ko'ramiz. Quyidagi funksiya foydalanuvchining ismi va familiyasini parametr sifatida qabul qilib, ularni jamlab xabar chiqaradi.

```python
def toliq_ism(ism, familiya):
    """Foydalanuvchi ism va familiyasini jamlab chiqaruvchi funksiya"""
    print(f"Foydalanuvchi ismi: {ism.title()}\n"
          f"Foydalanuvchi familiyasi: {familiya.title()}")
```

Yuqoridagi funksiya to'g'ri natija chiqarishi uchun argumentlarni ism va familiya ketma-ketligida kiritishimiz lozim.

```python
toliq_ism('olim','hakimov')
```

Natija:&#x20;

`Foydalanuvchi ismi: Olim`&#x20;

`Foydalanuvchi familiyasi: Hakimov`

Agar argumentlarni noto'g'ri ketma-ketlikda bersak, natija ham biz kutganday chiqmaydi:

```python
toliq_ism('hakimov','olim')
```

Natija:

`Foydalanuvchi ismi: Hakimov`&#x20;

`Foydalanuvchi familiyasi: Olim`

Ko'p xolatlarda esa, argumentlarni noto'g'ri tartibda uzatish xatolikka ham olib kelishi mumkin.

```python
def yosh_hisobla(ism, tugilgan_yil):
    """Foydalanuvchi yoshini hisoblaydigan dastur"""
    print(f"{ism.title()} {2020-tugilgan_yil} yoshda")
```

```python
yosh_hisobla('olim', 1997)
```

Natija: `Olim 23 yoshda`

```python
yosh_hisobla(1997, 'olim')
```

Natija: **`AttributeError: 'int' object has no attribute 'title'`**

### KALIT SO'Z BILAN UZATISH

Yuqoridagi kabi holatlarning oldini olish uchun argumentlarni parametr nomi bilan qo'shib uzatishimiz mumkin. Buning uchun funksiyaga o'zgartirish kiritish talab qilinmaydi.

```python
yosh_hisobla(tugilgan_yil=1997, ism='olim')
```

Natija: Olim 23 yoshda

Yuoqirdagi misolda funksiyani chaqirishda biz parametrlar ketma-ketligiga rioya qilmagan bo'lsakda, argumentlarni **`parametr_nomi=qiymat`** ko'rinishida yozganimiz sababli funksiya to'g'ri ishladi.&#x20;

Huddi shu kabi yuqoridagi toliq\_ism funksiyasiga murojat qilishimiz mumkin:

```python
toliq_ism(familiya='hakimov',ism='olim')
```

Natija:

`Foydalanuvchi ismi: Olim`

`Foydalanuvchi familiyasi: Hakimov`

Kalit so'z usulidan foydalanganda parametr nomi to'g'ri yozilganiga ahamiyat bering.

### STANDART QIYMAT

Funksiya yaratishda, istalgan parametr uchun standart qiymat ko'rsatib ketishimiz mumkin. Agar foydalanuvchi shu parametr uchun qiymat (argument) kiritmasa, funksiya bajarilishi jarayonida standart qiymat ishlatiladi. Standart qiymatni funksiya yaratish vaqtid&#x61;**`parametr = qiymat`** ko'rinishida beriladi.

```python
def yosh_hisobla(tugilgan_yil, joriy_yil=2020): # joriy yil uchun st.qiymat 2020
    """Foydalanuvchi tug'ilgan yilidan uning yoshini hisoblaydi"""
    print(f"Siz {joriy_yil-tugilgan_yil} yoshdasiz")
```

Yuqoridagi misolda biz `joriy_yil` parametriga `2020` standart qiymatini berib ketdik.&#x20;

Funksiya yaratishda, standart qiymatga ega parametrlar doim oxirida yozilishi kerak. Aks holda xatolik yuzaga keladi.

Keling avval funksiyani ikkala argument bilan chaqiramiz:

```python
yosh_hisobla(1995,2020)
```

Natija: `Siz 25 yoshdasiz`

Endi esa faqat bitta argument (`tugilgan_yil`) bilan chaqiramiz:

```python
yosh_hisobla(1993)
```

Natija: `Siz 27 yoshdasiz`

Bu safar foydalanuvchi `joriy_yil` ni kiritmagani sababli, standart qiymat, `2020` ishlatildi.&#x20;

## FUNKSIYAGA MUROJAT QILISHDA XATOLIKLAR

Funksiyalarga murojat qilishda turli xatoliklarga yo'l qo'shimiz tabiiy. Bunday holatlarda Python qaytargan xatoni sinchiklab o'qib, xato qayerdaligini topishimiz va uni to'g'rilashimiz zarur. Quyida men avvalroq yaratgan funksiyalarimizni xato usullar bilan chaqiraman. Xato nimada ekanini topa olasizmi?

```python
def yosh_hisobla(tugilgan_yil, joriy_yil=2020):
    """Foydalanuvchi tug'ilgan yilidan uning yoshini hisoblaydi"""
    print(f"Siz {joriy_yil-tugilgan_yil} yoshdasiz")
    
tyil = input("Tug'ilgan yilingizni kiriting: ")
yosh_hisobla(tyil)
```

Natija: **`TypeError: unsupported operand type(s) for -: 'int' and 'str'`**

```python
def yosh_hisobla(tugilgan_yil, joriy_yil):
    """Foydalanuvchi tug'ilgan yilidan uning yoshini hisoblaydi"""
    print(f"Siz {joriy_yil-tugilgan_yil} yoshdasiz")

yosh_hisobla(1993)
```

Natija: **`TypeError: yosh_hisobla() missing 1 required positional argument: 'joriy_yil'`**

```python
def salom_ber():
    """Salom beruvchi funksiya"""
    print("Assalomu alaykum!")

salom_ber('hasan')
```

Natija: **`TypeError: salom_ber() takes 0 positional arguments but 1 was given`**

```python
def toliq_ism(ism, familiya):
    """Foydalanuvchi ism va familiyasini jamlab chiqaruvchi funksiya"""
    print(f"Foydalanuvchi ismi: {ism.title()}\n"
          f"Foydalanuvchi familiyasi: {familiya.title()}")
 
 toliq_ism('olim hakimov')
```

Natija: `TypeError: toliq_ism() missing 1 required positional argument: 'familiya'`

## AMALIYOT

1. Foydalanuvchi ismi va yoshini so'rab, uning tug'ilgan yilini hisoblaydigan funksiya yozing.
2. Foydalanuvchidan son olib, uning kvadrati va kubini konsolga chiqaruvchi funksiya yozing.
3. Foydalanuvchidan son olib, son juft yoki toqligini konsolga chiqaruvchi funksiya yozing.
4. Foydalanuvchidan ikkita son olib, ulardan kattasini konsolga chiqaruvchi funksiya yozing. Agar sonlar teng bo'lsa "Sonlar teng" degan xabarni chiqaring.
5. Foydalanuvchidan x va y sonlarini olib, \$\$x^y\$\$ni konsolga chiqaruvchi funksiya yozing.
6. Yuqoridagi funksiyada `y` uchun `2` standart qiymatini bering.
7. Foydalanuvchidan son qabul qilib, sonni 2 dan 10 gacha bo'lgan sonlarga qoldiqsiz bo'linishini tekshiruvchi funksiya yozing. Natijalarni konsolga chiqaring.

![Kutilgan natijaga misol](/files/-MOg9NV1_WMTAmULqk3T)

## JAVOBLAR

### GitHub

### Repl.it

---''',
    vocabularyRaw: '''def	Funksiya yaratish kalit so\'zi	def salom():
parameter	Funksiya e\'lon qilinganda qabul qiladigan qiymat nomi	def f(x):
argument	Funksiya chaqirilganda yuboriladigan haqiqiy qiymat	f(5)''',
    exercises: [
      Exercise(
        number: 1,
        question: '''\'salom\' nomli, hech narsa qabul qilmaydigan va \'Salom\' chiqaradigan funksiya yozing.''',
        answer: '''def salom():
    print(\'Salom\')''',
      ),
      Exercise(
        number: 2,
        question: '''Funksiya yaratuvchi kalit so\'z nomi?''',
        answer: '''def''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 20,
    title: '''Qiymat Qaytaruvchi Funksiya (Return)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/function/20-qiymat-qaytarish.md).

Avvalgi darsimizda yaratgan barcha funksiyalarimiz konsolga ma'lumot chiqarayotgan edi. Aslida, aksar holatlarda bu g'ayritabiiy. Sababi, dasturchi sifatida biz konsolga chiqqan ma'lumotdan unumli foydalana olmaymiz. Konsoldagi qiymatni o'zgaruvchiga yuklab, undan kelajakda foydalanib ham bo'lmaydi. Mana shunday holatlarda, funksiyadan unumli foydalanish uchun undan biror qiymatni qaytarish maqsadga muvofiq bo'ladi.

## FUNKSIYADAN ODDIY QIYMAT QAYTARISH

Keling `ism` va `familiya` degan parametrlarni olib, `toliq_ism` qaytaradigan sodda funksiya yasaymiz.

```python
def toliq_ism_yasa(ism, familiya):
    """Toliq isma qaytaruvchi funksiya"""
    toliq_ism = f"{ism} {familiya}"
    return toliq_ism # qiymat qaytarish uchun return operatorini ishlatamiz
```

Yuqoridagi funksiyamizga ahamiyat bersangiz, uning badanida endi `print()` funksiyasi yo'q. Buning o'rniga, funksiyamiz `return` operatori yordamida `toliq_ism` degan o'zgaruvchining **qiymatini** qaytaradi.

Endi funksiyadan to'g'ri foydalanish uchun u qaytargan qiymatni biror o'zgaruvchiga yuklashimiz kerak:

```python
talaba1 = toliq_ism_yasa('olim','hakimov')
talaba2 = toliq_ism_yasa('hakim','olimov')
```

Yuqoridagi kodlarni bajarganimizda konsolga hech narsa chiqmaydi. talaba1 va talaba2 o'zgaruvchilarining qiymatini ko'rish uchun esa print() funksiyasidan foydalanamiz.

```python
print(f"Darsga kelmagan talabalar: {talaba1} va {talaba2}")
```

Natija: `Darsga kelmagan talabalar: Olim Hakimov va Hakim Olimov`

Demak, qiymat qaytaradigan funksiyaning afzalligi shundaki, biz bu qiymatlardan keyin ham bemalol foydalanishimiz mumkin.

Funksiya ichidagi o'zgaruvchilar **mahalliy** yoki **ichki o'zgaruvchilar** deyiladi (**local variables**). Ichki o'zgaruvchilar faqatgina funksiya ichida mavjud bo'ladi, ularga tashqaridan murojat qilib bo'lmaydi. Shuning uchun ham funksiya o'zgaruvchi emas **qiymat qaytaradi**.

## IXTIYORIY ARGUMENTLAR

Avvalgi darsizmida funksiyalarga standart parametr berishni ko'rgan edik. Huddi shu usul bilan, ba'zi argumentlarni ixtiyoriy qilishimiz mumkin. Ya'ni funksiya ishlashi uchun bu agrumentarni kiritish majburiy emas, ixtiyoriy bo'ladi.

Keling avvalgi funksiyamizni o'zgartiramiz va unga yana bitta otasiningismi degan paramter qo'shamiz, lekin bu parametr ixtiyoriy bo'ladi. Buning uchun funksiya yaratishda `otasining_ismi=''` deb yozib ketamiz.&#x20;

```python
def toliq_ism_yasa(ism, familiya, otasining_ismi=''):
    """Toliq isma qaytaruvchi funksiya"""
    if otasining_ismi: # otasining_ismi mavjudligini tekshiramiz
        toliq_ism = f"{ism} {otasining_ismi} {familiya}"
    else:
        toliq_ism = f"{ism} {familiya}"
    return toliq_ism.title()
```

Yuqoridagi funksiyani tahlil qiladigan bo'lsak, 3-qatorda biz otasiningismi parametri bo'sh yoki yo'qligini tekshiramiz. Pythonda `if` dan so'ng bo'sh bo'lmagan matn (string) yozsak, bu shart `True` qaytaradi. Demak, bu ixtiyoriy parametr kiritilgani yoki yo'qligiga qarab, funksiyamiz turlicha qiymat qaytaradi.

```python
talaba1 = toliq_ism_yasa('olim','hakimov') #otasining_ismi kiritilmadi
talaba2 = toliq_ism_yasa('hakim','olimov','abrorovich')
print(f"Darsga kelmagan talabalar: {talaba1} va {talaba2}")
```

Natija: `Darsga kelmagan talabalar: Olim Hakimov va Hakim Abrorovich Olimov`

## FUNKSIYADAN LUG'AT QAYTARAMIZ

Funksiyadan sodda qiymat emas, ro'yxat, lu'gat va boshqa ma'lumot turlarini ham qaytarishimiz mumkin.  Quyidagi funksiya ham mashina haqidagi ma'lumotlarni jamlab, ularni lug'at ko'rinishida qaytaradi:

```python
def avto_info(kompaniya, model, rangi, korobka, yili, narhi=None):
    avto = {'kompaniya':kompaniya,
            'model':model,
            'rang':rangi,
            'korobka':korobka,
            'yil':yili,
            'narh':narhi}
    return avto
```

E'tibor bering, `narhi` nomli parametrga `None` standart qiymatini berib ketdik. `None` Pythonda *mavjud emas* ma'nosini beradi, va `if` yordamida tekshirganda `False` mantiqiy qiymatini qaytardi.&#x20;

Quyidagi kodni tahlil qilishni sizga vazifa sifatida qoldiramiz:

```python
avto1 = avto_info('GM','Malibu','Qora','Avtomat',2018)
avto2 = avto_info('GM','Gentra','Oq','Mexanika',2016,15000)
avtolar = [avto1, avto2]
print('Onlayn bozordagi mavjud avtomashinalar:')
for avto in avtolar:
    if avto['narh']:
        narh = avto['narh']
    else:
        narh = "Noma'lum"
    print(f"{avto['rang']} {avto['model']}. Narhi: {narh}")
```

![Natija](/files/-MOjwsyc1e2r56i_F8Gj)

## FUNKSIYADAN RO'YXAT QAYTARAMIZ

Biz avvalroq `range()` funksiyasi bilan tanishgan edik. Bu funksiya 2 ta son qabul qilib, shu ikki son orali'g'idagi sonlarni qaytaradi. Keling biz `oraliq()` degan yangi funksiya yaratamiz. `range()` dan farqli ravishda, funksiyamiz 2 son oralig'idagi sonlarni **ro'yxat** ko'rinishida qaytarsin.

```python
def oraliq(min,max):
    sonlar = [] # bo'sh ro'yxat
    while min<max:
        sonlar.append(min)
        min += 1
    return sonlar
```

Funksiyani tekshiramiz:

```python
print(oraliq(0,10))
print(oraliq(10,21))
```

![Natija](/files/-MOnkLJ7o3J38myB3bCi)

Yuqoridagi funksiyaga uchinchi, `qadam` deb nomlangan ixtiyoriy parameterni qo'sha olasizmi?

```python
print(oraliq(0,21,2)) # 0 dan 21 gacha 2 qadam bilan
```

Natija: `[0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20]`

## FUNKSIYALARNI TSIKLDA ISHLATISH

Funksiyalarni takrorlash uchun tsikldan foydalanishimiz mumkin. Quyidagi misolda biz `while` yordamida avvalroq yaratgan `avto_info` funksiyamizni bir necha bor chaqiramiz va salondagi avtolar ro'yxatini shakllantiramiz. Bunda, ro'yxatning har bir elementi `avto_info` funksiyasidan qaytgan lug'at bo'ladi.

```python
print("Saytimizdagi avtolar ro'yxatini shakllantiramiz.")
avtolar=[] # salondagi avtolar uchun bo'sh ro'yxat
while True:
    print("\nQuyidagi ma'lumotlarni kiriting",end='')
    kompaniya=input("Ishlab chiqaruvchi: ")
    model=input("Modeli: ")
    rangi=input("Rangi: ")
    korobka=input("Korobka: ")
    yili=input("Ishlab chiqarilgan yili: ")
    narhi=input("Narhi: ")
    
    #Foydalanuvchi kiritdan ma'lumotlardan avto_info yordamida 
    #lug'at shakllantirib, har bir lug'atni ro'yxatga qo'shamiz:
    avtolar.append(avto_info(kompaniya, model, rangi, korobka, yili, narhi))
    
    # Yana avto qo'shish-qo'shmaslikni so'raymiz
    javob = input("Yana avto qo'shasizmi? (yes/no): ")
    if javob=='no':
        break
```

Yuqoridagi funksiyani Pythonda bajarib kor'ing. Ro'yxatga bir necha qiymatlar qo'shing. Natijalarni konsolga chiroyli qilib chiqaring:

![Kutilgan natija](/files/-MOoe4xJU0EpNNTpn5Dq)

## AMALIYOT

1. Foydanaluvchidan ismi, familiyasi, tug'ilgan yili, tug'ilgan joyi, email manzili va telefon raqamini qabul qilib, lug'at ko'rinishida qaytaruvchi funksiya yozing. Lug'atda foydalanuvchu yoshi ham bo'lsin. Ba'zi argumentlarni kiritishni ixtiyoriy qiling (masalan, tel.raqam, el.manzil)
2. Yuqoridagi funksiyani `while` yordamida bir necha bor chaqiring, va mijozlar degan ro'yxatni shakllantiring. Ro'yxatdagi mijozlar haqidagi ma'lumotni konsolga chiqaring.
3. Uchta son qabul qilib, ulardan eng kattasini qaytaruvchi funksiya yozing
4. Foydalanuvchidan aylaning radiusini qabul qilib olib, uning radiusini, diametrini, perimetri va yuzini lug'at ko'rinishida qaytaruvchi funksiya yozing
5. Berilgan oraliqdagi [tub sonlar ](https://uz.wikipedia.org/wiki/Tub_sonlar_ro%CA%BByxati)ro'yxatini qaytaruvchi funksiya yozing (tub sonlar —faqat birga va o'ziga qoldiqsiz bo'linuvchi, 1 dan katta musbat sonlar)
6. Foydalanuvchidan son qabul qilib, shu son miqdoricha [Fibonachchi ketma-ketligidagi ](https://medium.com/@qudratxoja.musayev/fibonachchi-sonlari-va-u-haqida-qiziqarli-faktlar-47000a80264d)sonlar ro'yxatni qaytaruvchi funksiya yozing.  ***Ta’rif***: *Har bir hadi o’zidan oldingi ikkita hadning yig’indisiga teng bo’lgan ketma-ketlik Fibonachchi ketma-ketligi deyiladi. Bunda boshlang’ish had ko’pincha 1 deb olinadi.*  `1, 1, 2, 3, 5, 8, 13, 21, 34, 55,...`

## JAVOBLAR

---''',
    vocabularyRaw: '''return	Funksiyadan natija qaytarish kalit so\'zi	return x + y
default parameter	Parametrga berilgan boshlang\'ich qiymat	def f(x=5):''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Ikkita sonni qo\'shib, natijani qaytaruvchi (return) funksiya yozing.''',
        answer: '''def qosh(a, b):
    return a + b''',
      ),
      Exercise(
        number: 2,
        question: '''Funksiya natijasini qaytarish uchun qaysi kalit so\'z ishlatiladi?''',
        answer: '''return''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 21,
    title: '''Funksiyaga Ro\'yxat Uzatish''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/function/21-funksiya-va-royxat.md).

## FUNKSIYAGA RO'YXAT UZATISH

Biz avvalgi darslarimizda funksiyaga parametr sifatida yagona qiymat berayotgan edik. Aslida, bu bilan cheklanmasdan, funksiyaga ro'yxat (list) ham berishimiz mumkin. Bunda, funksiya ro'yxat qiymatlariga to'g'ridan-to'g'ri murojat qila oladi.

Keling talabalarni baholaydigan funksiya yozamiz. Funksiyamiz talabalar ro'yxatini qabul qilib oladi, ro'yxatdan har bir talabani sug'urib olib (`.pop()`), bahosini kiritishni so'raydi. Talaba ismi va bahosini lug'atga joylab, yakuniy lug'atni foydalanuvchiga qaytaradi.

```python
def bahola(ismlar):
    baholar = {}
    while ismlar:
        ism = ismlar.pop()
        baho = input(f"Talaba {ism.title()}ning bahosini kiriting: ")
        baholar[ism]=baho
    return baholar

talabalar = ['ali', 'vali', 'hasan', 'husan']
baholar = bahola(talabalar)
print(baholar)
```

&#x20;

![Natija](/files/-MP8VUSLldLwJVsvoVHI)

## RO'YXATGA O'ZGARTIRISH KIRITISH

Funksiyaga ro'yxat uzatganimizda, funksiya ro'yxat elementlariga to'g'ridan-to'g'ri murojat qila oladi. Ro'yxatga funksiya ichida kiritilgan o'zgartirishlar asl ro'yxatga ham ta'sir qiladi. Avvalgi misolimizga qaytaylik:

```python
talabalar = ['ali', 'vali', 'hasan', 'husan']
baholar = bahola(talabalar)
print(talabalar)
```

Natija: `[]`

Yuqoridagi funksiya unga uzatilgan ro'yxat ichidagi talabalarning ismini `.pop()` yordamida sug'urib olgani uchun bizning asl ro'yxatimiz ham bo'shab qoldi. E'tibor bering, funksiya tashqarisidagi va ichidagi ro'yxatlar ikki hil nomlangan bo'lsada (`talabalar` va `ismlar`), ikkalasi ham xotiradagi bitta ro'yxatga bog'langani sabab ulardan biriga o'zgartirish kiritilishi bilan, ikkinchisi ham o'zgaradi.&#x20;

![Ikki o'zgaruvchi ham bitta ro'yxatga bog'langan](/files/-MP8WrcRbEHkTZzbTVxR)

## ASL RO'YXATGA O'ZGARTIRISH KIRITISHNING OLDINI OLISH&#x20;

Agar funksiya asl ro'yxatga o'zgartirish kiritishini istamasangiz, funksiyaga ro'yxatning o'zini emas, uning nusxasini uzatish mumkin. Buning uchun funksiya parametrini `royxat_nomi[:]` ko'rinishida yozish kifoya. Bunda `[:]` operatori ro'yxatdan nusxa olishni bildiradi:

```python
talabalar = ['ali', 'vali', 'hasan', 'husan']
baholar = bahola(talabalar[:])
print(talabalar)
```

Natija: `['ali', 'vali', 'hasan', 'husan']`

## AMALIYOT

* Matnlardan iborat ro'yxat qabul qilib, ro'yxatdagi har bir matnning birinchi harfini katta harfga o'zgatiruvchi funksiya yozing.&#x20;

```python
ismlar = ['ali', 'vali', 'hasan', 'husan']
katta_harf(ismlar)
print(ismlar)
```

Kutilgan natija: `['Ali', 'Vali', 'Hasan', 'Husan']`

* Yuoqirdagi funksiyani asl ro'yxatni o'zgartirmaydigan va yangi ro'yxat qaytaradigan qilib o'zgartiring

```python
ismlar = ['ali', 'vali', 'hasan', 'husan']
yangi_ismlar = katta_harf(ismlar)
print(ismlar)
print(yangi_ismlar)
```

Kutilgan natija:&#x20;

`['ali', 'vali', 'hasan', 'husan']`&#x20;

`['Ali', 'Vali', 'Hasan', 'Husan']`

* Darsimiz davomida yozgan bahola funksiyasini `.pop()` metodidan foydalanmasdan va asl ro'yxatga o'zgartirish kiritmasdan faqat lug'at qaytaradigan qilib yozing.

## JAVOBLAR

### GitHub

### Repl.it

---''',
    vocabularyRaw: '''.copy()	Ro\'yxatning nusxasini olish metodi	list.copy()
mutability	Ma\'lumotning o\'zgaruvchanligi (masalan, List mutable)	mutable''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Ro\'yxat nusxasini yaratish uchun qaysi metod ishlatiladi?''',
        answer: '''copy()''',
      ),
      Exercise(
        number: 2,
        question: '''Funksiyaga mevalar ro\'yxatini uzatib, har bir elementini chiqaruvchi def yozing.''',
        answer: '''def chop_et(list):
    for x in list:
        print(x)''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 22,
    title: '''Moslashuvchan Funksiya (*args va **kwargs)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/function/22-flexible-functions.md).

## MOSLASHUVCHAN FUNKSIYA

Agar funksiyangiz bir nechta argument qabul qilishi kerak bo'lsa-yu, lekin siz argumentlar sonini aniq bilmasangiz, Pythonda istalgancha qiymat qabul qiluvchi funksiya yaratish imkoniyati bor.&#x20;

## `*args` USULI

Agar funksiya qabul qiladigan parametrlar soni noaniq bo'lsa, va parametrlar yagona qiymatlar ko'rinishida uzatilsa, funksiya yaratishda argumentdan avval yulduzcha qo'yiladi (`*arguments`).&#x20;

Quyidagi misolni ko'raylik. `summa()` nomli funksiyamiz istalgancha sonlarni qabul qilib oladi, va ularning yi'gindisi hisoblaydi:

```python
def summa(*sonlar):
    """Kiritilgan sonlar yig'indisini hisoblaydigan funksiya"""
    yigindi = 0
    for son in sonlar:
        yigindi += son
    return yigindi
```

Bu funksiyani istalgancha parametr bilan chaqirish mumkin:

```python
print(summa(1,2))
```

Natija: `3`

```python
print(summa(1,2,3,4,5))
```

Natija: `15`

`*args` usulida, bacha uzatilgan parametrlar (bir dona bo'lsa ham) funksiya ichida [o'zgarmas ro'yxatga (tuple)](https://python.sariq.dev/ozgaruvchilar-va-malumot-turlari/08-list-tuple#tuples-ozgarmas-royxat) joylanadi. Bundan kelib chiqib, yuqoridagi funksiyamizni yanada soddalashtirib yozishimiz mumkin:

```python
def summa(*sonlar):
    """Kiritilgan sonlar yig'indisini hisoblaydigan funksiya"""
    return sum(sonlar)

print(summa(4,5,6,7))
```

Natija: `22`

Agar funksiya bir nechta argument qabul qilsa, `*args` argument doim oxirida yoziladi:

```python
def summa(x,y,*sonlar):
    """Kiritilgan sonlar yig'indisini hisoblaydigan funksiya"""
    return x+y+sum(sonlar)
```

Yuqoridagi funksiyamiz kamida 2 ta parametr qabul qiladi (`x` va `y`) va birinchi ikki argumentlar majburiy argumentlardir.

```python
print(summa(2))
```

Netija: `TypeError: summa() missing 1 required positional argument: 'y'`

## `**kwargs` USULI

Agar funksiyaga kalit so'z - qiymat ko'rinishidagi argumentlarni uzatish talab qilinsa, va bunday parametrlar soni noma'lum bo'lsa, argument oldidan ikkita yulduzcha qo'yiladi (`**kwargs`).

\*\*kwargs — keyword arguments (kalit so'zli argumentlar)

```python
def avto_info(kompaniya,model,**malumotlar):
    """Avto haqidagi ma'lumotlarni lug'at ko'rinishdia qaytaruvchi funksiya"""
    malumotlar['kompaniya']=kompaniya
    malumotlar['model']=model
    return malumotlar
```

Yuqoridagi funksiyamiz kompaniya va model degan ikki qiymatni qabul qiladi, undan keyin esa funksiyaga istalgancha parametr uzatish mumkin.  Bunday funksiyaga parametrlar `kalitso'z=qiymat` ko'rinishida uzatiladi.

Funksiya ichida avval foydalanuvchi kiritgan **qo'shimcha** qiymatlardan iborat `malumotlar` deb nomlangan lug'at shakllantiriladi. Undan keyin esa majburiy parametrlarni lug'atga qo'shamiz.&#x20;

```python
avto1 = avto_info("GM", "malibu", rang='qora', yil=2018)
avto2 = avto_info("Kia", "K5", rang='qizil', narh=35000)
```

```python
print(avto2)
```

Natija: `{'rang': 'qizil', 'narh': 35000, 'kompaniya': 'Kia', 'model': 'K5'}`

## **AMALIYOT**

1. Istalgancha sonlarni qabul qilib, ularning ko'paytmasini qaytaruvchi funksiya yozing
2. Talabalar haqidagi ma'lumotlarini lug'at ko'rinishida qaytaruvchi funkisya yozing. Talabaning ismi va familiyasi majburiy argument, qolgan ma'lumotlar esa ixtiyoriy ko'rinishda istalgancha berilishi mumkin bo'lsin.

## JAVOBLAR

### GitHub

### Repl.it

---''',
    vocabularyRaw: '''*args	Noma\'lum miqdordagi oddiy argumentlar	def f(*args):
**kwargs	Noma\'lum miqdordagi kalitli argumentlar	def f(**kwargs):
kwargs	keyword arguments (kalitli argumentlar) qisqartmasi	dict-like''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Barcha yuborilgan sonlar ko\'paytmasini hisoblaydigan *args funksiyani yozing.''',
        answer: '''def kopaytir(*sonlar):
    s = 1
    for n in sonlar:
        s *= n
    return s''',
      ),
      Exercise(
        number: 2,
        question: '''**kwargs funksiya ichida qaysi ma\'lumot turi ko\'rinishida bo\'ladi?''',
        answer: '''dictionary''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 23,
    title: '''Modullar (Modules)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/function/23-modules.md).

## MODUL NIMA?

Funksiyaning qulayliklaridan biri, ko'p takrorlanadigan kodlarni funksiya ichida yashirishimiz va kerak bo'lgan murojat qilishimiz mumkinligida. Maqsadimiz dasturimizni ixcham va tushunarli qilib, kelajakda o'zimiz yoki boshqalar uchun ham "toza" kod qoldrisih. Bu yo'nalishda yana bir qadam qo'yib, dasturimizni modullarga ajratimshimiz mumkin.&#x20;

Modul bu loyihamiz ichidagi alohida fayl bo'lib, dasturimiz davomida ishlatiladigan funskyalarni (va o'zgaruvchilarni) mana shu faylga joylab, ko'zdan yashirib qo'yishimiz mumkin. Bu bizga asosiy dasturimizdan chalg'imasdan kod yozish imkoniyatini beradi.&#x20;

Modul va uning ichidagi funksiyalarni istalgan payt asosiy dasturimizga yuklab olishimiz, modullarni boshqa dasturchilar bilan ulashishimiz yoki kelajakda o'zimizning boshqa loyihalarimizda foydalanishimiz mumkin.

Umuman olganda katta dasturlar bir nech o'nlab modullardan iborat bo'lishi tabiiy hol.

## MODUL YARATAMIZ

Modul yaratish uchun asosiy dasturimizdagi funksiyalarni yangi faylga ko'chiramiz xolos. Modulga oson murojat qilishimiz uchun, faylimiz asosiy dasturimiz bilan bitta papkada bo'lgani afzal. Bunda adashib ketmaslik uchun, loyihangizning (dasturning) asosiy faylini `main.py` deb nomlash o'rinli.&#x20;

Keling, biz ham `avto_info_mod.py` degan fayl yaratamiz va ichiga quyidagi 3 ta funksiyalarni joylaymiz:

```python
def avto_info(kompaniya, model, rangi, korobka, yili, narhi=None):
    """Avtomobil haqidagi ma'lumotlarni lug'at ko'rinishida qaytaruvchi funksiya"""
    avto = {'kompaniya':kompaniya,
            'model':model,
            'rang':rangi,
            'korobka':korobka,
            'yil':yili,
            'narh':narhi}
    return avto

def avto_kirit():
    """Foydalanuvchiga avto_info funksiyasi yordamida bir nechta avtolar haqida ma'lumotlarni bitta ro'yxatga joylash imkonini beruvchi funksiya"""
    avtolar=[] # salondagi avtolar uchun bo'sh ro'yxat
    while True:
        print("\nQuyidagi ma'lumotlarni kiriting",end='')
        kompaniya=input("Ishlab chiqaruvchi: ")
        model=input("Modeli: ")
        rangi=input("Rangi: ")
        korobka=input("Korobka: ")
        yili=input("Ishlab chiqarilgan yili: ")
        narhi=input("Narhi: ")    
        #Foydalanuvchi kiritdan ma'lumotlardan avto_info yordamida 
        #lug'at shakllantirib, har bir lug'atni ro'yxatga qo'shamiz:
        avtolar.append(avto_info(kompaniya, model, rangi, korobka, yili, narhi))    
        # Yana avto qo'shish-qo'shmaslikni so'raymiz
        javob = input("Yana avto qo'shasizmi? (yes/no): ")
        if javob=='no':
            break
    return avtolar

def info_print(avto_info):
    """Avtomobillar haqida ma'lumotlar saqlangan lug'atni konsolga chiqaruvchi funksiya"""
    print(f"{avto_info['rang'].title()} {avto_info['kompaniya'].upper()} "
          f"{avto_info['model'].upper()}, {avto_info['korobka']} korobka, "
          f"{avto_info['yil']}-yil, {avto_info['narh']}\$")
```

Yuqoridagi funksiyalarga asosiy dasturdan murojat qlishning bir necha usuli bor.

## MODULNI CHAQIRIB OLISH

Modul ichidagi istalgan funksiyaga murojat qilish uchun `import modul_nomi` komandasidan foydalanamiz. Bunda modul ichidagi istalgan funksiyaga `modul_nomi.funksiya_nomi()` ko'rinishida murojat qilishimiz mumkin. Ya'ni avval modul nomi undan keyin esa nuqta qo'yilib, modul ichidagi funksiya nomi yoziladi.

Keling, yuqoridagi modulimizdagi `avto_info()` va `info_print()` funksiyalariga murojat qilamiz:

```python
import avto_info_mod # avto_info_mod faylini (modulini) chaqiramiz

avto1 = avto_info_mod.avto_info("GM", "Malibu", "Qora", "avtomat", 2020,40000)
avto_info_mod.info_print(avto1)
```

Natija: `Qora GM MALIBU, avtomat korobka, 2020-yil, 40000\$`

Ko'rib turganingizdek, dasturimiz qisqa, tushunarli va muhimi toza bo'ldi. 3 qator kod ortida 20 qatordan ortiq kodni yashirdik.

**`import`**` ``modul_nomi` komandasi bir martta, dastur boshida yoziladi.

### MODULGA QISQA NOM BERISH

Yuqoridagi usul bilan modulni chaqirib olishda fayl nomi uzun bo'lsa bu o'ziga yarasha noqulayliklar tug'dirishi mumkin. Buning oldini olish uchun esa, modulni chaqirganda unga `as` operatori yordamida qisqa nom berishimiz, va modulga qisqa nom orqali murojat qilish mumkin. Quyidagi misolda `avto_info_mod` ni qisqa qilib `aim` deb nomlab oldik, va 3-4-qatorlarda modulga murojat qilishda qisqa nomidan foydalandik.

```python
import avto_info_mod as aim # avto_info_mod ni qisqa nom aim bilan chaqiramiz

avto1 = aim.avto_info("GM", "Malibu", "Qora", "avtomat", 2020,40000)
aim.info_print(avto1)
```

Modulga qisqa nom berganingizda bunday nomli boshqa o'zgaruvchi yoki funksiya yo'qligiga amin boling. Shunigdek, dastur davomida bu nomni boshqa o'zgaruvchilarga yoki funksiylarga berib yubormang.&#x20;

## MODUL ICIHDAN MA'LUM FUNKSIYALARNI KO'CHIRIB OLISH

Agar katta modullardan faqatgina ba'zi funksiyalarga murojat qilish talab qilinisa, kerakli funksiyalarni **`from`**` ``modul_nomi`` `**`import`**` ``funksiya1, funksiya2` komandasi yordamida o'zimizning dasturimizga ko'chirib olishimiz mumkin. Bu usulning qulayligi, endi funksiyalarga to'g'ridan-to'g'ri murojat qilish mumkin (modul ismini yozmagan holda).

Misol uchun avvalgi kodimizda biz faqatgina `avto_info` va `info_print` funksiyalaridan foydalandik. Shu funksiyalarni asosiy kodimizga ko'chirib olaylik:

```python
from avto_info_mod import avto_info, info_print

avto1 = avto_info("GM", "Malibu", "Qora", "avtomat", 2020,40000)
info_print(avto1)
```

### FUNKSIYALARGA QISQA NOM BERISH

Huddi avvalgidek, ko'chrib olgan funksiyamizga ham qisqa nom berishimiz mumkin.&#x20;

```python
from avto_info_mod import avto_info as ainfo, info_print as iprint

avto1 = ainfo("GM", "Malibu", "Qora", "avtomat", 2020,40000)
iprint(avto1)
```

## MODUL ICHIDAGI BARCHA FUNKSIYALARNI KO'CHIRIB OLISH

Modul ichidagi barcha funksiyalarni asosiy dasturga ko'chirib olish uchun `from modul_nomi import *` komandasidan foydalanamiz. &#x20;

```python
from avto_info_mod import *

avto1 = avto_info("GM", "Malibu", "Qora", "avtomat", 2020,40000)
info_print(avto1)
```

Diqqat! Bir necha sabablarga ko'ra bu usuldan foydalanish tavsiya qilinmaydi. Katta modullarda yuzlab funksiyalar bo'lishi mumkin, va funksiya nomi sizning dasturingizdagi boshqa funksiya yoki o'zgaruvchi bilan bir hil nomga ega bo'lsa, dastur xato ishlashiga olib keladi.

## MODULDA O'ZGARUVCHI SAQLASH

Modullarning ichida nafaqat funksiyalar, balki turli o'zgaruvchilarni ham saqlash mumkin. Modul ichidagi o'zgaruvchilarga ham huddi yuqoridagi usullar bilan murojat qilish mumkin.

## PYTHON MODULLARI

Python dasturlash tili tayyor modullar bilan keladi, modullarning to'liq ro'yxatini quyidagi bo'glama orqali kirib ko'rishingiz mumkin:

Keling ulardan ba'zilari bilan tanishamiz.

### `math` MODULI

Bu modulda matematik hisob kitoblarni bajaruvchi funksiyalar va o'zgaruvchilar joylashgan. Keling ularga ba'zi misollarni ko'ramiz.

#### `sqrt()` - qavs ichida berilgan qiymatning kvadrat ildizini qaytaradi

```python
import math

x=400
print(math.sqrt(x))
```

Natija: `20.0`

#### `pow(x,y)` - x ning y-darajasini qaytaradi

```python
print(pow(5,5))
```

Natija: `3125`

#### pi - \$\$\pi\$\$ ning qiymatini saqlovchi o'zgaruvchi

```python
from math import pi
print(pi)
```

Natija: `3.141592653589793`

#### `log2(x)` va `log10(x)` - `x` ning 2 va 10-lik logorifmini qaytaruvchi funksiyalar

```python
print(math.log2(8))
print(math.log10(100))
```

#### `math` ichidagi ayrim funksiyalar

| Funksiya     | Funksiya ta'rifi                                               |
| ------------ | -------------------------------------------------------------- |
| `ceil(x)`    | x dan katta yoki teng bo'lgan eng kichik butun sonni qaytaradi |
| `fabs(x)`    | x ning absolyut qiymatini qaytaradi                            |
| `floor(x)`   | x dan kichik yoki teng bo'lgan eng yaqin butun sonni qaytaradi |
| `exp(x)`     | \$\$x^e\$\$ ni qaytaruvchi funksiya                                |
| `cos(x)`     | \$\$\cos(x)\$\$ ni qaytaruvchi funksiya                            |
| `sin(x)`     | \$\$\sin(x)\$\$ ni qaytaruvchi funksiya                            |
| `tan(x)`     | \$\$\tan(x)\$\$ ni qaytaruvchi funksiya                            |
| `degrees(x)` | x burchakning radian qiymatini darajaga konvertasiya qilish    |
| `radians(x)` | x burchakning daraja qiymatini radianga konvertasiya qilish    |
| `e`          | Matematik konstanta \$\$e\$\$ (2.71828...)                         |

[`math` moduli](https://docs.python.org/3/library/math.html#module-math) ichidagi barcha funksiyalar bilan [Pythonning rasmiy sahifasida ](https://docs.python.org/3/library/math.html#module-math)tanishishingiz mumkin.

### `random` MODULI

Random moduli tasodifiy sonlar bilan ishlash uchun qulay funksiyalarga boy. Keing ulardan ayrimlari bilan tanishamiz.

#### `randint(a,b)`

Bu funksiya a va b oraligi'da tasodifiy butun son qaytaradi.&#x20;

```python
import random as r # random modulini r deb chaqirayapmiz

son = r.randint(0,100) # 0 va 100 oralig'ida tasodifiy son
print(son)
```

#### `choice(x)`

`x` ning ichidan tasodifiy qiymatni qaytaruvchi funksiya. Bunda `x` bir necha elementdan iborat o'zgaruvchi (matn, ro'yxat) bo'lishi kerak.

```python
ismlar = ['olim','anvar','hasan','husan']
ism = r.choice(ismlar) # ismlar dan tasodifiy ism tanlaymiz
print(ism)
print(r.choice(ism)) # ismdan tasodifiy harf tanlaymiz
```

![Natija](/files/-MPUPeDuElnmFGwz1U5k)

```python
x = list(range(0,51,5))
print(x)
print(r.choice(x))
```

![Natija](/files/-MPUPk2QRKNN5vGpSltz)

&#x20;**shuffle(x)**

`x` ichidagi elementlarni tasodifiy tartibda qaytaruvchi funksiya. Bunda `x` bir necha elementdan iborat o'zgaruvchi (matn, ro'yxat) bo'lishi kerak.

```python
x = list(range(11))
print(x)
r.shuffle(x)
print(x)
```

![Natija](/files/-MPUQ-v5E_ysusN9Q2AR)

`random` moduli ichidagi boshqa funksiyalar haqida [Python rasmiy sahifasidan](https://docs.python.org/3/library/random.html#module-random) ma'lumot olishingiz mumkin.

---''',
    vocabularyRaw: '''import	Modulni to\'liq chaqirish kalit so\'zi	import math
from	Modul ichidan ma\'lum qismni olish	from math import pi
as	Modulga vaqtincha yangi nom (taxallus) berish	import random as r''',
    exercises: [
      Exercise(
        number: 1,
        question: '''math modulidan pi qiymatini to\'g\'ridan-to\'g\'ri import qiling.''',
        answer: '''from math import pi''',
      ),
      Exercise(
        number: 2,
        question: '''import buyrug\'idan keyin modul nomini qisqartirish uchun qaysi kalit so\'z ishlatiladi?''',
        answer: '''as''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 24,
    title: '''Funksiyalar. So\'ngso\'z (Lambda)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/function/24-lambda.md).

## `lambda` YOHUD NOMSIZ FUNKSIYA

Pythonning o'ziga xos xususiyatlaridan biri, nomsiz vaqtinchalik funksiyalar yaratish imkoniyati. Bunday funksiyalarni yaratishda `def` operatori o'rniga `lambda` operatori ishlatilgani uchun ham `lambda` funskiyalar deb ataladi.&#x20;

Nomsiz funksiyalar quyidagicha yaratiladi:

```python
lambda argument:ifoda
```

Lambda funksiyalari istalgan miqdordagi argumentlarga ega bo'lishi mumkin, ammo funksiya badanida faqat bitta ifoda mavjud bo'ladi. Ifoda bajariladi va qaytariladi (`return` operatori shart emas).

Nomsiz funksiyalar biror ifodani tezda hisoblab olishda qulay. Misol uchun quyidgai lambda funksiya ikkita argument qabul qiladi ( \$\$pi, r\$\$ ), va aylana uzunligini qaytaradi:&#x20;

```python
import math
uzunlik = lambda pi, r : 2*pi*r
print(uzunlik(math.pi,10))
```

Natija: `62.83185307179586`

Kodni tahlil qilamiz, 1-qatorda math modulini chaqirib oldik. 2-qatorda lambda funksiyani yaratdik, funksiyamiz `pi` va `r` argumentlarini qabul qilib, `2*pi*r` qiymatni qaytaradi. Funksiyaga nom bermadik, lekin unga `uzunlik` identifikatori orqali murojat qilishimiz mumkin. 3-qatorda funksiyamizga murojat qildik va natijani konsolga chiqardik.

Yana bir misol, topingchi quyidagi funksiyaning vazfiasi nima?

```python
product = lambda x, y : x ** y
print(product(3, 2))
```

&#x20;Shu yerda so'rashingiz mumkin, nima uchun lambda nomsiz deb ataladi, ahir unga hozirgina nomi bilan murojat qildikku?

Gap shundaki, lambda finksiyalarning asl mohiyati boshqa funskiyalar bilan birga ishlaganda ko'rinadi. Keling, tushunarli bo'lishi uchun oddiyroq misol ko'ramiz.

Quyidagi dasturda biz avval daraja degan funksiya yasadik, bu funskiyamiz n degan o'zgaruvchi qabul qilib oladi va funksiya ichidagi noma'lum x ning n-darajasini qaytaradi. Aslida `daraja` bu funksiya yasaydigan funksya bo'ldi. Xo'sh, undan qanday foydalanamiz? 4-5-qatorlarda esa daraja funksiyasidan yana 2 ta funksiya yasadik: kvadrat - kiritilgan sonning kvadratini hisoblaydi, kub - kiritilgan sonning kubini hisoblaydi.

```python
def daraja(n):
    return lambda x : x**n

kvadrat = daraja(2)
kub = daraja(3)
print(f"3-ning kvadrati {kvadrat(3)} ga, kubi {kub(3)} ga teng")
```

Natija: `3-ning kvadrati 9 ga, kubi 27 ga teng`

Lambda funksiyalaridan argument sifatida boshqa funksyani qabul qiluvchi funksiyalar bilan ishlashda ham keng foydalaniladi. Misol uchun `map()` va `filter()` funksiyalari.

## `map()` FUNKSIYASI

Bu funksiya argument sifatida ro'yxat (yoki lug'at) va boshqa bir funksiyani qabul qilib, ro'yxat elementlariga qabul qilingan funksya yordamida ishlov beradi. Tushunarli bo'lish uchun quyidagi misolni ko'ramiz.

```python
from math import sqrt

sonlar = list(range(11)) # 0 dan 10 gacha sonlar ro'yxati
ildizlar = list(map(sqrt,sonlar))
```

Yuqoridagi misolda avval 0 dan 10 gacha `sonlar` ro'yxatini tuzib oldik, keyin esa `map` funksiyasiga ro'yxat va `sqrt` funksiyasini uzatib, ro'yxatdagi barcha sonlarning ildizini hisoblab oldik.&#x20;

map() funksiyasi map obyekt qaytargani sababli, qaytgan obyektni ro'yxatga o'tkazib olish uchun list() funksiyasidan foyydalandik.

Yana bir misol ko'ramiz:

```python
sonlar = list(range(11)) # 0 dan 10 gacha sonlar ro'yxati

def daraja2(x):
    """Berilgan sonning kvadratini qaytaruvchi funksiya"""
    return x*x

print(list(map(daraja2,sonlar))) # sonlar ning kvadratini hisoblaymiz
```

Natija: `[0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100]`

Yuqoridagi misolda biz avval berilgan sonning kvadratini hisoblovchi funksiya yaratib oldik, undan keyin esa map yordamida sonlar ro'yxatidagi elementlarning kvadratini ham hisoblab oldik.

Endi keling huddi shu misolni lambda yordamida yozamiz:

```python
kvadratlar = list(map(lambda x:x*x,sonlar))
print(kvadratlar)
```

Natija: `[0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100]`

Yuqoridagi misolda, endi daraja degan funksiyani yaratib o'tirmasdan, to'g'ridan-to'g'ri map() ni ichiga darajani hisoblovchi lambda funksiya uzatdik.

`map()` funksiyasi bo'lmaganida biz bunday dasturlarni `for` yordamida yozishimiz kerak bo'lar edi:

```python
kvadratlar = []
for son in sonlar:
    kvadratlar.append(son*son)
```

`map()` funksiyasiga bir nechta ro'yxatlar ham uzatish mumkin:

```python
a = [4, 5, 6]
b = [7, 8, 9]
a_plus_b = list(map(lambda x,y:x+y,a,b))
print(a_plus_b)
```

Natija: `[11, 13, 15]`

`map()` istalgan ko'rinishdagi ma'lumot turlari bilan ishlaydi:

```python
ismlar = ['hasan','husan','olim','umid']
print(list(map(lambda matn:matn.upper(),ismlar)))
```

Natija: `['HASAN', 'HUSAN', 'OLIM', 'UMID']`

## `filter()` FUNKSIYASI

Bu funksiya ham argument sifatida ro'yxat va boshqa funskiyani qabul qilib oladi va berilgan ro'yxat elementlarini berilgan funksiya yordamida saralaydi. Bunda argument sifatida uzatilgan funksiya mantiqiy qiymat qaytarishi kerak (`True` yoki `False`).

Keling bunga ham bir misol ko'ramiz: tasodifiy sonlar ro'yxatidan juft sonalrni ajratib oluvchi dastur yozamiz. Dasturimiz 3 qismdan iborat:

1. Avvalo, `random` modulidagi `sample()` funksiyasi yordamida 0-99 oralig'idagi 10 ta tasodifiy sonlar ro'yxatini tuzib oldik
2. Berilgan son juft (True) yoki juft emas (False) ekanligini qaytaruvchi funksiya yozdik
3. filter() fuksiyasiga yangi yaratgan juftmi funksiyasi va tasodifiy sonlar ro'yxatini uzatib, yangi juft\_sonlar ro'yxatini shakllantridik

```python
import random as r

sonlar = r.sample(range(100),10) # 0-99 oralig'ida 10 ta tasodifiy sonlar

def juftmi(x):
    """x juft bo'lsa True, aks holda False qaytaruvchu funksiya"""
    return x%2==0

juft_sonlar = list(filter(juftmi,sonlar))
print(sonlar)
print(juft_sonlar)
```

![Natija](/files/-MQ020rdWjjd9tDL3auG)

Keling endi shu dasturni lambda yordamida yozamiz:

```python
import random as r

sonlar = r.sample(range(100),10) # 0-99 oralig'ida 10 ta tasodifiy sonlar
juft_sonlar = list(filter(lambda son: son%2==0,sonlar))

print(sonlar)
print(juft_sonlar)
```

![Natija](/files/-MPyt8XfHFKBn1wsIolv)

Kurib turganingizdek, lambda funksiya yordamida dastur bir muncha qisqaroq chiqadi. Agar `juftmi` funksiyasi kelajakda shart bo'lmasa, alohida funksiya yaratib o'tirmasdan, bir marttalik lambda funksiyasidan foydalangan afzal.

Keling endi `filter()` funksiyasi yordamida matnlarni saralashga ham misollar ko'raylik.

Quyidagi dastur `mevalar` ro'yxatidan **`b`** harfiga boshlanuvchi mevalarni ajratib oladi. Bu yerda biz matnlarga tegishli bo'lgan `.startswith()` metodidan foydalandik. Bu metod, berilgan matn shu harfdan boshlanadimi yoki yo'q tekshiradi va `True` yoki `False` qiymat qaytaradi.

```python
mevalar = ['olma','anor','anjir','shaftoli',"o'rik","tarvuz","qovun","banan"]

mevalar_b = list(filter(lambda meva:meva.startswith('b'),mevalar))
print(mevalar_b)
```

Quyidagi dastur esa `mevalar` ro'yxatidan nomi 5 yoki undan kam harfdan iborat mevalarni saralab oladi.

```python
mevalar2 = list(filter(lambda meva:len(meva)<=5, mevalar))
print(mevalar2)
```

Natija: `['olma', 'anor', 'anjir', "o'rik", 'qovun', 'banan']`

Topingchi, quyidagi kod qanday vazifani bajaradi?

```python
list(filter(lambda meva:(meva.startswith('a') and meva.endswith('r')), mevalar))
```

## SO'NGSO'Z

Ushbu darsimiz bilan biz dasturlash asoslarining katta bir qismiga yakun yasadik, navbat Object Oriented Programming va boshqa katta mavzularga. Lekin, bu mavzularga o'tishdan avval, keyingi darslarimizni bir nechta sodda loyihalar qilishga bag'ishlaymiz.&#x20;

E'tiboringiz uchun rahmat!

---''',
    vocabularyRaw: '''lambda	Nomsiz bir qatorli funksiya yaratish	lambda x: x**2
map()	Ro\'yxatning har bir elementiga funksiyani qo\'llash	map(f, list)
filter()	Shartga mos keladigan elementlarni saralash	filter(f, list)''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Sonning kvadratini qaytaruvchi lambda funksiya yozing.''',
        answer: '''kvadrat = lambda x: x**2''',
      ),
      Exercise(
        number: 2,
        question: '''Lambda funksiya yaratish kalit so\'zi?''',
        answer: '''lambda''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 25,
    title: '''Amaliyot: \'Son Topish\' O\'yini''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/amaliyot/25-guess-the-number.md).

## 1-QISM: O'YIN SHARTI BILAN TANISHAMIZ

## 2-QISM: DASTUR BO'YICHA YO'NALISH

## 3-QISM: KOD

## KOD

### GitHub

### Repl.it

---''',
    vocabularyRaw: '''random.randint()	Oraliqdagi tasodifiy butun sonni olish	randint(1, 100)
random.choice()	Ro\'yxatdan tasodifiy element tanlash	choice(list)''',
    exercises: [
      Exercise(
        number: 1,
        question: '''1 dan 10 gacha tasodifiy butun sonni generatsiya qiluvchi kod yozing.''',
        answer: '''import random
son = random.randint(1, 10)''',
      ),
      Exercise(
        number: 2,
        question: '''random modulidan tasodifiy butun son olish funksiyasi qaysi?''',
        answer: '''randint''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 26,
    title: '''Amaliyot: \'So\'z Topish\' (Hangman) O\'yini''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/amaliyot/26-guess-the-word.md).

## 1-QISM: TANISHUV

## 2-QISM: KOD

## KOD

### GitHub

### Repl.it

---''',
    vocabularyRaw: '''.choice()	Ro\'yxatdan tasodifiy element olish funksiyasi	random.choice(words)
.isalpha()	Matn faqat harflardan iboratligini tekshirish	text.isalpha()''',
    exercises: [
      Exercise(
        number: 1,
        question: '''So\'zni harflarga ajratib set (to\'plam) ga aylantiruvchi kod yozing.''',
        answer: '''harflar = set(soz)''',
      ),
      Exercise(
        number: 2,
        question: '''Kiritilgan belgi faqat harf ekanligini tekshiruvchi metod nomi?''',
        answer: '''isalpha()''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 27,
    title: '''Amaliyot: Kirill-Lotin Telegram Bot''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/amaliyot/27-cyr2lat-bot.md).

## 1-QISM. KIRILL-LOTIN-KIRILL TRANSLITERATOR

## 2-QISM. TELEGRAM BOT

## KOD

### GitHub

### Repl.it

---''',
    vocabularyRaw: '''BotFather	Telegramda yangi bot yaratuvchi rasmiy bot	@BotFather
Token	Botni boshqarish uchun maxsus kalit (string)	API Token
polling	Botni doimiy ravishda yangi xabarlarni tekshirish rejimida saqlash	bot.polling()''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Telegramda yangi bot yaratib token olish uchun qaysi botga boriladi?''',
        answer: '''@BotFather''',
      ),
      Exercise(
        number: 2,
        question: '''Botni doimiy ishchi holatda ushlab turuvchi metod nomi?''',
        answer: '''polling()''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 28,
    title: '''OOP: Klasslar (Classes)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/oop/28-klasslar.md).

## KIRISH

Avvalgi darsimizda ko'rganimizdek, klasslar Object oriented dasturlashning poydevorlaridan biridir. Klasslar bizga dasturlashga va dastur elementlariga real hayotdagi buyumlar (obyektlarga) yondoshgandek yondoshish imkonin beradi.

Klasslar, obyketlar va ularning qanday ishlashini tushungan dasturchi, mantiqiy fikrlashda ham kuchli bo'ladi. Mukammal va kompleks muammolarga ham yechimni ko'ra biladi.

## PYTHONDAGI KLASSLAR

Klass tushunchasi siz uchun yangi bo'lishi mumkin, lekin biz shu vaqtgacha ulardan doimiy ravishda foydalanib keldik.

Keling `x` o'zgaruvchi yaratamiz, unga biror qiymat yuklaymiz va `type()` funksiyasi yordamida uning turini kuramiz:

```python
x = 10
print(type(x))
```

Natija: `<class 'int'>`

```python
matn = "salom"
print(type(matn))
```

Natija: `<class 'str'>`

Yuqoridan ko'rayabmizki, `x` bu `int` klassidagi, `matn` esa `str` klassidagi obyektlar ekan. Demak biz o'zgaruvchi yaratganimizda, aslida Python `int` yoki `str` klassidan foydalangan holda yangi obyektlar yaratib kelayotgan ekan.

Huddi shu kabi, agar yangi funksiya yaratib, uning ham turini tekshirsak, funksiyamiz `function` klassiga tegishli obyekt bo'lib chiqadi.

```python
def salom_ber():
    print("Assalom alaykum")

print(type(salom_ber))
```

&#x20;Natija: `<class 'function'>`

Demak, Pythondagi har qanday o'zgaruvchi, funksiya va boshqa elementlar aslida obyektlar ekan.

### METODLAR

Har bir obyekt uning ustida bajarish mumkin bo'lgan funksiyalar bilan keladi. Bu funksiyalar obyekt ichida yashirin bo'ladi, va biz ularga nuqta va funksiya nomi orqali murojat qilishimiz mumkin. Bunday funksiyalar shu klass (yoki obyektga) tegishli **metodlar** deyiladi.

Biz ba'zi metodlar bilan avvalgi darslarimizda tanishdik. Bir klassga tegishli metodlar, boshqa klassdagi obyketlar uchun mavjud bo'lmasligi tabiiy. Misol uchun matnlar uchun mavjud metodlarni, butun yoki o'nli sonlarga qo'llab bo'lmaydi.

```python
matn = "salom"
print(matn.upper())
```

Natija: `SALOM`

```python
son = 20
print(son.lower())
```

Natija: **`AttributeError: 'int' object has no attribute 'lower'`**

Keling endi o'zimizning klasslarimizni yaratishni ko'ramiz.

## KLASS YARATISH

Yangi klass yaratish uchun class operatoridan foydalanamiz va klassimizga tushunarli nom beramiz. Esingizda bo'lsin, klass bu hali obyekt emas, bu obyekt uchun shablon. Shuning uchun klass yaratishda shu klassdagi obyektlar uchun umumiy bo'lgan xususiyatlar va funksiyalarni o'ylashimiz kerak.

Keling, Talaba degan klass yaratamiz:

```python
class Talaba:
    """Talaba nomli klass yaratamiz"""
    def __init__(self,ism,familiya,tyil):
        """Talabaning xususiyatlari"""
        self.ism = ism
        self.familiya = familiya
        self.tyil = tyil
```

Kodimizni tahlil qilamiz:

* `class Talaba` — `Talaba` nomli klass yaratdik. Klasslarga nom berishda uning birinchi harfini katta harfdan boshlash tavsiya qilinadi. Agar klass nomi 2 va undan ko'p so'zdan iborat bo'lsa har bir so'zni katta harf bilan boshlang.
* `def __init__(self)` — klassga tegishli xususiyatlarni saqlovchi maxsus metod (funksiya). self kalit so'zi ingliz tilidan "o'zi" deb tarjima qilinadi, va bu klassdan yaratilgan obyektning o'ziga ishora qiladi. Ya'ni keyinchalik biz obyekt ichidagi metodga murojat qilganimizda shu obyektning o'zi birinchi bo'lib funksiyaga argument sifatida uzatiladi, obyket ustida turli amallar bajarish imkonin beradi
* `def __init__(self,ism,familiya,tyil)` — yaratayotgan klassimizga xos xususiyatlarni `def __init__(self)` funksiyasiga argument sifatida uzatamiz. Bizning Talaba klassimiz ism, familiya va tug'ilgan yilga ega bo'ladi.&#x20;
* Keyingi qatorlarda esa `self.xususiyat = argument` komandasi yordamida uzatilgan argumentlarni klassning xususiyatlari bilan bo'glayapmiz. Bu yerda xususiyat nomi uzatilgan argument nomi bilan mos tushishi shart emas, unga istalgan nom berishimiz mumkin (masalan `self.name = ism`)

## KLASSDAN OBYEKT YARATAMIZ

Klassimiz tayyor, keling endi klassimizdan yangi obyekt yaratamiz.&#x20;

```python
talaba1 = Talaba("Alijon","Valiyev",2000)
```

Mana, `talaba1` obyektimiz tayyor. Obyektni yaratish uchun Talaba klassiga murojat qildik va talabaning ismi, familiyasi va tug'ilgan yilini parameter sifatida uzatdik.&#x20;

### OBYKETNING XUSUSIYATLARINI KO'RISH

Obyektning xususiyatlarini ko'rish uchun nuqta orqali murojat qilishimiz mumkin.

```python
print(talaba1.ism)
```

Natija: `Alijon`

```python
print(talaba1.familiya)
```

Natija: `Valiyev`

### KLASSDAN BIR NECHTA OBYEKTLAR YARATISH

Yuqoridagi klassdan biz istalgancha obyektlar yaratishimiz mumkin:

```python
talaba2 = Talaba("Olim","Olimov",1995)
talaba3 = Talaba("Husan","Akbarov",2004)
talaba4 = Talaba("Hasan","Akbarov",2004)
```

Bunda har bir obyekt o'zining alohida xususiyatlariga ega bo'ladi.

```python
print(talaba2.ism)
print(talaba4.familiya)
```

Natija:&#x20;

* `Olim`
* `Akbarov`

## KLASSGA METODLAR QO'SHAMIZ

Obyektimizning xususiyatlarini aniqlab oldik, keling endi obyekt bajarishi kerak bo'lgan metodlarni ham qo'shaylik.

```python
class Talaba:
    """Talaba nomli klass yaratamiz"""
    def __init__(self,ism,familiya,tyil):
        """Talabaning xususiyatlari"""
        self.ism = ism
        self.familiya = familiya
        self.tyil = tyil
    
    def tanishtir(self):
        print(f"Ismim {self.ism} {self.familiya}. {self.tyil} yilda tu'gilganman")
```

Boshlanishiga klassimizga bitta, `tanishtir` metodini qo'shdik. Bu metodimiz ko'rib turganingizdek bitta `self` (ya'ni obyektning o'zini) argumentini qabul qiladi va talaba haqidagi ma'lumotlarni konsolga chiqaradi.

### OBYEKTNING METODLARIGA MUROJAT QILAMIZ

Obyekt ichidagi funksiyaga ya'ni obyektning metodiga murojat qilamiz:

```python
talaba4 = Talaba("Hasan","Akbarov",2004)
talaba4.tanishtir()
```

Natija: `Ismim Hasan Akbarov. 2004 yilda tu'gilganman`

Klassimiz istalgancha metodlardan iborat bo'lishi mumkin:

```python
class Talaba:
    """Talaba nomli klass yaratamiz"""
    def __init__(self,ism,familiya,tyil):
        """Talabaning xususiyatlari"""
        self.ism = ism
        self.familiya = familiya
        self.tyil = tyil
    
    def get_name(self):
        """Talabaning ismini qaytaradi"""
        return self.ism
    
    def get_lastname(self):
        """Talabaning familiyasini qaytaradi"""
        return self.familiya
    
    def get_fullname(self):
        """Talabaning ism-familiyasini qaytaradi"""
        return f"{self.ism} {self.familiya}"
    
    def tanishtir(self):
        print(f"Ismim {self.ism} {self.familiya}. {self.tyil} yilda tu'gilganman")
```

```python
talaba1 = Talaba("Alijon","Valiyev",2000)
print(talaba1.get_fullname())
```

Natija: `Alijon Valiyev`

### ARGUMENT QABUL QILUVCHI METODLAR

Yuqoridagi misolimizda barcha metodlar faqatgina self parametrini qabul qilishayapti. Aslida, barcha funksiyalar kabi, klass ichidagi obyektlarni ham boshqa argumentlar qabul qiladigan qilib yozish mumkin.

```python
class Talaba:
    """Talaba nomli klass yaratamiz"""
    def __init__(self,ism,familiya,tyil):
        """Talabaning xususiyatlari"""
        self.ism = ism
        self.familiya = familiya
        self.tyil = tyil
    
    def get_name(self):
        """Talabaning ismini qaytaradi"""
        return self.ism
    
    def get_lastname(self):
        """Talabaning familiyasini qaytaradi"""
        return self.familiya
    
    def get_fullname(self):
        """Talabaning ism-familiyasini qaytaradi"""
        return f"{self.ism} {self.familiya}"
    
    def get_age(self,yil):
        """Talabaning yoshini qaytaradi"""
        return yil-self.tyil
    
    def tanishtir(self):
        print(f"Ismim {self.ism} {self.familiya}. {self.tyil} yilda tu'gilganman")
```

Yuqorida klassimizga yangi `get_age(self,yil)` metodini qo'shdik. Bu metod obyektning o'zidan tashqari, qo'shimcha, `yil` argumentini ham qabul qiladi va talabaning yoshini qaytaradi.

```python
talaba1 = Talaba("Alijon","Valiyev",2000)
print(talaba1.get_age(2021))
```

Natija: `21`

## `pass` OPERATORI

Pythonda hech qanday vazifani bajarmaydigan `pass` operatori mavjud. Bu operatordan bo'sh metodlar yaratishda foydalanish mumkin. Misol uchun siz klassingiz uchun muhim metodlarni bilasiz, lekin metod badani hali tayyor emas. Agar metod badanini bo'sh qoldirsangiz, Python **`IndentationError`** xatosini qaytaradi. Shunday xolatlarda, funksiya badaniga `pass` operatorini qo'yib ketishimiz mumkin:

```python
class User:
    def __int__(self,name,username,email):
        self.name = name
        self.uname = username
        self.mail = email
    
    def describe():
        pass
    
    def get_email():
        pass
```

&#x20;Yuqoridagi klassimizda `describe()` va `get_email()` funksiyalar badani hali tayyor emas, bo'shliqni to'ldirish uchun esa pass operatoridan foydalanganmiz.

`pass` operatoridan `if-else`, `for`, `while` operatorlari badanida ham foydalanish mumkin.

## AMALIYOT

* Web sahifangiz uchun foydalanuvchi (user) klassini tuzing. Klassning xususiyatlari sifatida odatda ijtimoiy tarmoqlar talab qiladigan ma'lumotlarni kiriting (ism, foydalanuvchi ismi, email, va hokazo)
* Klassga bir nechta metodlar qo'shing, jumladan get\_info() metodi foydalanuvchi haqida yig'ilgan ma'lumotlarni chiroyli qilib chiqarsin (masalan: "Foydalanuvchi: alijon1994, ismi: Alijon Valiyev, email: <alijon1994@gmail.com>).
* Klassdan bir nechta obyektlar yarating va uning xususiyatlari va metodlariga murojat qiling.

---''',
    vocabularyRaw: '''class	Klass yaratish kalit so\'zi	class Mashina:
__init__	Konstruktor, yangi obyekt yaratilganda ishlaydi	def __init__(self):
self	Yaratilayotgan obyektning o\'ziga ishora	self.ism = ism''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Bo\'sh \'Kitob\' nomli klass yarating.''',
        answer: '''class Kitob:
    pass''',
      ),
      Exercise(
        number: 2,
        question: '''Klass ichida konstruktor funksiya nomi qanday yoziladi?''',
        answer: '''__init__''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 29,
    title: '''OOP: Obyektlar Bilan Ishlash''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/oop/29-obyektlar-bilan-ishlash.md).

## XUSUSIYATLARGA STANDART QIYMAT BERISH

Avvalgi darsizmida biz klass yaratish, unga xususiyatlar va metodlar qo'shishni ko'rdik. Klassdan obyekt yaratganimizda esa uning xususiyatlarini parametr sifatida uzatishni o'rgandik.

Pythonda obyektning ba'zi xususiyatlarini parametr yordamida uzatmasdan, klass yaratishda unga standart qiymat berib ketishimiz mumkin. Keling, `Talaba` klassimizga qaytamiz. Bu klassimiz 3 ta xususiyatga ega edi: `ism`, `familiya`, `tyil`. Biz yana bitta qo'shimcha, `bosqich` nomli xususiyat qo'shamiz, va unga standart qiymat sifatida `1` beramiz, e'tibor qiling bu xususiyat obyekt yaratilishida parametr sifatida uzatilmaydi:

```python
class Talaba:
    """Talaba nomli klass yaratamiz"""
    def __init__(self,ism,familiya,tyil):
        """Talabaning xususiyatlari"""
        self.ism = ism
        self.familiya = familiya
        self.tyil = tyil
        self.bosqich = 1
    
    def get_info(self):
        return f"{self.ism} {self.familiya}. {self.bosqich}-bosqich talabasi "
```

Endi, `Talaba` klassidan yangi obyekt yaratganimizda har bir yangi talabaning kursi `1` ga teng bo'ladi.

```python
talaba1 = Talaba("Alijon","Valiyev",2000)
print(talaba1.get_info())
```

Natija: `Alijon Valiyev. 1-bosqich talabasi`

### STANDART QIYMATNI O'ZGARTIRISH

Obyektning standart qiymatiga ham boshqa xususiyatlar kabi nuqta orqali murojat qilishimiz va uning qiymatini almashtirishimiz mumkin:

```python
talaba1.bosqich= 2
print(talaba1.bosqich)
```

&#x20; Natija: `2`

Yana boshqa usuli, obyekt xususiyatini yangilovchi metod yozish.

```python
class Talaba:
    """Talaba nomli klass yaratamiz"""
    def __init__(self,ism,familiya,tyil):
        """Talabaning xususiyatlari"""
        self.ism = ism
        self.familiya = familiya
        self.tyil = tyil
        self.bosqich = 1
    
    def get_info(self):
        """Talaba haqida ma'lumot"""
        return f"{self.ism} {self.familiya}. {self.bosqich}-bosqich talabasi "
    
    def set_bosqich(self,bosqich):
        """Talabaning kursini yangilovchi metod"""
        self.bosqich = bosqich
```

Metodga murojat qilamiz:

```python
talaba1.set_bosqich(3)
print(talaba1.get_info())
```

Natija: `Alijon Valiyev. 3-bosqich talabasi`

Umuman olganda xususiyatlarni yangilashda turli usullardan foydalanish mumkin. Misol uchun talabaning bosqichi odatda 1 tadan ko'payib boradi, shuning uchun quyidagicha metod ham yozishimiz mumkin:

```python
class Talaba:
    """Talaba nomli klass yaratamiz"""
    def __init__(self,ism,familiya,tyil):
        """Talabaning xususiyatlari"""
        self.ism = ism
        self.familiya = familiya
        self.tyil = tyil
        self.bosqich = 1
    
    def get_info(self):
        """Talaba haqida ma'lumot"""
        return f"{self.ism} {self.familiya}. {self.bosqich}-bosqich talabasi "
    
    def set_bosqich(self,bosqich):
        """Talabaning kursini yangilovchi metod"""
        self.bosqich = bosqich
        
    def update_bosqich(self):
        """Talabanining bosqichini 1taga ko'paytirish"""
        self.bosqich += 1
```

`update_bosqich()` metodiga murojat qilganimizda talabning bosqichi oshib boradi:

```python
talaba1 = Talaba("Alijon","Valiyev",2000)
print(talaba1.get_info())

talaba1.update_bosqich() # 1 bosqichga oshiramiz
print(talaba1.get_info())
```

Natija: `Alijon Valiyev. 1-bosqich talabasi`

```python
talaba1.update_bosqich() # 1 bosqichga oshiramiz
print(talaba1.get_info())
```

Natija: `Alijon Valiyev. 2-bosqich talabasi`

```python
talaba1.update_bosqich() # 1 bosqichga oshiramiz
print(talaba1.get_info())
```

Natija: `Alijon Valiyev. 3-bosqich talabasi`

## OBYEKTLAR O'RTASIDA MUNOSABAT

Obyektga yo'naltirilgan dasturlashning afzalligi, turli obyektlar o'rtasida o'zaro munosabatlarni oson yo'lga qo'yish mumkinligida. Buni misolda ko'rish uchun, yangi `Fan` degan klass yaratamiz va fanimizga talabalar qo'shish imkoniyatini ham yaratamiz (`add_student()` metodi):

```python
class Fan():
    def __init__(self,nomi):
        self.nomi = nomi
        self.talabalar_soni = 0
        self.talabalar = []
    
    def add_student(self,talaba):
        """Fanga talabalar qo'shish"""
        self.talabalar.append(talaba)
        self.talabalar_soni += 1
```

E'tibor bering, `Fan` klassi faqatgina yagona `nomi` degan parametrga ega. Qolgan xususiyatlariga esa standart qiymat berilgan: talabalar soni (`self.talabalar_soni`) 0 ga teng, talabalar ro'yxati (`self.talabalar`) esa bo'sh.

Fanimizga talaba qo'shish uchun `add_student()` metodini chaqiramiz. Bu metod parametr sifatida `Talaba` obyektini qabul qiladi va uni `talabalar` ro'yxatiga qo'shadi. Shuningdek, bu metod yangi talaba qo'shilganda `talabalar_soni` ni 1 taga oshirib qo'yadi.

Keling boshlanishiga yangi fan obyektini va bir nechta talabalarni yaratamiz:

```python
matematika = Fan("Oliy Matematika")
talaba1 = Talaba("Alijon","Valiyev",2000)
talaba2 = Talaba("Hasan","Alimov",2001)
talaba3 = Talaba("Akrom","Boriyev",2001)
```

Talabalarni yangi fanimizga qo'shamiz:

```python
matematika.add_student(talaba1)
matematika.add_student(talaba2)
matematika.add_student(talaba3)
```

Mana, fanimiz tayyor, talabalar qo'shildi. Keling endi fan haqida ma'lumotlarni olamiz:

```python
print(matematika.talabalar_soni)
```

Natija: `3`

Fanimizga 3 ta talaba qo'shilibdi. Talabalar haqida ma'lumot olsak bo'ladimi?

```python
print(matematika.talabalar)
```

Natija: `[<__main__.Talaba object at 0x000001AB08939588>, <__main__.Talaba object at 0x000001AB089397C8>, <__main__.Talaba object at 0x000001AB087D9F08>]`

Talabalarning ismi familiyasi o'rniga qandaydur tushunarsiz ma'lumotlar. Aslida hammasi to'g'ri, yuqorida fanimizga yangi talabalarni obyekt sifatida qo'shgan edik, yuqoridagi natija esa matematika.talabalar ro'yxatida `Talaba` klassiga oid 3 ta obyekt borligini ko'rsatayapti.&#x20;

Fanimizga yozilgan talabalar haqida tushunarli ma'lumot olish uchun esa Fan klassiga yana bir, `get_students()` degan, yangi metod qo'shamiz. Bu metod `talabalar` ichidagi har bir `talaba` obyektiga murojat qilib, `get_info()` metodi yordamida talabaning ma'lumotlarini oladi, ro'yxatga qo'shadi va shu ro'yxatni qaytaradi:

```python
class Fan():
    def __init__(self,nomi):
        self.nomi = nomi
        self.talabalar_soni = 0
        self.talabalar = []
    
    def add_student(self,talaba):
        """Fanga talabalar qo'shish"""
        self.talabalar.append(talaba)
        self.talabalar_soni += 1
    
    def get_students(self):
        return [talaba.get_info() for talaba in self.talabalar]
```

Shu o'rinda Pythonda ro'yxatlar bilan ishlashning qulayliklaridan birini ham ko'rsatib o'tsak. Yuqoridagi kodimizning 13-qatorida e'tibor bersangiz, biz yangi ro'yxat shakllantirishda 1 qator koddan foydalandik:

```python
[talaba.get_info() for talaba in self.talabalar]
```

Kodimizni tahlil qilsak, `self.talabalar` ichidagi har bir talaba uchun `get_info()` metodini bajar degan ma'no kelib chiqadi. Kodni kvadrat qavslar ichiga olganimiz uchun esa, har bir tsikl natijasi avtomat ravishda ro'yxatga qo'shib boriladi.&#x20;

Mana endi metodga murojat qilib, talabalar haqida ma'lumot olishimiz mumkin:

```python
mat_talabalar = matematika.get_students()
print(mat_talabalar)
```

`['Alijon Valiyev. 1-bosqich talabasi ', 'Hasan Alimov. 1-bosqich talabasi ', 'Akrom Boriyev. 1-bosqich talabasi ']`

Shunday qilib biz ikki bir-biriga bog'liq bo'lmagan obyektlar ustida turli munosabatlar o'rnatishimiz mumkin.

## NUQTA YOKI METOD?

Pythondagi obyketlarning o'ziga xos xususiyatlaridan biri, obyektning xususiyatiga nuqta orqali murojat qilish mumkin. Misol uchun avval yaratagn `talaba1` obyektining ismini bilish uchun `talaba1.ism` deb yozish kifoya.

Bu o'ziga yarasha qulay bo'lsada, bu usuldan foydalanmagan afzal. Sababi, vaqt o'tib klassingiz takomillashishi, uning ba'zi xususiyatlari o'zgarishi, o'chirilishi yoki almashtirilishi mumkin. Shunday holatlarda nuqta orqali murojat qilish siz kutgan natijani bermasligi va dastur xato ishlashiga olib kelishi mumkin. Bunday holatlarning oldini olish uchun esa, obyektning xususiyatlarini metod orqali olishni odat qilish tavsiya qilinadi. Huddi shu kabi, obyektning xususiyatlarini yangilash uchun ham alohida metodlar yozga afzal.

Dasturchilar orasida obyektning xususiyatlarini o'zgartiradigan metodlarni `set` (o'zgartir) so'zi bilan, xususiyatlarni qaytaradigan metodlarni esa `get` (olish) so'zi bilan boshlash qoida qilib olingan. Masalan: `set_name()` va `get_name()` kabi.

Agar yuqoridagi qoidalarga amal qilgan holda, `Talaba` klassimizni yangilaydigan bo'lsak, u tahminan shunday ko'rinishga ega bo'ladi:

```python
class Talaba:
    """Talaba nomli klass yaratamiz"""
    def __init__(self,ism,familiya,tyil):
        """Talabaning xususiyatlari"""
        self.ism = ism
        self.familiya = familiya
        self.tyil = tyil
        self.bosqich = 1
      
    def set_bosqich(self,bosqich):
        """Talabaning kursini yangilovchi metod"""
        self.bosqich = bosqich
        
    def update_bosqich(self):
        """Talabanining bosqichini 1taga ko'paytirish"""
        self.bosqich += 1    
    
    def get_info(self):
        """Talaba haqida ma'lumot"""
        return f"{self.ism} {self.familiya}. {self.bosqich}-bosqich talabasi "
    
    def get_name(self):
        """Talabaning ismini qaytaradi"""
        return self.ism
    
    def get_lastname(self):
        """Talabaning familiyasini qaytaradi"""
        return self.familiya
    
    def get_fullname(self):
        """Talabaning ism-familiyasini qaytaradi"""
        return f"{self.ism} {self.familiya}"
    
    def get_age(self,yil):
        """Talabaning yoshini qaytaradi"""
        return yil-self.tyil
```

Huddi shu kabi, `Fan` klassimizning yakuniy ko'rinishi quyidagicha bo'ladi:

```python
class Fan():
    """Fan nomli klass"""
    def __init__(self,nomi):
        self.nomi = nomi
        self.talabalar_soni = 0
        self.talabalar = []
    
    def add_student(self,talaba):
        """Fanga talabalar qo'shish"""
        self.talabalar.append(talaba)
        self.talabalar_soni += 1
    
    def get_name(self):
        """Fan nomi"""
        return self.nomi
    
    def get_students(self):
        """Fanga yozilgan talabalar haqida ma'lumot"""
        return [x.get_info() for x in self.talabalar]
    
    def get_students_num(self):
        """Fanga yozilgan talabalar soni"""
        return self.talabalar_soni
```

## OBYEKTNING XUSUSIYATLARI VA METODLARINI KO'RISH

Obyektlar bilan ishlaganda, o'z-o'zidan shu obyektga tegishli xususiyatlar va metodlarni bilish talab qilinadi. Agar obyekt tegishli bo'lgan klassni o'zimiz yaratgan bo'lsak, istalgan payt klass ichini ko'rib olishimiz mumkin. Lekin boshqalar yaratgan klass haqida ma'lumot olish talab qilinsa, buning bir nechta yo'li bor.

### `dir()` FUNKSIYASI

`dir()` funksiyasi yordamida istalgan obyekt yoki klassning xususiyatlari va metodlarini ko'rib olishimiz mumkin:

```python
>>> dir(Talaba)
['__class__',
 '__delattr__',
 '__dict__',
 '__dir__',
 '__doc__',
 '__eq__',
 '__format__',
 '__ge__',
 '__getattribute__',
 '__gt__',
 '__hash__',
 '__init__',
 '__init_subclass__',
 '__le__',
 '__lt__',
 '__module__',
 '__ne__',
 '__new__',
 '__reduce__',
 '__reduce_ex__',
 '__repr__',
 '__setattr__',
 '__sizeof__',
 '__str__',
 '__subclasshook__',
 '__weakref__',
 'get_age',
 'get_fullname',
 'get_info',
 'get_lastname',
 'get_name',
 'set_bosqich',
 'update_bosqich']
```

Lekin bunda har bir klass bilan keluvchi maxsus **dunder metodlar** ham chiqib keldi. Dunder metodlar ikki pastki chiziq (`__`) bilan boshlanadi va maxsus holatlar uchun saqlab qo'yilgan. Biz hozircha faqat `__init__` metodi bilan tanishdik, qolganlari bilan keyingi darslarimizda yana ko'rishamiz. Dunder metodlardan keyin esa biz murojat qilishimiz mumkin bo'lgan metodlar ro'yxati kelgan.

Dunder — double underscore (ikki pastki chiziq) so'zlarining qisqartmasi.

Keling dunder metodlarni tashlab, bizga kerak metodlarni qaytaruvchi sodda funksiya yozamiz:

```python
def see_methods(klass):
    return [method for method in dir(klass) if method.startswith('__') is False]

print(see_methods(Talaba))
```

&#x20;Natija: `['get_age', 'get_fullname', 'get_info', 'get_lastname', 'get_name', 'set_bosqich', 'update_bosqich']`

Agar `dir()` funksiyasiga klass emas, obyekt uzatsak metodlardan tashqari xususiyatlar ham chiqib keladi:

```python
print(see_methods(talaba1))
```

Natija: `['bosqich', 'familiya', 'get_age', 'get_fullname', 'get_info', 'get_lastname', 'get_name', 'ism', 'set_bosqich', 'tyil', 'update_bosqich']`

### `__dict__` METODI

Yuqorida zikr qilingan dunder metodlardan biri bu `__dict__` metodi bo'lib, bu metod **obyketning** xususiyatlarini lug'at ko'rinishida qaytaradi:

```python
print(talaba1.__dict__)
```

Natija: `{'ism': 'Alijon', 'familiya': 'Valiyev', 'tyil': 2000, 'bosqich': 1}`

Natijadan faqatgina kalitlarni ajratib olsak, obyektning xususiyatlari chiqadi:

```python
print(talaba1.__dict__.keys())
```

Natija: `dict_keys(['ism', 'familiya', 'tyil', 'bosqich'])`

## AMALIYOT

* `Avto` degan yangi klass yarating. Unga avtomobillarga doir bo'lgan bir nechta xususiyatlar (model, rang, korobka, narh va hokazo) qo'shing. Ayrim xususiyatlarga standart qiymat bering (masalan, `kilometer=0`)
* `Avto` ga oid obyektning xususiyatlarini qaytaradigan metodlar yozing
  * `get_info()` metodi avti haqida to'liq ma'lumotni matn ko'rinishida qaytarsin
* `Avto` ga oid obyektning xususiyatlarini yangilaydigan metodlar yozing.
  * `update_km()` metodi son qabul qilib olib, avtomobilning yurgan kilometrajini yangilab borsin
* Yangi, `Avtosalon` degan klass yarating va kerakli xususiyatlar bilan to'ldiring (salon nomi, manzili, sotuvdagi avtomobillar va hokazo)
* Avtosalonga yangi avtomobillar qo'shish uchun metod yozing
* Avtosalondagi avtomobillar haqida ma'lumot qaytaruvchi metod yozing
* Yuqoridagi obyektlar va ularga tegishli metodlarni tekshirib ko'ring
* `dir()` funksyasi va `__dict__` metodi yordamida o'zingiz yozgan va Pythondagi turli klass va obyektlarning xususiyatlari va metodlarini toping (`dir(str)`, `dir(int)` va hokazo)

## KODLAR

---''',
    vocabularyRaw: '''attribute	Obyektning xususiyati (o\'zgaruvchisi)	object.name
method	Obyektning funksiyasi (metodi)	object.drive()''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Klass metodida birinchi parametr sifatida nima yozilishi shart?''',
        answer: '''self''',
      ),
      Exercise(
        number: 2,
        question: '''talaba obyekti ismini \'Ali\' ga o\'zgartiruvchi kod yozing.''',
        answer: '''talaba.ism = \'Ali\'''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 30,
    title: '''OOP: Vorislik va Polimorfizm''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/oop/30-vorislik-polimorfizm.md).

## SUPER KLASS VA VORIS KLASS

Obyektga yo'naltirilgan dasturlashning qulayliklaridan biri bu klasslardan boshqa klass yaratish imkoniyati. Bizga kerak bo'lgan yangi klass, avval yaratilgan boshqa klass bilan o'xshashlik joylari bo'lsa, biz bu klassdan voris klass yaratishimiz mumkin. Bunda asl klass - ota, yoki super klass deb ataladi.&#x20;

Super klassdan yaratilgan voris klass otaning barcha yoki tanlangan xususiyatlari va metodlarini meros olish bilan birga, o'ziga xos xususiyat va metodlariga ega bo'ladi.

Keling boshlanishiga `Shaxs` klassini yaratamiz, bu klassimiz keyinchalik boshqa klasslar uchun super klass vazifasini bajaradi:

```python
class Shaxs:
    """Shaxslar haqida ma'lumot"""
    def __init__(self,ism,familiya,passport,tyil):
        self.ism = ism
        self.familiya = familiya
        self.passport = passport
        self.tyil = tyil
    
    def get_info(self):
        """Shaxs haqida ma'lumot"""
        info = f"{self.ism} {self.familiya}. "
        info += f"Passport:{self.passport}, {self.tyil}-yilda tug`ilgan"
        return info
        
    def get_age(self,yil):
        """Shaxsning yoshini qaytaruvchi metod"""
        return yil - self.tyil
```

Klassimizni tekshirib ko'ramiz:

```python
inson = Shaxs("Hasan","Alimov","FB001122",1995)
print(f"{inson.get_info()}. {inson.get_age(2021)} yoshda.")
```

Natija: ``Hasan Alimov. Passport:FB001122, 1995-yilda tug`ilgan. 26 yoshda.``

## VORIS KLASS YARATISH

Endi avvalgi darsimizda yaratgan `Talaba` klassimizni qaytadan yaratamiz. Bu safar, avvalgidan farqli ravishda, `Talaba` ni yaratishda, `Shaxs` dan super klass sifatida foydalanamiz:

```python
class Talaba(Shaxs):
    """Talaba klassi"""
    def __init__(self, ism, familiya, passport, tyil):
        """Talabaning xususiyatlari"""
        super().__init__(ism, familiya, passport, tyil)
```

Kodimizni tahlil qilaylik:

* 1-qatorda klass nomidan so'ng, qavs ichida super klass nomini berdik
* 5-qatorda (`def __init__` ichida) klassimiz super klassning xususiyatlarini meros olishini ko'rsatdik&#x20;

Yangi yaratgan Talaba klassimiz Shaxsning barcha xususiyatlari va metodlariga ega bo'ladi.

```python
talaba = Talaba("Valijon","Aliyev","FA112299",2000)
print(talaba.get_info())
```

Natija: Valijon Aliyev. Passport:FA112299, 2000-yilda tug\`ilgan

Talaba klassi uchun alohida `get_info()` metodini yozmagan bo'lsakd&#x61;*,* bu metod `Talaba`ga `Shaxs`dan meros o'tdi.

Huddi shu kabi `get_age()` metodiga ham murojat qilishimiz mumkin:

```python
>>>print(talaba.get_age(2021))
21
```

Dastur davomida super klass voris klasslardan avval yozilgan (chaqirilgan) bo'lishi kerak.

### VORIS KLASSGA XOS XUSUSIYATLAR VA METODLAR

Hozirgi ko'rinishda `Talaba` va `Shaxs` klasslari o'rtasida hech qanday farq yo'q. Keling `Talaba` klassimizga o'ziga xos xususiyatlar va metodlar yarataylik. Avvalosiga, talabaning bosqichi va ID raqamini xususiyat sifatida qo'shamiz. Bunda ID raqami obyekt yaratilishida parameter sifatida uzatiladi, bosqich esa standart qiymatga ega.

```python
class Talaba(Shaxs):
    """Talaba klassi"""
    def __init__(self, ism, familiya, passport, tyil,idraqam):
        """Talabaning xususiyatlari"""
        super().__init__(ism, familiya, passport, tyil)
        self.idraqam = idraqam
        self.bosqich = 1
```

Endi yangi, Talaba obyektini yaratishda qo'shimcha idraqam parametrini ham kiritish talab qilinadi:

```python
talaba = Talaba("Valijon","Aliyev","FA112299",2000,"0000012")
```

So'ngra, bu qiymatlarni qaytaruvchi alohida metodlar yozamiz:

```python
class Talaba(Shaxs):
    """Talaba klassi"""
    def __init__(self, ism, familiya, passport, tyil,idraqam):
        """Talabaning xususiyatlari"""
        super().__init__(ism, familiya, passport, tyil)
        self.idraqam = idraqam
        self.bosqich = 1
    
    def get_id(self):
        """Talabaning ID raqami"""
        return self.idraqam
    
    def get_bosqich(self):
        """Talabaning o'qish bosqichi"""
        return self.bosqich
```

Metodlarni tekshirib ko'ramiz:

```python
>>>print(f"{talaba.get_info()}. ID raqami:{talaba.get_id()}")
Valijon Aliyev. Passport:FA112299, 2000-yilda tug`ilgan. ID raqami:0000012
>>>print(f"{talaba.get_bosqich()}-bosqich talabasi")
1-bosqich talabasi
```

Shu zayilda yangi klassimizga istalgancha yangi xususiyatlar va metodlar qo'shishimiz mumkin. Bunda, agar yangi xususiyat yoki metod super klassga ham aloqador bo'lsa uni birdan super klassga qo'shish tavsiya qilinadi.

Voris klass boshqa klass uchun super klass bo'lishi mumkin.

## POLIMORFIZM — SUPER KLASS METODLARINI QAYTA YOZISH

Voris klassga super klassdan meros qolgan istalgan metodni qayta talqin qilish mumkin. Avvalgi misolimizdagi `get_info()` super metodini ko'raylik, bu metod talabaning ismi, familiyasi, passport raqami va tug'ilgan yilini qaytaradi:

```python
>>> print(talaba.get_info())
Valijon Aliyev. Passport:FA112299, 2000-yilda tug`ilgan
```

Endi`get_info()` metodi talabaga mos ma'lumotlar qaytarishi uchun, `Talaba` klassi ichida huddi shu nomli metodni qayta yozamiz:

```python
class Talaba(Shaxs):
    """Talaba klassi"""
    def __init__(self,ism,familiya,passport,tyil,idraqam):
        """Talabaning xususiyatlari"""
        super().__init__(ism, familiya, passport, tyil)
        self.idraqam = idraqam
        self.bosqich = 1
    
    def get_id(self):
        """Talabaning ID raqami"""
        return self.idraqam
    
    def get_bosqich(self):
        """Talabaning o'qish bosqichi"""
        return self.bosqich
    
    def get_info(self):
        """Talaba haqida ma'lumot"""
        info = f"{self.ism} {self.familiya}. "
        info += f"{self.get_bosqich()}-bosqich. ID raqami: {self.idraqam}"
        return info
```

Metodni tekshirib ko'ramiz:

```python
>>> print(talaba.get_info())
Valijon Aliyev. 1-bosqich. ID raqami: 0000012
```

## OBYEKT ICHIDA OBYEKT

Ba'zida klassimiz xususiyatlar va ular bilan ishlaydigan metodlarga to'lib ketishi, bu esa o'z navbatida obyektga murojat qilishni qiyinlashitirishi mumkin. Shunday holatlarda ba'zi xususiyatlarni alohida klass ko'rinishida yozish va keyinchalik bu klassdan yaratilgan obyektni boshqa obyektning xususiyati sifatida foydalanish mumkin.

Misol uchun, yuqoridagi `Shaxs` klassimizga yana bir `manzil` degan xususiyat qo'shaylik. Odatda manzil bir nechta qismlardan iborat bo'ladi (xonadon, ko'cha, mahalla, tuman/shahar, viloyat, indeks va hokazo) va ularning har biri uchun `Shaxs` ichida alohida xususiyat yaratmasdan, alohida `manzil` degan klassga yuklash maqsadga muvofiq bo'ladi.&#x20;

```python
class Manzil:
    """Manzil saqlash uchun klass"""
    def __init__(self,uy,kocha,tuman,viloyat):
        """Manzil xususiyatlari"""
        self.uy = uy
        self.kocha = kocha
        self.tuman = tuman
        self.viloyat = viloyat
    
    def get_manzil(self):
        """Manzilni ko'rish"""
        manzil = f"{self.viloyat} viloyati, {self.tuman} tumani, "
        manzil += f"{self.kocha} ko'chasi, {self.uy}-uy"
        return manzil
```

`Talaba` klassimizga ham qo'shimcha `manzil` xususiyatini qo'shamiz:

```python
class Talaba(Shaxs):
    """Talaba klassi"""
    def __init__(self,ism,familiya,passport,tyil,idraqam,manzil):
        """Talabaning xususiyatlari"""
        super().__init__(ism, familiya, passport, tyil)
        self.idraqam = idraqam
        self.bosqich = 1
        self.manzil = manzil
    
    def get_id(self):
        """Talabaning ID raqami"""
        return self.idraqam
    
    def get_bosqich(self):
        """Talabaning o'qish bosqichi"""
        return self.bosqich
    
    def get_info(self):
        """Talaba haqida ma'lumot"""
        info = f"{self.ism} {self.familiya}. "
        info += f"{self.get_bosqich()}-bosqich. ID raqami: {self.idraqam}"
        return info
```

Keling endi talaba obyektini qayta yaratamiz. Bu safar talabaning manzili ham alohida obyekt sifatida `talaba` ga uzatiladi:

```python
talaba_manzil = Manzil(12,'Olmazor',"Bog'bon","Samarqand")
talaba = Talaba("Valijon","Aliyev","FA112299",2000,"0000012",talaba_manzil)
```

Obyekt ichidagi obyektning xususiyatlari va metodlariga ham avvalgidek nuqta orqali murojat qilishimiz mumkin:

```python
>>> print(talaba.manzil.get_manzil())
Samarqand viloyati, Bog'bon tumani, Olmazor ko'chasi, 12-uy
>>> print(talaba.manzil.tuman)
Bog'bon
```

## AMALIYOT

* Talaba klassiga yana bir, fanlar degan xususiyat qo'shing. Bu xususiyat parametr sifatida uzatilmasin va obyekt yaratilganida bo'sh ro'yxatdan iborat bo'lsin (`self.fanlar=[]`)
* Fan degan yangi klass yarating va bu klassdan turli fanlar uchun alohida obyektlar yarating.
* Talaba klassiga `fanga_yozil()` degan yangi metod yozing. Bu metod parametr sifatida Fan klassiga tegishli obyektlarni qabul qilib olsin va talabaning fanlar ro'yxatiga qo'shib qo'ysin.
* Talabaning fanlari ro'yxatidan biror fanni o'chirib tashlash uchun `remove_fan()` metodini yozing. Agar bu metodga ro'yxatda yo'q fan uzatilsa "Siz bu fanga yozilmagansiz" xabarini qaytarsin.
* Yuqoridagi Shaxs klassidan boshqa turli voris klasslar yaratib ko'ring (masalan Professor, Foydalanuvchi, Sotuvchi, Mijoz va hokazo)
* Har bir klassga o'ziga hoz xususiyatlar va metodlar yuklang.
* Barcha yangi klasslar uchun `get_info()` metodini qayta yozib chiqing.
* Voris klasslardan yana boshqa voris klass yaratib ko'ring. Misol uchun Foydalanuvchi klassidan Admin klassini yarating.&#x20;
* Admin klassiga foydalanuvchida yo'q yangi metodlar yozing, masalan, `ban_user()` metodi konsolga "Foydalanuvchi bloklandi" degan matn chiqarsin.

## KODLAR

---''',
    vocabularyRaw: '''superclass	Ota klass (voris veruvchi sinf)	class Shaxs:
subclass	Voris klass (qabul qilib oluvchi sinf)	class Talaba(Shaxs):
super()	Ota klass metodlariga murojaat qilish	super().__init__()''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Shaxs klassidan voris olgan Talaba klassini e\'lon qiling.''',
        answer: '''class Talaba(Shaxs):''',
      ),
      Exercise(
        number: 2,
        question: '''Voris klass ichidan ota klass konstruktorini chaqiruvchi funksiya?''',
        answer: '''super()''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 31,
    title: '''OOP: Inkapsulyatsiya (Encapsulation)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/oop/31-encapsulation.md).

## INKAPSULYATSIYA

Obyektga Yo'naltirilgan Dasturlashning tamoyillaridan biri bu inkapsulyatsiya, ya'ni obyektning xususiyatlarga to'g'ridan-to'g'ri (nuqta orqali) murojat qilishni va ularning qiymatini o'zgartirishni taqiqlab qo'yish. Pythonda bunday yopiq xususiyatlarning nomi ikki pastki chiziq bilan boshlanadi:

```python
from uuid import uuid4
class Avto:
    """Avtomobil klassi"""
    def __init__(self,make,model,rang,yil,narh,km=0):
        """Avtomobilning xususiyatlari"""
        self.make = make
        self.model = model
        self.rang = rang
        self.yil = yil
        self.narh = narh
        self.__km = km
        self.__id = uuid4()
    
    def get_km(self):
        return self.__km
    
    def get_id(self):
        return self.__id
```

Yuqoridagi kodimizning 11-qatorida `__km` xususiyati avtomobilning necha km yurgani haqida ma'lumot saqlaydi va bu ma'lumotni tashqaridan o'zgartirib bo'lmaydi. Kodimizning 12-qatorida esa har bir yangi yaratilgan avtomobilga yangi, noyob va takrorlanmas ID generasiya qilish uchun uuid4() funksiyasidan foydalanayapmiz. Deylik biz mashinalar sotish uchun onlayn bozor yaratsak, bozorimizga qo'shilgan har bir moshina endi o'zining ID raqamiga ega bo'ladi va bu ID raqamni to'g'ridan-to'g'ri (nuqta orqali) ko'rib bo'lmaydi.

```python
avto1 = Avto("GM","Malibu","Qora",2020,40000,100000)
avto1.__km
```

&#x20;Natija: `AttributeError: 'Avto' object has no attribute '__km'`

Yopiq xususiyatlarni ko'rish uchun esa alohida metodlar yozish maqsadga muvofiq bo'ladi (`get_km()` va `get_id()`):

```python
print(f"ID: {avto1.get_id()}")
```

Natija: ID: `1d4f39a4-3222-4682-9231-6275ca5e1bff`

Bunday yopiq xususiyatlarni o'zgartirish ham metodlar orqali amalga oshirilishi kerak. Misol uchun mashinaning necha km yurganini o'zgartirish uchun klassimizga quyidagi metodni qo'shamiz:

```python
    def add_km(self,km):
        """Mashinaning km ga yana km qo'shish"""
        if km>=0:
            self.__km += km
        else:
            print("Mashina km kamaytirib bo'lmaydi")
```

```python
avto1.add_km(1500)
print(avto1.get_km())
```

Natija: `101500`

Inkapsulyatsiyaning maqsadi obyektning ma'lum xususiyatlarini tashqi ta'sirdan himoya qilish. Misol uchun yuqoridagi misolimizda mashinaning qancha yurganini faqat musbat tarafga o'zgartirish mumkin, noyob ID raqamini esa umuman o'zgartirib bo'lmaydi.

## KLASSNING XUSUSIYATLARI VA METODLARI

Avvalgi darslarimizda biror klassdan yaratilgan har bir obyektning xususiyatlarini klass ichidagi`def __init__()` medoti yordamida berayotgan edik. Bu metod qanday ishlaydi? Biz har gal klassga murojat qilganimizda klass aynan shu `__init__`metodini ishga tushiradi va biz bergan xususiyatlar bilan yangi obyekt yaratadi.

Pythonda xususiyatlarni nafaqat obyektga balki to'g'ridan-to'g'ri klassga ham yuklash imkoniyati mavjud. Bunda klassning xususiyatiga berilgan qiymat barcha obyektlar uchun umumiy bo'ladi. Bu xususiyatni bir obyekt orqali o'zgartirilganda shu klassga oid barcha obyektlarda ham uning qiymati o'zgaradi.

Klassga oid xususiyatlar `def __init__()` metodidan avval e'lon qilinadi.

Keling tushunarli bo'lishi uchun quyidagi misolni ko'ramiz:

```python
class Avto:
    """Avtomobil klassi"""
    num_avto = 0
    def __init__(self,make,model,rang,yil,narh,km=0):
        """Avtomobilning xususiyatlari"""
        self.make = make
        self.model = model
        self.rang = rang
        self.yil = yil
        self.narh = narh
        self.__km = km
        self.__id = uuid4()
        Avto.num_avto += 1
```

&#x20; Kodni tahlil qilamiz:

* 1-qatroda Avto klassini e'lo qildik
* 3-qatorda Avto klassiga oid bo'lgan xususiyat `num_avto` yaratdik va unga 0 qiymatini berdik
* Keyingi qatorlarda `__init__` metodi yordamida klassdan yaratiladigan obyektlarning xususiyatlarini e'lon qildik va har gal bu metdoga murojat qilingandan `num_avto` ning qiymatini `1` ga oshradigan qilib qo'ydik (13-qator).

Yuqoridagi usul bilan endi biz dastur davomida Avto klassidan jami nechta obyektlar yaratilganini kuzatib borishimiz mumkin bo'ladi. Bunda num\_avto o'zgaruvchisiga istalgan obyekt orqali yoki klass nomi orqali murojat qilish mumkin:

```python
avto1 = Avto("GM","Malibu","Qora",2020,40000)
avto2 = Avto("GM","Lacetti","Oq",2020,20000)
print(avto1.num_avto)
```

Natija: `2`

```python
avto3 = Avto("Toyota",'Carolla',"Silver",2018, 45000)
print(Avto.num_avto)
```

&#x20; Natija: `3`

### KLASSNING XUSUSIYATLARINI INKAPSULYATSIYA QILISH

Klassga oid xususiyatlar ham huddi yuoqridagi kabi nomidan avval ikki pastki chiziq qo'shish bilan inkapsulyatsiya qilinadi:

```python
class Avto:
    """Avtomobil klassi"""
    __num_avto = 0 # klassga oid xususiyat
    def __init__(self,make,model,rang,yil,narh):
        """Avtomobilning xususiyatlari"""
        self.make = make
        self.model = model
        self.rang = rang
        self.yil = yil
        self.narh = narh
        Avto.__num_avto += 1
```

### KLASSGA OID METODLAR

Klasslarning o'ziga xos metodlari ham bo'lishi mumkin. Misol uchun yuqoridagi num\_avto xususiyatini ko'rish uchun alohida metod yozishimiz mumkin. Klassga oid metodlar @classmethod dekoratori bilan boshlanadi va obyektga oid metodlardan farqli ravishda *`self`* emas *`cls`* (class) argumentini qabul qiladi.

```python
class Avto:
    """Avtomobil klassi"""
    __num_avto = 0
    def __init__(self,make,model,rang,yil,narh,km=0):
        """Avtomobilning xususiyatlari"""
        self.make = make
        self.model = model
        self.rang = rang
        self.yil = yil
        self.narh = narh
        self.__km = km
        self.__id = uuid4()
        Avto.__num_avto += 1
    
    @classmethod
    def get_num_avto(cls):
        return cls.__num_avto
```

Klass metodlarga klassning nomi orqali murojat qilinadi:

```python
avto1 = Avto("GM","Malibu","Qora",2020,40000)
avto2 = Avto("GM","Lacetti","Oq",2020,20000)
avto3 = Avto("Toyota",'Carolla',"Silver",2018, 45000)
print(Avto.get_num_avto())
```

Natija: `3`

`@classmethod` bu maxsus dekorator. Dekoratorlar bu o'z ichiga funksiya oluvchi funksiyalar. Dekoratorlar haqida keyingi darslarimizning birida batafsil to'xtalamiz.

## KLASSLARNI MODULGA AJRATISH

Vaqt o'tishi bilan dasturimizda klasslar ko'payib borishi tabiiy. Bizning asosiy dasturimiz uzun va chigal bo'lmasligi uchun klasslarni ham huddi funksiyalar kabi alohida modullarga ajratish maqsadga muvofiq bo'ladi. Dastur davomida kerak bo'ladigan klasslarga esa modulni chaqirish (import) orqali murojat qilishimiz mumkin. Bunda, bir-biriga bog'liq klasslarni bitta faylga joylashimiz mumkin.&#x20;

Misol uchun, biz `Talaba`, `Professor`, `Foydalanuvchi` va `Shaxs` degan klasslarni bitta `odamlar.py` moduliga, `Avto`, `Bus`, `Train` degan klasslarni esa boshqa `transport.py` moduliga joyladik. Kelajakda biz bu klasslarga import orqali murjat qilishimiz mumkin.

### BITTA KLASSNI IMPORT QILISH

Moduldan bitta klass import qilish uchun `from`` `**`modul`**` ``import`` `**`klass`** ifodasidan foydalanamiz:

```python
from odamlar import Talaba
from transport import Avto

talaba = Talaba("Alijon","Valiyev","FA010101","N00022")
avto = Avto("GM","Malibu","Qora",2020,40000)
```

### BIR NECHTA KLASSLARNI IMPORT QILISH

Moduldan bir nechta klass chaqirish talab qilinsa, `import` so'zidan so'ng klasslar ketma-ket vergul bilan ajratib yoziladi:

```python
from odamlar import Talab, Shaxs

talaba = Talaba("Alijon","Valiyev","FA010101","N00022")
shaxs = Shaxs("Hasan","Husanov","FB0011223")
```

### MODULNI O'ZINI CHAQIRISH

Modulni to'liq import qilish uchun `import modul` ifodasidan foydalanamiz. Bunda modul ichidagi klasslarga modul nomi va nuqta orqali murojat qilinadi:

```python
import odamlar
talaba = odamlar.Talaba("Alijon","Valiyev","FA010101","N00022")
shaxs = odamlar.Shaxs("Hasan","Husanov","FB0011223")
```

### MODULDAGI BARCHA KLASSLARNI IMPORT QILISH

Moduldagi barcha klasslar quyidagicha import qilinadi: `from modul import *`. Bunda modul ichidagi istalgan klassga to'g'ridan-to'g'ri uning nomi bilan murojat qilinadi.&#x20;

```python
from odamlar import *
talaba = Talaba("Alijon","Valiyev","FA010101","N00022")
shaxs = Shaxs("Hasan","Husanov","FB0011223")
```

Bu usul 2 sababga ko'ra tavsiya qilinmaydi:

1. Dasturni kelajakda qayta ochganimizda, dastur davomida moduldagi aynan qaysi klasslardan foydalanganimizni bir qarashda bilib bo'lmaydi
2. Agar modul juda katta bo'lsa, uning ichidagi ba'zi klasslar biz o'zimiz yaratgan klasslar bilan nomi bir hil bo'lib qolish ehtimoli bor. Bu esa o'z navbatida dastrumiz xato ishlashiga olib keladi.

Modul ichiga boshqa modulni ham import qilish mumkin. Masalan modul ichidagi ba'zi klasslar to'g'ri ishlashi uchun boshqa modul talab qilingan vaqtlarda.

## AMALIYOT

* Avvalgi darslarimizda yaratgan `Shaxs` va `Talaba` klasslariga yopiq xususiyatlar qo'shing va ularning qiymatini ko'rsatuvchi va o'zgartiruvchi metodlar yozing.
* Yuqoridagi klasslarga `talabalar_soni` va `odamlar_soni` degan klassga oid xususiyatlar qo'shing.
* Klassga oid xususiyatlar bilan ishlash uchun maxsus `@classmethod` lar yozing&#x20;

---''',
    vocabularyRaw: '''private	Tashqaridan yashirin atribut	self.__balans
@property	Getter metod yaratish dekoratori	@property
setter	Atribut qiymatini o\'zgartiruvchi metod	@balans.setter''',
    exercises: [
      Exercise(
        number: 1,
        question: '''__narx nomli private atributni aniqlang.''',
        answer: '''self.__narx''',
      ),
      Exercise(
        number: 2,
        question: '''Getter metod yaratish uchun qaysi dekoratordan foydalaniladi?''',
        answer: '''@property''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 32,
    title: '''OOP: Dunder Metodlar''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/oop/32-dunder-metodlar.md).

## MAXSUS METODLAR

Pythonda obyektlar bilan ishlashni yanada qulay qilish uchun bir nechta maxsus metodlar bor. Bu metodlarning nomi ikki pastki chiziq bilan yozilgani uchun, **d**ouble **under**score yoki qisqa qilib dunder metodlar deb ataladi. Dunder metolar yordamida obyektlarga qo'shimcha qulayliklar va vazifalar qo'shishimiz mumkin. Klass yoki obyektga oid dunder metodlar ro'yxatini ko'rish uchun dir() funksiyasidan foydalanamiz:

```python
>>> dir(Avto)
['_Avto__num_avto',
 '__class__',
 '__delattr__',
 '__dict__',
 '__dir__',
 '__doc__',
 '__eq__',
 '__format__',
 '__ge__',
 '__getattribute__',
 '__gt__',
 '__hash__',
 '__init__',
 '__init_subclass__',
 '__le__',
 '__lt__',
 '__module__',
 '__ne__',
 '__new__',
 '__reduce__',
 '__reduce_ex__',
 '__repr__',
 '__setattr__',
 '__sizeof__',
 '__str__',
 '__subclasshook__',
 '__weakref__',
 'make',
 'model',
 'narh',
 'rang',
 'yil']
```

Dunder metodlardan biz `__init__` metodi bilan tanishdik. Bu metod klassdan obyekt yaratishda chaqiriladi va obyektning xususiyatlarini belgilaydi. Ushbu darsimizda esa maxsus metodlarning ba'zilari bilan tanishamiz.

## OBYEKT HAQIDA MA'LUMOT

Obyektga `print()` yoki `str()` orqali murojat qilinganda obyekt haqida tushunarli ma'lumot qaytarish uchun `__repr__`va `__str__` metodlaridan foydalanamiz. Tushunarli bo'lishi uchun avvalgi darsimizdagi `Avto` klassiga qaytamiz:

```python
class Avto:
    __num_avto = 0
    """Avtomobil klassi"""
    def __init__(self,make,model,rang,yil,narh):
        """Avtomobilning xususiyatlari"""
        self.make = make
        self.model = model
        self.rang = rang
        self.yil = yil
        self.narh = narh
        Avto.__num_avto += 1
```

Yuqoridagi klassdan yangi obyekt yaratamiz va obyekt haqida ma'lumot olish uchun `print()` funksiyasini chaqiramiz:

```python
avto1 = Avto("GM","Malibu","Qora",2020,40000)
print(avto1) # obyekt haqida ma'lumot
```

Natija: `<__main__.Avto object at 0x00000238A6DAE0C8>`&#x20;

Qandaydur tushunarsiz ma'lumot. Ekrandagi natijadan biz faqat `avto1` obyektimiz `Avto` klassiga tegishli ekanini ko'ramiz. Qanday qilib shuning o'rniga obyekt haqida tushunarliroq ma'lumot olishimiz mumkin?

Gap shundaki biz har gal obyketga `print()` (yoki `str()` yoki `repr()`) orqali murojat qilganimizda, Python obyket ichida `__str__` yoki `__repr__` metodlariga murojat qiladi. Agar biz bu metodlarni yozmagan bo'lsak, yuqoridagi kabi umumiy ma'lumot qayataradi.&#x20;

Biz ushbu metodlarni yangidan yozib, biz istagan ma'lumotni qayataradian qilishimiz mumkin. Odatda, yuqoridagi ikki metoddan birini yozish kifoya. Odatda, `__repr__` umumiyorq, `__str__` esa batafsilroq ma'lumot olish uchun ishlatiladi.&#x20;

Ikkalasidan birini tanlaganda, `__repr__`metodiga yon bosiladi, sababi bu metod `print()`, `str()` va `repr()` funksiyalarining hammasi bilan ishlaydi. Keling biz ham yuoqirdagi klassimizga`__repr__`metodini qo'shamiz:

```python
class Avto:
    __num_avto = 0
    """Avtomobil klassi"""
    def __init__(self,make,model,rang,yil,narh):
        """Avtomobilning xususiyatlari"""
        self.make = make
        self.model = model
        self.rang = rang
        self.yil = yil
        self.narh = narh
        Avto.__num_avto += 1
    
    def __repr__(self):
        """Obyekt haqida ma'lumot"""
        return f"Avto: {self.rang} {self.make} {self.model}"
```

Qaytadan `print()` funksiyasini chaqiramiz:

```python
avto1 = Avto("GM","Malibu","Qora",2020,40000)
print(avto1)
```

Natija: `Avto: Qora GM Malibu`

Mana endi natijamiz ancha tushunarli ko'rinishda chiqdi.

## OBYEKTLARNI TAQQOSLASH

Taqqoslash operatorlari yordamida biz turli obyektlarni solishtirishimiz mumkin. Taqqoslash natijasi mantiqiy qiymat (`True` yoki `False`) ko'rinishida bo'ladi.&#x20;

```python
x,y = 5,10
print(x>y)
```

Natija: `False`

Keling endi Avto klassidan 2 ta obyekt yaratamiz, va ularni taqqoslab ko'ramiz:

```python
avto1 = Avto("GM","Malibu","Qora",2020,40000)
avto2 = Avto("GM","Lacetti","Oq",2020,20000)
avto1>avto2
```

Natija: `TypeError: '>' not supported between instances of 'Avto' and 'Avto'`

Xatolik. Demak bu ikki obyektni solshtirib bo'lmas ekan.&#x20;

Biz taqqolash operatorlariga murojat qilganimizda, Python obyektlar ichida taqqoslash uchun maxsus metodlarni qidiradi, agar metodlar topilmasa yuqoridagi kabi `TypeError` qaytaradi.&#x20;

Taqqoslash metodlari quyidagilardan iborat:

| Metod              | Operator |
| ------------------ | -------- |
| `x.__lt__(self,y)` | `x<y`    |
| `x.__le__(self,y)` | `x<=y`   |
| `x.__gt__(self,y)` | `x>y`    |
| `x.__ge__(self,y)` | `x>=y`   |
| `x.__eq__(self,y)` | `x==y`   |
| `x.__ne__(self,y)` | `x!=y`   |

Yuqoridagi obyektlardan yarmi uchun metodlar yozishimiz kifoya, misol uchun `__lt__` (x\<y) metodini yozsak, `__gt__` (x>y) metodini yozishimiz shart emas, yoki `__le__` metodi, `__ge__`metodini ham o'z ichiga oladi, va hokazo.

Keling tushunarli bo'lishi uchun Avto klassiga obyektlarni solishtirish uchun metod yozamiz. Deylik, biz obyektlarni **narhi** bo'yicha solishtirmoqchimiz, unda klassimizga quyidagi metodlarni qo'shamiz (klassni to'liq yozmadik, faqat qo'shilgan metodlarni keltiramiz):

```python
    def __eq__(self,boshqa_avto):
        """Tenglik"""
        return self.narh == boshqa_avto.narh
    
    def __lt__(self,boshqa_avto):
        """Kichik"""
        return self.narh<boshqa_avto.narh
    
    def __le__(self,boshqa_avto):
        """Kichik yoki teng"""
        return self.narh<=boshqa_avto.narh
```

Kodimizga e'tibor qilsangiz biz tenglik (`__eq__`) yoki kichiklikni (`__lt__`) tekshirmoqchi bo'lganimizda ikki avtoning aynan narhi bo'yicha solishtiramiz (`self.narh == boshqa_avto.narh`).

Mana endi avtolarni solishtirsak bo'ladi:

```python
avto1 = Avto("GM","Malibu","Qora",2020,40000)
avto2 = Avto("GM","Lacetti","Oq",2020,20000)
print(avto1>avto2)
```

Natija: `False`

```python
avto3 = Avto("Honda","Accord","Oq",2017,40000)
print(avto1==avto3)
```

Natija: `True`

## OBYEKT UZUNLIGI

Pythonda `len()` funksiyasi yordamida turli obyektlarning uzunligini bilishimiz mumkin, misol uchun matn, ro'yxat, lug'at, set va hokazo.

```python
matn = 'hello world'
print(len(matn))
```

Natija: `11`

```python
sonlar = [12, 34, 56, 66]
print(len(sonlar))
```

Natija: `4`

Biz len() funksiyasiga murojat qilganimizda, Python funksiyaga uzatilgan obyektning ichidagi maxsus `__len__` metodiga murojat qiladi. Agar bu metod mavjud bo'lmasa dasturimiz xato qaytaradi.

```python
len(avto1)
```

Natija: `TypeError: object of type 'Avto' has no len()`

Misol uchun, bizning Avto klassimizda bu metod yozilmagan, shuning uchun Python TypeError xatosini qaytardi.

Kelin endi `__len__`metodini qanday ishlatishga ham misol ko'raylik.

Boshlanishiga, yangi, `AvtoSalon` degan klass yaratamiz. Bu klassimiz 2 ta xususiyatga ega: salon nomi (`name`) va salondagi mashinalar (`avtolar`).

```python
class AvtoSalon:
    """Avtosalon klassi"""
    def __init__(self,name):
        self.name = name
        self.avtolar = []

    def __repr__(self):
        return f"{self.name} avtosaloni"
```

Yuqoridagi klassdan yangi obyekt yaratamiz:

```python
salon1 = AvtoSalon("MaxAvto")
print(salon1)
```

Natija: MaxAvto avtosaloni

`AvtoSalon` klassimizga `__repr__`metodini qo'shganimiz uchun natijamiz chiroyli ko'rinishda chiqdi.

Keling endi salonga avtomobil qo'shish uchun yangi `add_avto()` metodini yozamiz. Bu metodimiz Avto klassiga oid obyektlarni qabul qilishi kerak. `add_avto()` ga uaztilgan parametr Avto klassiga tegishli yoki yo'qligini tekshirish uchun maxsus `isinstance()` funksiyasidan foydalanamiz.

Bu funksiya biror obyekt ma'lum klassga tegishli ekanligini tekshirish uchun ishlatiladi:

```python
>>> isinstance("salom",str)
True # "salom" bu str
>>> isinstance(9.5,int)
False # 9.5 int (butun son) emas
>>> isinstance(avto1,Avto)
True # avto1 Avto klassiga tegishli
```

`add_avto()` metodiga qaytamiz:

```python
class AvtoSalon:
    """Avtosalon klassi"""
    def __init__(self,name):
        self.name = name
        self.avtolar = []

    def __repr__(self):
        return f"{self.name} avtosaloni"
    
    def add_avto(self,avto):
        if isinstance(avto,Avto): # agar avto Avto klassidan bo'lsa
            self.avtolar.append(avto)
        else:
            print("Avto obyketini kiriting")
```

Metodimizni tekshirib ko'ramiz:

```python
# Avto obyektlarini yaratamiz
avto1 = Avto("GM","Malibu","Qora",2020,40000)
avto2 = Avto("GM","Lacetti","Oq",2020,20000)
avto3 = Avto("Toyota",'Carolla',"Silver",2018, 45000)

# Yuqoridagi obyektlarni salon1 ga qo'shamiz
for avto in [avto1, avto2, avto3]: 
    salon1.add_avto(avto)
```

Mana navbat `__len__` metodiga. Biz bu metod yordamida `len()` funksiyasi salonimizdagi avtomobillar sonini qaytaradigan qilamiz. Buning uchun yuqoridagi `AvtoSalon` klassiga `__len__` funksiyani ham qo'shamiz va uni obyekt ichidagi avtolar ro'yxatyining uzunligini qaytaradigan qilamiz:

```python
    def __len__(self):
        return len(self.avtolar)
```

Mana endi bizning `AvtoSalon` klassimizga oid obyektlar uchun ham `len()` funksiyasini qo'llasak bo'ladi:

```python
>>> print(len(salon1))
3 # Salonimizda 3 ta moshina bor
```

## OBYEKT ELEMENTLARIGA MUROJAT QILISH

Ba'zi obyektlarning (matn, ro'yxat, lug'at va hokazo) elementlariga alohida murojat qilish mumkin.&#x20;

```python
>>> mevalar = ['olma','anor','uzum']
>>> mevalar[0]
'olma'
```

Bizning salonimizda ham 3 ta avto bor, ularni ko'rish uchun yuqoridagi kabi element raqami orqali murojat qila olamizmi?

```python
salon1[0]
```

Natija: `TypeError: 'AvtoSalon' object is not subscriptable`

Afsuski yo'q. Ko'rib turganingizdek bizning obyektimizga bunday murojat qilib bo'lmas ekan. Obyektimizga bu xususiyatni qo'shish uchun `__getitem__`metodini yozishimiz kerak.

```python
class AvtoSalon:
    """Avtosalon klassi"""
    def __init__(self,name):
        self.name = name
        self.avtolar = []

    def __repr__(self):
        return f"{self.name} avtosaloni"
    
    def __len__(self):
        return len(self.avtolar)
    
    def __getitem__(self,index):
        return self.avtolar[index]
```

Endi `salon1` obyektimizning elementlariga murojat qilinganda `__getitem__`metodi obyekt ichidagi `avtolar` ro'yxatidan ko'rsatilgan element (avtomobilni) qaytaradi.

```python
>>> salon1[0]
Avto: Qora GM Malibu
>>> salon1[1]
Avto: Oq GM Lacetti
>>> salon1[2]
Avto: Silver Toyota Carolla
>>> salon1[:] # barcha elementlarni ko'rish
[Avto: Qora GM Malibu, Avto: Oq GM Lacetti, Avto: Silver Toyota Carolla]
```

Keling obyekt elementlaridan birini o'zgartirib ko'ramiz:

```python
avto4 = Avto("Mazda", "6", 'Qizil',2015,35000)
salon1[0]=avto4
```

Natija: `TypeError: 'AvtoSalon' object does not support item assignment`

Yana xatolik. Gap shundaki `__getitem__` metodi o'z nomi bilan (get) element qaytaruvchi metod. Biror elementni o'zgartirish uchun esa `__setitem__`metodini ham qo'shishimiz kerak. Bu metodimizga murojat qilinganda ham, yangi qiymat Avto klassiga oid ekanligini tekshirib olish maqsadga muvofiq bo'ladi:

```python
    def __setitem__(self,index,value):
        if isinstance(value,Avto):
            self.avtolar[index]=value
```

Qaytadan elementni o'zgartirishga harakat qilib ko'ramiz:

```python
avto4 = Avto("Mazda", "6", 'Qizil',2015,35000)
salon1[0]=avto4
print(salon1[0])
```

Natija: `Avto: Qizil Mazda 6`

Kutilgan natija chiqdi

## OPERATORLARNI QAYTA TALQIN QILISH (OVERLOADING)

Pythonda obyektlar o'rtasida turli arifmetik amallarni bajarish mumkin va bu amallar obyektning turiga qarab, Pytnon tomonidan turlicha talqin qilinadi. Masalan:

Sonlar:

```python
>>> x,y=10,20
>>> x+y
30
>>> x*5
50
```

Matnlar:

```python
>>> t1 = "hello"
>>> t2 = "world"
>>> t1+t2
'helloworld'
>>> t1*5
'hellohellohellohellohello'
```

Ro'yxatlar:

```python
>>> l1 = [1, 2, 3]
>>> l2 = [4, 5, 6]
>>> l1+l2
[1, 2, 3, 4, 5, 6]
>>> l1*2
[1, 2, 3, 1, 2, 3]
```

va hokazo.

Keling, bu amallarni bizning obyektimizga ham qo'llab ko'ramiz. Boshlanishiga 2 ta avtosalon yarataylik, va har biriga alohida avtolar qo'shaylik. Ishimizni osonlashtirish uchun `add_avto()` metodimizni ham istalgancha parametr qabul qilishga moslab o'zgartiramiz:

```python
class AvtoSalon:
    """Avtosalon klassi"""
    def __init__(self,name):
        self.name = name
        self.avtolar = []

    def __repr__(self):
        return f"{self.name} avtosaloni"
    
    def __len__(self):
        return len(self.avtolar)

    def __getitem__(self,index):
        return self.avtolar[index]
    
    def __setitem__(self,index,value):
        if isinstance(value,Avto):
            self.avtolar[index]=value
    
    def add_avto(self,*qiymat):
        for avto in qiymat: 
            if isinstance(avto,Avto):
                self.avtolar.append(avto)
            else:
                print("Avto obyketini kiriting")
```

Obyektlarni yaratamiz:

```python
salon1 = AvtoSalon("MaxAvto")
salon2 = AvtoSalon("Avto Lider")
```

```python
avto1 = Avto("GM","Malibu","Qora",2020,40000)
avto2 = Avto("GM","Lacetti","Oq",2020,20000)
avto3 = Avto("Toyota",'Carolla',"Silver",2018, 45000)
avto4 = Avto("Mazda", "6", 'Qizil',2015,35000)
avto5 = Avto("Volkswagen","Polo",'Qora',2015,30000)
avto6 = Avto("Honda","Accord","Oq",2017,42000)
```

```python
salon1.add_avto(avto1, avto2, avto3)
salon2.add_avto(avto4, avto5, avto6)
```

Mavzuga qaytamiz. Operatorlarni qayta talqin qilish. Keling boshlanishiga ikki obyektni qo'shib ko'ramiz:

```python
salon1+salon2
```

Natija: `TypeError: unsupported operand type(s) for +: 'AvtoSalon' and 'AvtoSalon'`

Demak, bu ikki obyektni qo'shib bo'lmas ekan. Biz obyekt egasi sifatida qo'shish operatorini o'zimiz istagancha talqin qilishimiz mumkin. Misol uchun AvtoSalon obyektiga boshqa AvtoSalon obyektini qo'shganda, yangi AvtoSalon obyektini qaytaraylik va bu yangi obyekt avvalgi ikki obyektning avtolariga ega bo'lsin.&#x20;

Qo'shish operatorini qayta talqin qilish uchun AvtoSalon klassimizga `__add__` metodini qo'shamiz.

```python
    def __add__(self,qiymat):
        if isinstance(qiymat,AvtoSalon):
            yangi_salon =  AvtoSalon(f"{self.name} {qiymat.name}")
            yangi_salon.avtolar = self.avtolar + qiymat.avtolar
            return yangi_salon
```

Qo'shish operatorini tekshirib ko'ramiz:

```python
>>> salon3 = salon1+salon2
>>> print(salon3)
MaxAvto Avto Lider avtosaloni
>>> salon3[:]
[Avto: Qora GM Malibu,
 Avto: Oq GM Lacetti,
 Avto: Silver Toyota Carolla,
 Avto: Qizil Mazda 6,
 Avto: Qora Volkswagen Polo,
 Avto: Oq Honda Accord]
```

Istasak, qo'shish operatori yordamida salonga yangi Avto qo'shish imkoniyatini ham yaratishimiz mumkin:

```python
    def __add__(self,qiymat):
        if isinstance(qiymat,AvtoSalon):
            yangi_salon =  AvtoSalon(f"{self.name} {qiymat.name}")
            yangi_salon.avtolar = self.avtolar + qiymat.avtolar
            return yangi_salon
        elif isinstance(qiymat,Avto):
            self.add_avto(qiymat)
        else:
            print(f"AvtoSalon ga {type(qiymat)} qo`shib bo`lmaydi")
```

Tekshirib ko'ramiz:

```python
avto7 = Avto("BMW", 'X7','Qora',2015,75000)
salon1 + avto7
print(salon1[:])
```

Natija: \[Avto: Qora GM Malibu, Avto: Oq GM Lacetti, Avto: Silver Toyota Carolla, Avto: Qora BMW X7]

Huddi shu kabi boshqa operatorlarni ham o'zingiz istalgancha talqin qilishingiz mumkin:

| Operator     | Metod     |
| ------------ | --------- |
| Qo'shish     | `__add__` |
| Ayirish      | `__sub__` |
| Ko'paytirish | `__mul__` |
| Daraja       | `__pow__` |
| Bo'lish      | `__div__` |

## OBYEKTNI CHAQIRISH

Obyektlarni huddi funksiyalarni chaqirgandek chaqirish ham mumkin. Odatda biror funksiyaga murojat qilganda funksiya nomidan so'ng qavslar ochiladi va yopiladi. Agar funksiya argument qabul qilsa, ular qavs ichida beriladi.&#x20;

```python
>>> print(10)
10
>>> len("salom")
5
```

Biz obyektimizga ham shunday imkoniyat qo'shishimiz mumkin. Buning uchun maxsus `__call__` metodidan foydalaniladi.

### PARAMETRSIZ CHAQIRISH

Misol uchun, kelign yuqoridagi `AvtoSalon` klassiga oid obyektlar chaqirilganda salondagi avtomobillar ro'yxatini ko'rsatadigan qilaylik. Buning uchu `AvtoSalon` klassiga quyidagi metodni qo'shamiz:

```python
    def __call__(self):
        return [avto for avto in self.avtolar]
```

Mana endi obyekt chaqirib ko'ramiz:

```python
salon1()
```

Natija: `[Avto: GM Malibu. 40000\$,
 Avto: GM Lacetti. 20000\$,
 Avto: Toyota Carolla. 45000\$]`

### PARAMETR BILAN CHAQIRISH

Yuqorida salon1 ni parametrsiz chaqrishini ko'rdik. Keling endi parametr bilan chaqirishni ham yo'lga qo'yaylik. Bunda, yuborilgan parametr yangi avto obyekti bo'lsin, va bu parametr salondagi avtolar ro'yxatiga qo'shilsin. Metodimizni quyidagicha o'zgartiramiz:

```python
    def __call__(self,*param):
        if param: # agar parametr bo'lsa
            for avto in param:
                self.add_avto(avto)
        else: # agar parametr bo'lmasa
            return [avto for avto in self.avtolar]
```

Endi bizning klassimizga ham parametr bilan, ham parametrsiz chaqirish imkoniyati qo'shildi.

```python
avto_new = Avto("Mercedes-Benz", 'E200','Silver',2015,80000)
salon1(avto_new) # Yangi avto qo'shamiz
salon1() # salondagi mashinalarni ko'ramiz
```

Natija: `[Avto: GM Malibu. 40000\$, Avto: GM Lacetti. 20000\$, Avto: Toyota Carolla. 45000\$, Avto: Mercedes-Benz E200. 80000\$]`

`__call__` metodini qanday talqin qilish ham sizning ihtiyoringizda.

## SO'NGSO'Z

Ushbu bo'limda biz maxsus metodlarning ba'zilari bilan tanishdik. Bu metodlarning qulayligi shundaki, siz ularni istalgacha talqin qilishingiz va har bir obyekt uchun mos keladigan qilib yaratishingiz mumkin. Ko'rib turganingizdek dunder metodlar obyektingizning imkoniyatlarini kengaytiradi va ularga qo'shimcha vazifalar yuklaydi.

## AMALIYOT

* Avvalga darslarda yaratilgan obyektlarga (`Shaxs`, `Talaba`) turli dunder metodlarni qo'shishni mashq qiling.&#x20;
  * Obyekt haqida ma'lumot (`__rerp__`)
  * Talabalarni bosqichi bo'yicha solishtirish (`__lt__`,`__eg__` va hokazo)
* Fan degan yangi klass yarating. Fan obyetklari tarkibida shu fanga yozilgan talabalarning ro'yxati saqlansin. Buning uchun Fanga add\_student(), `__getitem__`, `__setitem__`, `__len__` kabi metodlarni qo'shing.
* Fanga qo'shish `+` operatori yordamida talaba qo'shish metodini yozing
* Minus (`-`) operatori yordamida fandan talaba olib tashlash metodini yozing (bunda talabaning passport raqami yoki ID raqami bo'yicha topib, olib tashlash mumkin)
* Fan obyektlarini chaqiriladigan qiling (masalan, `fizika()`, yoki `fizika(talaba1)`). Bu metodlarni o'zingiz istagandek talqin qiling.

## KODLAR

### GitHub

### Repl.it

---''',
    vocabularyRaw: '''__str__	Matnli ta\'rif qaytaruvchi dunder metod	def __str__(self):
__len__	O\'lcham qaytaruvchi dunder metod	def __len__(self):
__add__	Qo\'shish (+) amali uchun dunder metod	def __add__(self, other):''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Obyektning print() qilingandagi ko\'rinishini sozlovchi dunder metod?''',
        answer: '''__str__''',
      ),
      Exercise(
        number: 2,
        question: '''len() funksiyasi javobini boshqaruvchi dunder metod?''',
        answer: '''__len__''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 33,
    title: '''Fayllar Bilan Ishlash (open)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/files-exceptions/33-files.md).

## KIRISH

Ushbu bo'limda katta hajmdagi ma'lumotlarni fayldan yuklab olish va dastur yakunida kerakli ma'lumotlarni va dastur natijasini faylga saqlashni o'rganamiz. Fayllar bilan ishlash dastur foydalanuvchilariga ham dasturga o'zlari istagan ma'lumotlarni yuklash imkoniyatini beradi.

## FAYLDAN O'QISH

Kompyuterimizda aksar ma'lumotlar fayl ko'rinishida saqlanadi. Bu xoh matn bo'lsin, xoh jadval, xoh rasm, xoh video. Fayllarda turli ma'lumotlar saqlanishi mumkin, ob-havo ma'lumotlari, yillik hisobotlar, mijozlarning telefon raqamlari, talabalarning baholari va hokazo.&#x20;

Ko'pgina holatlarda dastur davomida katta ma'lumotlarni aynan fayllardan o'qib olish talab qilinadi. Ayniqsa, tahliliy dasturlarda fayl ko'rinishida saqlangan, katta hajmdagi jadvallar bilan ishlash tabiiy. Lekin fayllar bilan ishlash boshqa holatlarda ham ko'p asqotadi, misol uchun oddiy matnni html ko'rinishga o'tkazishni avtomatlashtiruvchi dastur yozishda.

Fayllar bilan ishlashning birinchi qadami bu fayldagi ma'lumotlarni kompyuter xotirasiga ko'chirish. Buning bir necha usuli bor, quyida ular bilan tanishamiz.

## FAYLNI TO'LIQLIGACHA O'QISH

Boshlanishiga bizga fayl kerak. Keling, yangi `pi.txt` faylini yaratamiz, va ichiga quyidagi matnni joylaymiz:

```
3.1415926535
8979323846
2643383279
```

pi.txt faylini yuklab oling

Uch qatordan iborat faylimiz \$\$\pi\$\$ sonining qiymatini saqlaydi (30 xona aniqlik bilan).

Fayli to'lqi o'qish uchun quyidagi kodni yozamiz:

```python
with open('pi.txt') as fayl:
    pi = fayl.read()
```

Kodni tahlil qilamiz:

* Birinchi qatorda `open()` funksiyasi yordamida faylni ochayapmiz. Bunda funksiyaga argument sifatida fayl nomini berayapmiz. Bu yerda biz ochayotgan fayl va dasturimiz bir papkada bo'lishi muhim.
* `open()` funksiyasi faylni obyekt sifatida qaytaradi, `as` operatori yordamida esa biz obyektimizga `fayl` deb nom berayapmiz.&#x20;
* Ikkinchi qatorda `.read()` metodi yordamida `fayl` obyektining tarkibidan bizga kerakli matnni olib, yangi, `PI` o'zgaruvchisiga yuklayabmiz.
* `with` operatorining vazifasi biz fayl bilan ishlab bo'lganimizdan so'ng faylni yopish. Yuqoridagi misolda, 2-qatordan so'ng Python zudlik bilan faylni yopadi.

Yuqorida ko'rgan usulimiz fayl bilan ishlashning eng xavfsiz usuli. Aslida biz fayllarni to'g'ridan-to'g'ri `fayl=open('pi.txt')` yordamida ochishimiz, fayl bilan ishlab bo'lgandan so'ng esa `fayl.close()` komandasi yordamida faylni yopishimiz ham mumkin edi:

```python
fayl = open('pi.txt')
PI = fayl.read()
print(pi)
fayl.close()
```

Lekin, bu usul xavfli hisoblanadi va tavsiya qilinmaydi. Gap shundaki, `open()` funksiyasi yordamida faylni ochganimizdan keyin, toki `close()` metodini chaqirgunga qadar faylimiz ochiq holatda turadi. Agar, faylni vaqtida yopmasak, yoki fayl yopilmasidan avval dasturimiz to'xtab qolsa fayl tarkibiga ziyon yetishi, ma'lumotlar yo'qotilishi mumkin. Misol uchun, boshqa dasturlarda ham (masalan Microsoft Word) faylni yopmasdan oldin kompyuteringiz o'chib qolsa, yoki dastur behosdan yopilib ketsa faylingizga ziyon yetkani kabi.

Shuning uchun `open()` funksiyasiga with orqali murojat qilganimizda, faylimiz `with` blokining oxirigacha ochiq turadi, va `with` tugashi bilan, fayl ham yopiladi. Demak fayl ustidagi amallarni biz `with` bloki ichida bajarib olishimiz kerak.

Keling endi `pi` ning qiymatini konsilga chiqaramiz:

```python
>>> print(pi)
3.1415926535
8979323846
2643383279
```

Matn faylda qanday saqlangan bo'lsa, huddi shu ko'rinishda konsolga chiqdi. Saqlangan ma'lumot son bo'lsada, fayldan o'qiganimizda qaytgan qiymat matn ko'rinishida bo'ladi. Matnni songa o'tkazish uchun, unga biroz ishlov beramiz:

```python
pi = pi.rstrip() # qator ohiridagi bo'shliqlarni olib tashlaymiz
pi = pi.replace('\n','') # qator tashlash belgisini almashtiramiz
pi = float(pi) # matnni float (o'nlik) songa o'tkazamiz
print(pi)
```

Natija: `3.141592653589793`

**`.replace()`** metodi matn tarkibidagi biror harf yoki belgini boshqa harf yoki belgi bilan almashtirish uchun ishlatiladi.

### PAPKA ICHIDAGI FAYLLARNI OCHISH

Agar siz ochayotgan fayl dasturimiz bilan bir papkada emas, shu papka ichidagi papkada joylashgan boʻlsa, fayl nomidan avval papka nomi yoziladi:

```python
with open('data/pi.txt') as fayl:
    pi = fayl.read()
```

Agar papkalar bir necha qavat boʻlsa, fayl nomini va ungacha boʻlgan papkalarni alohida yozib olgan afzal:

```python
faylnomi = 'data/math/numbers/pi.txt'
with open(faylnomi) as fayl:
    pi = fayl.read()
```

Windowsda papkalar orasida "\\" belgisi ishlatilsada, Pythonda "/" belgisini ishlataveramiz. Agar \ belgisini ishlatishni istasangiz, bu belgini 2 marta yozing: `C:\\python\\darslar\\data`

## FAYLNI QATORMA-QATOR OʻQISH

Baʻzida faylni toʻliqligicha emas, qatorma-qator oʻqish talab qilinishi mumkin. Masalan, faylda talabalrning ismi yoki kundalik ob-havo maʻlumotlari saqlangdanda va hokazo. Bunday hollarda `for` tsiklidan foydalanamiz:

```python
filename = 'data/talabalar.txt'
with open(filename) as file:
    for line in file:
        print(line)
```

Natija:&#x20;

`alijon valiyev`

`hasan olimov`

`rahima muminova`

Qatorlarni ro'yxat ko'rinishida saqlab olish uchun, `.readlines()` metodidan foydalanamiz.

```python
with open(filename) as file:
    talabalar = file.readlines()

print(talabalar)
```

Natija: `['alijon valiyev\n', 'hasan olimov\n', 'rahima muminova\n', 'hamida oqilova']`

E'tibor bering, har bir talaba ismidan so'ng qator tashlah belgisi (`\n`) tushib qolgan. Biz bu belgilarni `.rstrip()` metodi yordamida olib tashlashimiz mumkin:

```python
talabalar = [talaba.rstrip() for talaba in talabalar]
print(talabalar)
```

Natija: `['alijon valiyev', 'hasan olimov', 'rahima muminova', 'hamida oqilova']`

## FAYLGA YOZISH

Ma'lumotlarni saqlashning eng qulay usuli bu faylga yozish. Dasturimiz bajarilishdan to'xtaganidan so'ng, xotiradagi ma'lumotlar o'chib ketishi mumkin, lekin faylga yozilgan ma'lumotlar saqlanib turaveradi. Fayllarni kelajakda qaytdan xotiraga yuklab, dasturimizni to'htagan joyidan davom etishimiz mumkin.&#x20;

Yuqorida biz faylni ochishda `open()` funksiyasidan foydalandik, va yagona argument sifatida fayl nomini berdik. Bunda fayl faqatgina o'qish uchun ochiladi, unga yozib bo'lmaydi. Faylga ma'lumot yozish uchun `open()` funksiyasiga murojat qilishda fayl nomidan tashqari yana bir argument beramiz. Ikkinchi argument faylni aynan nima maqsadda ochishimizni bildiradi. Argumentlar quyidagilardan iborat bo'lishi mumkin:

| Argument | Qoʻllanilishi           | Mazmuni                                                                                                                     |
| -------- | ----------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `'w'`    | `open('file.txt','w')`  | Faylni yozish uchun ochish. Fayl mavjud bo'lmasa yangi fayl yaratiladi. Fayl mavjud bo'lsa tarkibi o'chib ketadi            |
| `'r'`    | `open('file.txt','r')`  | Faylni faqat o'qish uchun ochish (yozib bo'lmaydi)                                                                          |
| `'w+'`   | `open('file.txt','w+')` | Faylni o'qish va yozish uchun ochish. Fayl mavjud bo'lmasa yangi fayl yaratiladi. Fayl mavjud bo'lsa tarkibi o'chib ketadi. |
| `'r+'`   | `open('file.txt','r+')` | Faylni o'qish va yozish uchun ochish.                                                                                       |
| `'a'`    | `open('file.txt','a')`  | Faylga ma'lumot qo'shish uchun ochish. Fayl mavjud bo'lmasa yangi fayl yaratiladi.                                          |
| `'a+'`   | `open('file.txt','a+')` | Faylga ma'lumot qo'shish va o'qish uchun yozish. Fayl mavjud bo'lmasa yangi fayl yaratiladi.                                |

### YANGI FAYLGA YOZISH

Yangi faylga ma'lumot yozish uchun `open()` funksiyasini chaqirishda `'w'` (write) argumentidan foydalanamiz. Ochilgan faylga ma'lumot qo'shish uchun esa `.write()` metodini chaqiramiz.

```python
faylnomi = 'ustozlar.txt'# ochilayotgan (yaratilayotgan) fayl nomi
with open(faylnomi,'w') as fayl:
    fayl.write('anvar narzullaev') # faylga yozilayotgan ma'lumot
```

**Diqqat!!!** `open()` funksiyasini `'w'` argumenti bilan chaqirganimizda ehtiyot bo'lishimiz kerak, sababi agar bunday fayl mavjud bo'lsa, uning ichidagi barcha ma'lumotlar o'chib ketadi.&#x20;

Faylga yozayotgan ma'lumotlarimiz matn ko'rinishida bo'lishi kerak. Aks holda dasturimiz xato beradi.

```python
faylnomi = 'new_file.txt'
ism = 'Olimjon Hasanov'
tyil = 2004
with open(faylnomi,'w') as fayl:
    fayl.write(ism)
    fayl.write(tyil)
```

Natija: **`TypeError`**`: write() argument must be str, not int`

Xatoning oldini olish uchun sonlarni avval `str()` funksiyasi yordamida matnga keltirib olamiz.

```python
faylnomi = 'new_file.txt'
ism = 'Olimjon Hasanov'
tyil = 2004
with open(faylnomi,'w') as fayl:
    fayl.write(ism)
    fayl.write(str(tyil))
```

Fayllar matn formatida yoziladi, va biz ularni istalgan matn muharriri yordamida ochib ko'rishimiz mumkin.

![Faylda saqlangan ma'lumotlar](/files/-MTFWKernfHGeFumH8Sx)

Afsuski, faylga bir nechta ma'lumot yozganimizda, ma'lumotlar alohida qatordan emas, bir qatorda bir-biriga qo'shib qo'shib yoziladi.&#x20;

Buning oldini olishimiz uchun matn so'ngida \n belgisini qo'shib ketishimiz kerak bo'ladi:

```python
faylnomi = 'new_file.txt'
ism = 'Olimjon Hasanov'
tyil = 2004
with open(faylnomi,'w') as fayl:
    fayl.write(ism+'\n')
    fayl.write(str(tyil)+'\n')
```

![Fayldagi ma'lumotlar yangi qatordan saqlandi](/files/-MTFXAxEdeUINPk1sAdl)

### FAYLGA MA'LUMOT QO'SHISH

Agar mavjud faylga ma'lumot qo'shish talab qilinsa, `open()` funksiyasiga murojat qilishda  `'a'` (append) argumentidan foydalanamiz. Bunda yangi qo'shilgan ma'lumotlar faylning oxiriga qo'shiladi.&#x20;

```python
with open(faylnomi,'a') as fayl:
    fayl.write('Alijon Valiyev\n')
    fayl.write('2000')
```

![Faylga yangi ma'lumotlar qo'shildi](/files/-MTFZGwybIE_LdXfluSb)

Agar biz ochayotgan fayl mavjud bo'lmasa, Python yangi fayl yaratadi.

## O'ZGARUVCHILARNI FAYLDA SAQLASH

Yuqorida biz ma'lumotlarni matn ko'rinishida saqlashni ko'rdik. Agar dastur davomida turli o'zgaruvchilarni faylda saqlash talab qilinsa `pickle` modulidan foydalanamiz. Pickle ma'lumotlarni biz qanday ko'rinishda bersak, shunday ko'rinishda faylga yozadi. Yuqoridagi usuldan farqli ravishda, pickle yordamida yozilgan fayllarning tarkibini Pythondan tashqarida ko'rib bo'lmaydi.&#x20;

### PICKLE FAYLGA YOZISH

Pickle dan foydalanish uchun biz avval bu modilni `import` qilamiz. Faylno ochishda esa, open() funksiyasiga ikkinchi argument sifatida `'wb'` (write binary) beramiz, ya'ni ikkilik sanoq tizimida yozishni ko'rsatamiz. Faylga yozish uchun esa `pickle.dump()` metodidan foydalanamiz:

```python
import pickle

talaba1 = {'ism':'hasan', 'familiya':'husanov', 'tyil':2003, 'kurs': 2}
talaba2 = {'ism':'alijon', 'familiya':'valiyev', 'tyil':2004, 'kurs': 1}

with open('info','wb') as file:
    pickle.dump(talaba1,file)
    pickle.dump(talaba2,file)
```

E'tibor bering, yuqorida fayl nomini yozishda uning turini ko'rsatmadik, sababi, avval aytganimizdek bu fayllar Pythondan tashqarida ochilmaydi va biz buning oldini olishimiz kerak. Aslida fayl nomiga .txt qo'shimchasini ham qo'shishimiz mumkin, bu bilan dastur xato ishlamaydi, lekin bu bizni kelajakda chalg'itishi mumkin. Istasangiz faylga .dat (data so'zidan olingan) qo'shimchasini qo'shib qo'yishingiz mumkin (`info.dat`).

### PICKLE FAYLDAN O'QISH

Pickle fayldan o'qish uchun `open()` funksiyasini `'rb'` (read binary) argumenti bilan chaqiramiz. O'zgaruvchilarni bitta faylga yozganimizda, har bir o'zgaruvchi alohida qatordan yoziladi. Fayldan o'qishda ham har bir qatorni alohida o'qishimiz kerak bo'ladi:

```python
with open('info','rb') as file:
    talaba1 = pickle.load(file)
    talaba2 = pickle.load(file)
```

O'zgaruvchilar tarkibini ko'ramiz:

```python
print(talaba1)
```

Natija: `{'ism': 'hasan', 'familiya': 'husanov', 'tyil': 2003, 'kurs': 2}`

```python
print(talaba2)
```

Natija:`{'ism': 'alijon', 'familiya': 'valiyev', 'tyil': 2004, 'kurs': 1}`

Adashib ketmaslik uchun, alohida o'zgaruvchilarni alohida fayllarga saqlash tavsiya qilinadi.

## AMALIYOT

* Bugun o'rgangan narsalaringizni matnga yozing va matnni Python yordamida oching
* Quyidagi `pi_million_digits.txt` faylini yuklab oling (faylda \$\$\pi\$\$  soni nuqtadan so'ng million xona aniqlik bilan yozilgan).&#x20;
* Sizning tug'ilgan kuningiz \$\$\pi\$\$ soni tarkibida uchraydimi yoki yo'q ekanligini aniqlovchi funksiya yozing. Misol uchun, tug'ilgan sanangiz 25 Fevral, 2000-yil bo'lsa, 25022000 ketma-ketligi yuqoridagi matnda uchraydimi yo'q toping.
* Fayl ichidagi matnni float ma'lumot turiga o'tkazing va pickle yordamida yangi faylga saqlang.

Amaliyot uchun fayl

* Foydalanuvchidan turli hil ma'lumotlarni so'rab, har bir kiritilgan ma'lumotni yangi qatordan faylga yozib boruvchi dastur tuzing. Dastur qayta chaqirilganida yangi ma'lumotlar fayl oxiridan qo'shilib borsin (yangi faylga emas).

## JAVOBLAR

### GitHub

### Repl.it

---''',
    vocabularyRaw: '''open()	Faylni ochish funksiyasi	open(\'fayl.txt\', \'r\')
\'w\'	Faylga yangidan yozish rejimi	write mode
\'a\'	Fayl oxiriga ma\'lumot qo\'shish rejimi	append mode
with	Fayl bilan xavfsiz ishlash bloki (auto close)	with open() as f:''',
    exercises: [
      Exercise(
        number: 1,
        question: '''fayl.txt faylini faqat o\'qish (\'r\') rejimida oching.''',
        answer: '''with open(\'fayl.txt\', \'r\') as f:''',
      ),
      Exercise(
        number: 2,
        question: '''Faylga matn yozish funksiyasi nomi nima?''',
        answer: '''write''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 34,
    title: '''JSON Formati''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/files-exceptions/34-json.md).

## JSON NIMA?

JSON (**J**ava**S**cript **O**bject **N**otation) bugungi kunda ma'lumotlarni saqlash va internet orqali uzatish uchun qo'llaniladigan eng mashxur format hisoblanadi. Dastavval JavaScript tili uchun yaratilgan bu format, bugungi kunda deyarli barcha dasturlash tillari tomonidan ishlatiladi. Qolaversa, JSON formatidagi fayllarining tarkibini oddiy matn muharriri yordamida koʻrish va tahrirlash mumkin.

Aksar holatlarda dastur va server orasidagi maʻlumotlar aynan JSON koʻrinishida uzatiladi. Quyidagi rasmda Wikipedia sahifasidan olingan maʻlumot ham JSON formatida berilgan:

![JSON](/files/-MTUQjqW0iyFOjcrXIe4)

Yuqoridagi misolda maʻlumotlar Pythondagi lug'atlar kabi kalit soʻz va qiymat koʻrinishida saqlangan. Lekin, JSON yordamida biz nafaqat lug'at, balki boshqa turdagi ma'lumotlarni ham saqlashimiz mumkin. Bunda Pythondagi ma'lumot turlari, quyidagi jadval asosida, JavaScript ma'lumot turlariga konvertasiya qilinadi:

| Python | JavaScript |
| ------ | ---------- |
| dict   | Object     |
| list   | Array      |
| tuple  | Array      |
| str    | String     |
| int    | Number     |
| float  | Number     |
| True   | true       |
| False  | false      |
| None   | null       |

Demak, dasturimiz davomida maʻlumotlarni JSON ko'rinishida saqlashimiz, internet orqali boshqa foydalanuvchilarga, dasturlarga yoki serverga yuborishimiz, JSON fayllarni Pythonda ochib, unga ishlov berishimiz va turli amallar bajarishimiz mumkin.

JSON o'zgaruvchilar, tarkibidan qat'iy nazar matn ko'rinishida saqlanadi.

## PYTHONDAN JSONGA

JSON maʻlumotlar va fayllar bilan ishlash uchun Pythonda maxsus `json` moduli bor. Demak, dasturimiz boshida biz bu modulni yuklab olishimiz kerak boʻladi (`import json`).&#x20;

Ma'lumotlarni JSON matniga o'tkazish uchun ikki funksiyadan foydalanamiz:&#x20;

* `json.dumps(x)` — berilgan `x` o'zgaruvchini JSON matniga o'zgartiradi
* `json.dump(x,fayl)` — berilgan `x` o'zgaruvchini JSON ga o'zgartirib, ko'rsatilgan `fayl`ga saqlaydi.

### `json.dumps()`

Ma'lumotlarni JSON formatiga o'tkazish uchun `json.dumps()` funksiyasidan foydalanamiz:

```python
import json

x = 10
x_json = json.dumps(x)

ism = "anvar"
ism_json = json.dumps(ism)

sonlar = [12, 45, 23, 67]
sonlar_json = json.dumps(sonlar)
```

JSON ma'lumotlar matn ko'rinishida saqlanadi.

```python
print(type(sonlar_json))
```

Natija: `str`

Yuqoridagi aytganimizdek, ko'p holatlarda JSON ma'lumotlar lug'at ko'rinishda uzatiladi.&#x20;

```python
bemor = {
  "ism": "Alijon Valiyev",
  "yosh": 30,
  "oila": True,
  "farzandlar": ("Ahmad","Bonu"),
  "allergiya": None,
  "dorilar": [
    {"nomi": "Analgin", "miqdori": 0.5},
    {"nomi": "Panadol", "miqdori": 1.2}
  ]
}

bemor_json = json.dumps(bemor)
```

`print()` funksiyasi yordamida JSON tarkibini ko'rishimiz mumkin:

```python
print(bemor_json)
```

Natija: `{"ism": "Alijon Valiyev", "yosh": 30, "oila": true, "farzandlar": ["Ahmad", "Bonu"], "allergiya": null, "dorilar": [{"nomi": "Analgin", "miqdori": 0.5}, {"nomi": "Panadol", "miqdori": 1.2}]}`

Yuqoridagi natija o'qish uchun noqulay ko'rinishda chiqdi. Buni to'g'rilash uchun `dumps()` funksiyasiga qo'shimcha `indent=4` parametrini beramiz. Bu parametr ma'umotlarni saqlashda chapdan qancha joy tashlashni ko'rsatadi:

```python
bemor_json = json.dumps(bemor, indent=4)
print(bemor_json)
```

Natija:

```python
{
    "ism": "Alijon Valiyev",
    "yosh": 30,
    "oila": true,
    "farzandlar": [
        "Ahmad",
        "Bonu"
    ],
    "allergiya": null,
    "dorilar": [
        {
            "nomi": "Analgin",
            "miqdori": 0.5
        },
        {
            "nomi": "Panadol",
            "miqdori": 1.2
        }
    ]
}
```

Ko'rib turganingizdek, natija o'qishga qulay ko'rinishda chiqdi.

Mavzu boshida, JSON ichidagi ma'lumotlar JavaScript ma'lumot turlariga konvertasiya qilinadi dedik. Buni yuqoridagi misolda ham ko'rishimiz mumkin (`farzandlar`, `oila`, `allergiya` kalitlari qiymatini asl lug'at bilan solishtiring).&#x20;

### `json.dump()`

Ma'lumotlarni JSON formatiga o'tkazish va faylga yozish uchun `json.dump()` funksiyasini chaqriamiz. Funksiya parametri sifatida o'zgaruvchi va fayl nomlarini ko'rsatamiz. Albatta buning uchun avval faylni yozish uchun ochgan bo'lishimiz kerak:

```python
bemor = {
  "ism": "Alijon Valiyev",
  "yosh": 30,
  "oila": True,
  "farzandlar": ("Ahmad","Bonu"),
  "allergiya": None,
  "dorilar": [
    {"nomi": "Analgin", "miqdori": 0.5},
    {"nomi": "Panadol", "miqdori": 1.2}
  ]
}

with open('bemor.json','w') as f:
    json.dump(bemor,f)
```

JSON fayl tarkibini istalgan matn muharrirda ochib ko'rishimiz mumkin:

![JSON fayl tarkibi](/files/-MTVC0ye33r6EJWPPle8)

## &#x20;JSONDAN PYTHONGA

JSON formatidagi ma'lumotlarni Pythondagi ma'lumot turiga keltirish uchun `json.loads()` yoki `json.load()` funksiyalaridan foydalanamiz. Yuqoridagi ka'bi, `json.loads()` funksiyasi to'g'ridan-to'g'ri JSON matn bilan ishlasa, `json.load()` funksiyasi JSON fayllarni o'qish uchun ishlatiladi.

### `json.loads()`

Bu funksiya parametr sifatida JSON matn qabul qiladi va Python o'zgaruvchiga o'tkazadi.

```python
sonlar = json.loads(sonlar_json)
bemor = json.loads(bemor_json)
print(bemor)
```

Natija:

`{'ism': 'Alijon Valiyev', 'yosh': 30, 'oila': True, 'farzandlar': ['Ahmad', 'Bonu'], 'allergiya': None, 'dorilar': [{'nomi': 'Analgin', 'miqdori': 0.5}, {'nomi': 'Panadol', 'miqdori': 1.2}]}`

E'tibor qiling, `oila` va `allergiya` kalitlarining qiymati qaytadan Python ma'lumot turlariga qaytdi.

### `json.load()`

Bu funksiya JSON fayllarning tarkibini Pythonga yuklab olish uchun ishlatiladi.&#x20;

```python
filename = 'bemor.json'
with open(filename) as f:
    bemor = json.load(f)
    
print(type(bemor))
```

Natija: `<class 'dict'>`

## JSON BILAN ISHLASH

Ko'pincha internet orqali JSON fayllarni qabul qilganimizda ma'lumotlar bir necha qavatli lug'at ko'rinishida bo'ladi. JSON matnidan aynan o'zimizga kerakli ma'lumotni ajratib olish uchun lug'atni biroz tahlil qilish, uning kalitlari va qiymatlarini topish talab qilinishi mumkin. Bu ayniqsa juda uzun JSON fayllarga tegishli. Shuning uchun JSON bilan samarali ishlash uchun [lug'atlar bilan ishlashni](https://python.sariq.dev/dictionary/15-dictionary-sets) yana bir bor takrorlab oling.

Quyidagi misolda Google Maps hizmati qaytargan JSON matni lug'at ko'rinishida berilgan. Bu Toshkent shahridagi Olmazor tumanining Geografik manzili.&#x20;

```python
{
    "address_components": [
        {
            "long_name": "Almazar District",
            "short_name": "Almazar District",
            "types": [
                "political",
                "sublocality",
                "sublocality_level_1"
            ]
        },
        {
            "long_name": "Tashkent",
            "short_name": "Tashkent",
            "types": [
                "locality",
                "political"
            ]
        },
        {
            "long_name": "Tashkent Region",
            "short_name": "Tashkent Region",
            "types": [
                "administrative_area_level_1",
                "political"
            ]
        },
        {
            "long_name": "Uzbekistan",
            "short_name": "UZ",
            "types": [
                "country",
                "political"
            ]
        }
    ],
    "formatted_address": "Almazar District, Tashkent, Uzbekistan",
    "geometry": {
        "bounds": {
            "northeast": {
                "lat": 41.3954567,
                "lng": 69.269883
            },
            "southwest": {
                "lat": 41.3249733,
                "lng": 69.16497629999999
            }
        },
        "location": {
            "lat": 41.3645355,
            "lng": 69.2281531
        },
        "location_type": "APPROXIMATE",
        "viewport": {
            "northeast": {
                "lat": 41.3954567,
                "lng": 69.269883
            },
            "southwest": {
                "lat": 41.3249733,
                "lng": 69.16497629999999
            }
        }
    },
    "place_id": "ChIJ195FnkeMrjgR3nkapKKdk7A",
    "types": [
        "political",
        "sublocality",
        "sublocality_level_1"
    ]
}
```

Keling shu ma'lumotlar orasidan tumanning geografik koordinatalrini topamiz. Avvalo, lug'atga ko'z yugurtirib chiqib, bizga kerak ma'lumotlar quyidagi ko'rinishda berilganini ko'rishimiz mumkin:

```python
"location": {
            "lat": 41.3645355,
            "lng": 69.2281531
```

Bizga aynan latitude (kenglik) va longitude (uzunlik) qiymatlari kerak. Ular esa "location" kaliti ichidagi lug'atda lat va lng kalitlariga tegishli qiymatlarda joylashgan. location kalitining o'zi ham geometry kaliti ichida joylashganini ko'rishimiz mumkin.

Demak, lu'gat ichidan lat va lng qiymatlarini olish uchun quyidagi kodni yozamiz:

```python
kenglik = data['geometry']['location']['lat']
uzunlik = data['geometry']['location']['lng']
print(f"{kenglik},{uzunlik}")
```

Natija: `41.3645355,69.2281531`

Koordinatalarni Google Mapsga kiritib ko'ramiz va quyidagi natijani olamiz.

![Olmazor tumani](/files/-MTVfoMHazBweHlY7Nfm)

## AMALIYOT

* Ushbu o'zgaruvchini JSON ko'rinishida saqlang va JSON matnini konsolga chiqaring: `data = {"Model" : "Malibu", "Rang" : "Qora", "Yil":2020, "Narh":40000}`
* &#x20;Ushbu JSON matnni ko'chirib oling, va talabaning ismi va familiyasini  konsolga chiqaring: `talaba_json = """{"ism":"Hasan","familiya":"Husanov","tyil":2000}"""`&#x20;
* Yuqoridagi ikki o'zgaruvchini alohida JSON fayllarga saqlang.
* Quyidagi JSON faylni yuklab oling. Faylda 3 ta talabaning ism va familiyasi saqlangan. Ularning har birini alohida qatordan `"Ism Familiya, n-kurs, Fakultet talabasi"` ko'rinishida konsolga chiqaring.

students.json

* Quyidagi bog'lamaga kirsangiz, Wikipediadagi Python dasturlash tili haqidagi maqolani JSON ko'rinishida ko'rishingiz mumkin. Brauzerda chiqqan ma'lumotni JSON ko'rinishida saqlang (brauzerda Ctrl+S tugmasini bosib). Faylni Pythonda oching va konsolga maqolaning sarlavhasi (title) va qisqa matnini (extract) chiqaring: <https://uz.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&titles=Python>

## JAVOBLAR

---''',
    vocabularyRaw: '''json.dumps()	Lug\'atni JSON stringga o\'tkazish	json.dumps(data)
json.loads()	JSON stringni Python lug\'atiga o\'tkazish	json.loads(str)
json.dump()	JSON ma\'lumotni faylga saqlash	json.dump(data, f)''',
    exercises: [
      Exercise(
        number: 1,
        question: '''JSON matnini loads() orqali yuklang.''',
        answer: '''import json
data = json.loads(js_string)''',
      ),
      Exercise(
        number: 2,
        question: '''Lug\'atni JSON matniga (string) o\'tkazuvchi funksiya?''',
        answer: '''dumps''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 35,
    title: '''Xatolar Bilan Ishlash (Try-Except)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/files-exceptions/35-xatolar.md).

## EXCEPTIONS

Avvalgi darslarimizning birida biz "**Run time error"** xatoliklari bilan tanishgan edik. Bunday xatolar dastur bajarish jarayonida kelib chiqadi va dasturning ishlashini to'xtatadi. Sintaks xatolikdan farqli ravishda Python bunday xatolarni dasturni bajarishdan avval aniqlay olmaydi.&#x20;

Ushbu darsimizda qanday qilib mana shunday xatoliklarni jilovlashni o'rganamiz. Maqsadimiz xatolik yuz berganda dastur to'xtab qolishining oldini olish. Gap shundaki, dastur davomida xato yuz berganda Python maxsus *exception* (istisno) obyektini yaratadi. Agar bu obyekt "tutib" olinmasa, dastur bajarilishdan to'xtaydi.&#x20;

## `try-except`

Istisno obyektlarni tutib olish uchun Pythonda maxsus `try-except` operatorlari bor. Bu operatorlar quyidagicha ishlaydi, `try` operatori badanida bajarish kerak bo'lgan kod yoziladi, `except` operatori badanida esa xatolik yuz berganda bajarilishi kerak bo'lgan kod yoziladi. Ya'ni dasturimiz to'xtab qolmasdan bajarilaveradi.&#x20;

Tushunarli bo'lishi uchun quyidagi misolni ko'ramiz.&#x20;

```python
yosh = input("Yoshingizni kiriting: ")
yosh = int(yosh)
print(f"Siz {2021-yosh} yilda tug'ilgansiz")
```

Yuqoridagi misolning 1-qatorida biz foydalanuvchidan yoshini kiritishni so'rayabmiz. Navbatdagi qatorda esa foydalanuvchi kiritgan qiymatni int() yordamida butun songa o'tkazayapmiz. Agar foydalanuvchi yoshini kiritganda, butun emas, o'nlik son kiritsa bu `ValueError` xatoligiga olib keladi, va dastur bajarilishdan to'xtaydi.

![Dastur natijasi](/files/-MToJzk0cla80_3mUgXY)

Keling, yuqoridagi kodni `try-except` yordamida yozamiz:

```python
yosh = input("Yoshingizni kiriting: ")
try:
    yosh = int(yosh)  
    print(f"Siz {2021-yosh} yilda tug'ilgansiz")  
except:
    print("Butun son kiritmadingiz")

print("Dastur Tugadi!")
```

Bu yerda ham dastavval foydalanuvchi yoshini so'radik. `int()` finksiyasini esa `try` badani ichida yozdik, agar foydalanuvchi to'gri qiymat kiritgan bo'lsa kodimiz foydalanuvchi tug'ilgan yilini hisoblab ko'rsatadi, exception (istisno) yuz berganda esa `"Butun son kiritmadingiz"` xabarini konsolga chiqaradi. Lekin dastur bajarilishdan to'xtamaydi, va try-except blokidan keyingi qatorlar ham bajarilaveradi (`print("Dastur Tugadi!")`). Buni quyidagi natijadan ham ko'rishimiz mumkin:

![Dastur natijasi](/files/-MTovaC4ncm2ri6sGgMF)

`try-except` operatorining afzalliklaridan biri, foydalanuvchiga tushunarsiz xatolar o'rniga, o'zimiz istagan, tushunarliroq matnni ko'rsatishimiz mumkin. Shuningdek, kompleks tizimlarda arzimagan xatoni deb dasturimiz to'xtab qolmaydi.

## `try-except-else`

Yuqoridagi kodimizda biz try moduli ichida xato qaytarishi mumkin bo'lgan ifodani ham (`tyil = int(tyil)`), xato qaytmaganda bajarilishi kerak bo'lgan ifodani ham (`print(f"Siz {2021-tyil} yoshdasiz")` ) birdan yozib ketayapmiz. Aslida, bunday qilishimiz to'g'ri emas.&#x20;

To'g'ri usuli, bu avval xatoga tekshirish va xato yuz bermaganda bajariladigan ifodani alohida, `else` blokida yozish:

```python
yosh = input("Yoshingizni kiriting: ")
try:
    yosh = int(yosh)    
except:
    print("Butun son kiritmadingiz")
else:
    print(f"Siz {2021-yosh} yilda tug'ilgansiz")
```

Albatta, yuqoridagi usul har doim ham qo'l kelavermaydi.

## MA'LUM TURDAGI XATOLARNI USHLASH

Xatolarning turlari ko'p, `except` operatori yordamida esa biz aynan qaysi xatolarni ushlamoqchi ekanimizni ham ko'rsatishimiz mumkin. Misol uchun yuqoridagi misolda `int()` funksiyasi `ValueError` xatosini qaytardi. Agar biz faqatgina shu turdagi xatolarni ushlamoqchi bo'lsak, kodimizni quyidagicha o'zgartiramiz:

```python
yosh = input("Yoshingizni kiriting: ")
try:
    yosh = int(yosh)    
except ValueError:
    print("Butun son kiritmadingiz")
else:
    print(f"Siz {2021-yosh} yilda tug'ilgansiz")
```

### `ZeroDivisionError`

Ba'zi dastur davomida arifmetik amallar bajarilishi natijasida 0 ga bo'lish xatoligi (`ZeroDivisionError`) yuzaga kelishi mumkin. Aynan shu xatoni jilovlash uchun, `except ZeroDivisionError` ifodasidan foydalanamiz:

```python
x,y=5,10
try:
   y/(x-5)
except ZeroDivisionError:
    print("0 ga bo'lib bo'lmaydi")
```

Natija: `0 ga bo'lib bo'lmaydi`

### **`IndexError`**

Bu xatolik odatda ro'yxatda mavjud bo'lmagan indeksga murojat qilishda chiqib keladi.

```python
mevalar = ['olma','anor','anjir','uzum']
try:
    print(mevalar[7])
except IndexError:
    print(f"Ro'yxatda {len(mevalar)} ta meva bor xolos")
```

Natija: `Ro'yxatda 4 ta meva bor xolos`

### `KeyError`

Bu xatolik lug'atda mavjud bo'lmagan kalitga murojat qilishda kelib chiqadi:

```python
user = {"username":"sariqdev",
        "status":"admin",
        "email":"admin@sariq.dev",
        "phone":"99897123456"}

key="tel"
try:
    print(f'Foydalanuvchi: {user[key]}')
except KeyError:
    print("Bunday kalit mavjud emas")
```

Natija: `Bunday kalit mavjud emas`

### `FileNotFoundError`

Avvalgi darsimizda fayllar bilan ishlashni o'rgangan edik. Fayllarni biz o'qish (`open(filename,'r')`) yoki yozish (`open(filename,'w')`) uchun ochishimiz mumkin. Agar faylga ma'lumot yozish uchun ochishda, mavjud bo'lmagan faylga murojat qilsak, Python yangi fayl yaratadi. Lekin, faylni o'qish uchun ochishda fayl nomini xato yozsak, yoki mavjud bo'lmagan faylni ochmoqchi bo'lsak `FileNotFoundError` (fayl topilmadi) xatoligi yuzaga keladi.&#x20;

```python
filename = "data.txt" # bunday fayl mavjud emas
with open(filename) as f:
    text = f.read()
```

Natija: `FileNotFoundError: [Errno 2] No such file or directory: 'data.txt'`

Demak, bu xatolikni ham ushlab qolish uchun `except FileNotFoundError` ifodasidan foydalanamiz:

```python
filename = "data.txt" # bunday fayl mavjud emas
try:
    with open(filename) as f:
        text = f.read()
except FileNotFoundError:
    print(f"Kechirasiz, {filename} fayli mavjud emas. Bosh fayl tanlang.")
```

Natija: `Kechirasiz, data.txt fayli mavjud emas. Bosh fayl tanlang.`

Pythonda bundan boshqa xatolar ham ko'p uchraydi, ularning ba'zilari [12-darsda tanishgan edik](https://python.sariq.dev/lirik-chekinish-1/12-xatolar#run-time-error-dasturni-bajarishda-xatolik).

### BIR NECHTA XATOLARNI USHLASH

`try-except` ketma-ketligida bir nechta `except` operatorlari ham bo'lishi mumkin. Ularning har biri ma'lum turdagi xatolik uchun javobgar bo'ladi:

```python
n = input("Butun son kiriting: ")
try:
    n = int(n)
    x=20/n
except ValueError: # agar foydalanuvchi butun son kiritmasa
    print("Butun son kiritmadingiz")
except ZeroDivisionError: # agar foydalanuvchi 0 kiritsa
    print("0 ga bo'lib bo'lmaydi")
else:
print(f"x={x}")
```

## XATOLARNI KO'RSATMAY O'TISH

Yuqoridagi misollarda kodimiz xato qaytarganda, dasturimiz foydalanuvchiga qandaydur ma'lumotni ko'rsatayapti:

```python
import json
files = ['talaba1.json','talaba2.json','talaba3.json','talaba4.json']
for filename in files:
    try:
        with open(filename) as f:
            talaba = json.load(f)        
    except FileNotFoundError:
        print(f"{filename} mavjud emas")
    else:
        print(talaba['ism'])
        # fayl ustida turli amallar 
```

![Natija](/files/-MTp6A2yKuk-nqoBO5xC)

Hech qanday ma'lumot ko'rsatmay, dasturni davom etish uchun `pass` operatoridan foydalanamiz. Odatda `pass` operatoridan funksiyalar yoki operatorlarning badanini "to'ldirib" ketish uchun ishlatiladi. Ya'ni, agar biz `except` operatorini yozsagu, uning badanida hech narsa bajarilishini istmasak, `pass` operatorini ishlatamiz.&#x20;

```python
import json
files = ['talaba1.json','talaba2.json','talaba3.json','talaba4.json']
for filename in files:
    try:
        with open(filename) as f:
            talaba = json.load(f)        
    except FileNotFoundError:
        pass
    else:
        print(talaba['ism'])
```

## XATOLARNING OLDINI OLISH

Yuqorida biz xatolar yuz berganda, ularni ushlash va dastur to'xtashining oldini olishni ko'rdik. Ya'ni, `try-except` ketma-ketligi xatolarning oldini olishga yordam bera olmaydi. Xatolarning oldini olish uchun `if-else` va `while` tsikllaridan foydalanganimiz afzal.

Mavu boshidagi misolimizga qaytsak. Biz foydalanuvchi yoshini so'radik, va foydalanuvchi butun son kiritmagani sababli dasturni to'xtatdik. Aslida, while tsikli yordamida toki foydalanuvchi to'g'ri qiymat kritgunga qadar uning yoshini qayta-qayta talab qilishimiz mumkin:

```python
while True:
    yosh = input("Yoshingizni kiriting: ")
    if yosh.isdigit():
        yosh = int(yosh)
        break        

print(f"Siz {2021-yosh} yilda tug'ilgansiz")
```

![Natija](/files/-MTpBs9TZBvsYXCqC0c3)

Albatta yuqordagi usul barcha xatolar uchun ishlamaydi. Shunday xatolar bo'lishi mumkinki, biz ularni oldindan ko'ra olmasligimiz yoki, oldindan to'g'rila olmasligimiz, yoki xato foydalanuvchiga bog'liq bo'lmasligi mumkin. Shunday holatlarda, `try-except` operatorlari bizning xaloskorimiz bo'ladi.

## KODLAR

---''',
    vocabularyRaw: '''try	Xavfli kod yoziladigan blok boshlanishi	try:
except	Xatolik yuz berganda ishlaydigan blok	except ValueError:
finally	Har qanday holatda ham ishlaydigan yakuniy blok	finally:''',
    exercises: [
      Exercise(
        number: 1,
        question: '''try-except bloki orqali ZeroDivisionError xatosini ushlang.''',
        answer: '''try:
    print(5/0)
except ZeroDivisionError:
    print(\'Xato\')''',
      ),
      Exercise(
        number: 2,
        question: '''Xato bo\'lsa ham, bo\'lmasa ham ishlaydigan yakuniy blok nomi?''',
        answer: '''finally''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 36,
    title: '''Kodni Tekshirish (Unittest: Funksiyalar)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/testing/36-function-test.md).

# # 36 FUNKSIYANI TEKSHIRISH

## KIRISH

Dastur davomida yangi funksiya yoki klass yozar ekanmiz, ularni to'g'ri ishlashini ham tekshirishimiz tabiiy. Kodni tekshirish, kelajakda dasturimiz xato ishlashining oldini oladi. Odatda, funksiya va klasslarni tekshirish uchun alohida test dasturlar yozishimiz mumkin. Bunday dasturlar funksiyaga turli parametrlar orqali murojat qilib, undan qaytgan qiymatlar to'g'ri yoki xato ekanini tekshiradi.&#x20;

Pythonda bu jarayonni osonlashtirish uchun maxsus `unittest` moduli mavjud. `unittest` yordamida alohida funksiya, obyekt yoki butun boshli modulni ham tekshirshimiz mumkin. Lekin, tavsiya qilingan usuli bu testni dastavval kichik qismlardan boshlab, kengaytirib borish.&#x20;

## FUNKSIYANI TEKSHIRISH

Boshlanishiga biror sodda funksiya yozamiz. Quyidagi funksiya foydalanuvchi ismi va familiyasini qabul qiladi, va ism familiyani jamlab qaytaradi:

```python
def get_full_name(ism, familiya):
    return f"{ism} {familiya}".title()
```

Funksiyani tekshiramiz:

```python
>>> print(get_full_name('alijon','valiyev'))
'Alijon Valiyev'
```

Keling endi shu funksiyamizni tekshirish uchun dastur yozamiz. Bu yerda ikki narsaga ahamiyat beramiz: avvalo funksiyamizni alohida modulda saqlaymiz (`name.py`), ikkinchidan test dasturimizni ham alohida modulda yozamiz va unga ham tushunarli nom beramiz (masalan, `name_test.py`).

Test faylimizning (`name_test.py`) tarkibi quyidagicha bo'ladi:

```python
import unittest
from name import get_full_name

class NameTest(unittest.TestCase):
    def test_toliq_ism(self):
        formatted_name = get_full_name('alijon','valiyev')        
        self.assertEqual(formatted_name, 'Alijon Valiyev')

unittest.main()
```

Dasturni tahlil qilamiz:

* Dastavval unittest modulini chaqiramiz (`import unittest`)
* Keyingi qatorda `name.py` modulimizdan tekshirmoqchi bo'lgan funksiyamizni ham yuklab olamiz (`get_full_name`).
* 4-qatorda test klassini yaratamiz, bu klass`unittest.TestCase` klassidan meros oladi. Bu klass berilgan parametrlar uchun funksiyadan qaytgan qiymatlarni tekshirishga mo'ljallangan. Klassimizga o'zimiz istagan, tushunarli nom beramiz (`NameTest`).&#x20;
* Klassimiz ichida `test_toliq_ism` metodini yaratdik. Bu metod `get_full_name` funksiyasidan qaytgan qiymatni biz avvaldan bergan qiymatga teng yoki yo'q ekanini tekshiradi. Buning uchun esa maxsus `.assertEqual()` metodidan foydalandik. E'tibor bering, test medotlarning nomi har doim `test` so'zi bilan boshlanishi kerak.
* `assertEqual()` metodi ikki qiymat qabul qiladi va ularning teng ekanligini tekshiradi (assert ingliz tilidan tasdiqlash deb tarjima qilinadi). Agar `get_full_name('alijon','valiyev')` funksiyamiz to'g'ri ishlasa, funksiyadan `'Alijon Valiyev'` qiymati qaytishi kerak. `assertEqual()` metodi aynan shuni tekshirishga mo'ljallangan.
* So'nggi qatorda unittest klassinini chaqiramiz, bu esa o'z navbatida biz yuqorida yozgan testni chaqiradi.&#x20;

`name_test.py` dasturimizni bajaramiz va quyidagi natijani olamiz:

```aspnet
Ran 1 test in 0.001s

OK
```

Natijadan bitta test bajarilganini va va bu test muvaffaqiyatli o'tganini (`OK`) ko'rishimiz mumkin.

Keling endi dars boshida yaratilgan `get_full_name` funksiyamizga o'zgartirish kiritamiz:

```python
def get_full_name(ism, familiya, otasi=''):
    if otasi:
        return f"{ism} {otasi} {familiya}"   
    else:
        return f"{ism} {familiya}".title()
```

Bu safar funksiyamiz otasining ismini ham qabul qiladi, lekin bu argument ixtiyoriy.&#x20;

Testimizga ham o'zgartirish kiritamiz. Bu safar ikki hil ism uchun ikkita alohida test bajaramiz:

```python
import unittest
from name import get_full_name

class NameTest(unittest.TestCase):
    def test_toliq_ism(self):
        formatted_name = get_full_name('alijon','valiyev')        
        self.assertEqual(formatted_name, 'Alijon Valiyev')
    def test_toliq_ism_otasi(self):
        name = get_full_name('hasan','husanov','olimovich')
        self.assertEqual(name,'Hasan Olimovich Husanov')

unittest.main()
```

Testni bajaramiz, va quyidagi natijani olamiz:

```aspnet
AssertionError: 'hasan olimovich husanov' != 'Hasan Olimovich Husanov'
- hasan olimovich husanov
? ^     ^         ^
+ Hasan Olimovich Husanov
? ^     ^         ^

----------------------------------------------------------------------
Ran 2 tests in 0.001s

FAILED (failures=1)
```

Bu safar funksiyamiz 1 ta testdan yiqildi (`failures=1`). Biz kutgan natija (Hasan Olimovich Husanov) va funksiya qaytargan natija (hasan olimovich husanov) bir hil emas. Ya'ni, ism familiya va otasining ismi katta harflar bilan yozlishi kerak edi, lekin natija unday emas. Demak funksiyamizda xato bor. Xatoni to'g'rilaymiz:

```python
def get_full_name(ism, familiya, otasi=''):
    if otasi:
        return f"{ism} {otasi} {familiya}".title()   
    else:
        return f"{ism} {familiya}".title()
```

Testni qaytadan chaqiramiz:

```aspnet
Ran 2 tests in 0.001s

OK
```

Bu safar funksiyamiz  ikki testdan ham muvaffaqiyatli o'tdi.

## SONLARNI TEKSHIRISH

Yuqorida matn qaytaruvchi funksiyani tekshirishni ko'rdik. Keling endi sonlar bilan ishlashni ko'ramiz. Misol tariqasida yangi `circle.py` modulini yaratamiz va uning ichida doiraning yuzini ( \$\$\pi r^2\$\$ ) va perimetrini ( \$\$2\pi r\$\$)  hisoblaydigan funksiyalar yozamiz:

```python
def getArea(r,pi=3.14159):
    """Doiraning yuzini qaytaruvchi funksiya"""
    return pi*(r**2)

def getPerimeter(r,pi=3.14159):
    """Doiraning perimetrini qaytaruvchi funksiya"""
    return 2*pi*r
```

E'tibor bering, ikki funksiya ham, agar foydalanuvchi aniq qiymat bermasa, \$\$\pi\$\$ ning qiymatini standart argument sifatida `3.14159` ga teng deb qabul qilayapti. Ushbu funksiyalarni tekshirish uchun alohida `circle_test.py` test dasturini yozamiz. Matnlardan farqli ravishda, sonlarni taqqoslash uchun `assertAlmostEqual()` metodidan foydalanamiz. Bu metod, ikki sonni nuqtadan keyin 7 xonagacha aniqlikda tekshiradi:

```python
import unittest
from circle import getArea, getPerimeter

class CircleTest(unittest.TestCase):
    def test_area(self):
        self.assertAlmostEqual(getArea(10), 314.159)
        self.assertAlmostEqual(getArea(3),28.27431)
    def test_perimeter(self):
        self.assertAlmostEqual(getPerimeter(10), 62.8318)
        self.assertAlmostEqual(getPerimeter(4), 25.13272)
        
unittest.main())
```

Bu yerda e'tibor qiling, biz har bir funksiya uchun 2 tadan test yozdik. Testni bajaramiz va quyidagi natijani olamiz:

```aspnet
Ran 2 tests in 0.001s

OK
```

## MANTIQIY QIYMATLARNI TEKSHIRISH

Agar funksiya mantiqiy qiymat qaytarsa, bunday funksiyalarni `assertTrue()` va `assertFalse()` metodlari yordamida tekshirishimiz mumkin.&#x20;

Quyidagi funksiyamiz kiritilgan son tub yoki yo'q ekanini tekshiradi:

```python
def tubSonmi(n):
    if n==2 or n==3: return True
    if n%2==0 or n<2: return False
    for i in range(3, int(n**0.5)+1, 2):   # faqat toq sonlarni tekshiramiz
        if n%i==0:
            return False   
    return True
```

Funksiyani alohida `tubSonmi.py` fayliga saqlaymiz. Funksiyani tekshirish uchun `tubSon_test.py` dasturini yozamiz:

```python
import unittest
from tubSonmi import tubSonmi

class tubSonTest(unittest.TestCase):
    def test_true(self):
        self.assertTrue(tubSonmi(7))
        self.assertTrue(tubSonmi(193))
        self.assertTrue(tubSonmi(547))
    def test_false(self):
        self.assertFalse(tubSonmi(6))
        self.assertFalse(tubSonmi(265))
        self.assertFalse(tubSonmi(489))
        
unittest.main()
```

Test davomida `tubSonmi()` funksiyasini bir nechta tub (`7, 193, 547`) va tub bo'lmagan (`6, 265, 489`) sonlar bilan chaqirdik. Bunda `assertTrue()` metodi funksiyamiz haqiqatdan ham `True` qiymatini qaytarishini, `assertFalse()` metodi esa funksiyamiz `False` qiymat qaytarishini tekshiradi.

## TAQQOSLASH METODLARI

`TestCase` klassi tarkibidagi boshqa taqqoslash metodlari ham mavjud:

| Metod                                                                                                                | Nimani taqqoslaydi?          |
| -------------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| [`assertEqual(a, b)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertEqual)                 | `a == b`                     |
| [`assertNotEqual(a, b)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertNotEqual)           | `a != b`                     |
| [`assertTrue(x)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertTrue)                      | `x` ning qiymati `True`      |
| [`assertFalse(x)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertFalse)                    | `x` ning qiymati `False`     |
| [`assertIs(a, b)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertIs)                       | `a` bu `b`                   |
| [`assertIsNot(a, b)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertIsNot)                 | `a` bu `b` emas              |
| [`assertIsNone(x)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertIsNone)                  | `x` ning qiymati `None`      |
| [`assertIsNotNone(x)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertIsNotNone)            | `x` ning qiymati `None` emas |
| [`assertIn(a, b)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertIn)                       | `a` `b` ning ichida          |
| [`assertNotIn(a, b)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertNotIn)                 | `a` `b` ning ichida emas     |
| [`assertIsInstance(a, b)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertIsInstance)       | `a` `b` ning vorisi          |
| [`assertNotIsInstance(a, b)`](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertNotIsInstance) | `a` `b` ning vorisi emas     |

## AMALIYOT

Quyidagi funksiyalarni yarating, va **ularning har biri uchun test dasturlarini yozing**:

* Uchta son qabul qilib, ulardan eng kattasini qaytaruvchi funksiya
* Matnlardan iborat ro'yxat qabul qilib, ro'yxatdagi har bir matnning birinchi harfini katta harfga o'zgatiruvchi funksiya
* Berilgan sonlar ro'yxatidan juft sonlarni ajratib oluvchi funksiya
* Berilgan son [Fibonachchi ketma-ketligida](https://medium.com/@qudratxoja.musayev/fibonachchi-sonlari-va-u-haqida-qiziqarli-faktlar-47000a80264d) uchraydimi (`True`) yoki yo'q (`False`) qaytaruvchi funksiya yozing.

## KODLAR

---''',
    vocabularyRaw: '''unittest	Python standart testlash kutubxonasi	import unittest
assertEqual()	Ikki qiymat tengligini tekshirish metodi	self.assertEqual(a, b)
test_	Test metodlari nomi shu so\'z bilan boshlanishi shart	def test_sum(self):''',
    exercises: [
      Exercise(
        number: 1,
        question: '''unittest.TestCase dan voris olgan TestClass sinfini yarating.''',
        answer: '''class TestClass(unittest.TestCase):''',
      ),
      Exercise(
        number: 2,
        question: '''Ikkita qiymat tengligini tekshiruvchi assert metodi nomi?''',
        answer: '''assertEqual''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 37,
    title: '''Kodni Tekshirish (Unittest: Klasslar)''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/testing/37-klass-test.md).

## KIRISH

Avvalgi darsimizda funksiyalarni tekshiruvchi testlar yozishni o'rgandik. Ushbu mavzuda esa klasslarni test qilishni o'rganamiz. Klass to'g'ri bo'lsa, undan yaratilgan obyektlar ham to'g'ri ishlaydi.&#x20;

Keling boshlanishiga biror klass yaratamiz:

```python
class Car:
    """(self,make,model,year,km=0,price=None)"""
    def __init__(self,make,model,year,km=0,price=None):
        self.make = make
        self.model = model
        self.year = year
        self.price = price
        self.__km = km
    
    def set_price(self,price):
        self.price = price
        
    def add_km(self,km):
        """Mashinaning km ga yana km qo'shish"""
        if km>=0:
            self.__km += km
        else:
            raise ValueError("km manfiy bo'lishi mumkin emas")
    
    def get_info(self):
        info = f"{self.make.upper()} {self.model.title()}, " 
        info += f"{self.year}-yil, {self.__km}km yurgan."
        if self.price:
            info += f" Narhi: {self.price}"
        return info
       
    def get_km(self):
        return self.__km
```

Yuqoridagi klassimiz avtomobil haqida ma'lumotlarni saqlaydi. Klassimizning e'tibor qaratishimiz kerak bo'lgan jihatlari:

* `km` va `price` (narh) argumentlariga standart qiymat berilgan
* km parametri inkapsulasiyalangan (`self.__km`)
* Avtomobil narhini `set_price()` metodi yordamida yangilash mumkin
* `add_km()` metodi faqat musbat qiymat qabul qiladi. Agar manfiy qiymat uzatilsa `raise` operatori yordamida `ValueError` xatosini qaytaradi
* `get_info()` metodidan qaytadigan qiymat avtomobil narhi bor yoki yo'qligiga qarab turli ko'rinishda bo'lishi mumkin
* Avtomobil kilometrajini ko'rish uchun `get_km()` metodiga murojat qilamiz.

## XUSUSIYATLARNI TEKSHIRISH

Klassdan obyekt yaratish jarayonida biz obyektning xususiyatlarini parametr ko'rinishida beramiz. Quyidagi testda aynan shu jarayon to'g'ri kechganini tekshiramiz:

```python
import unittest
from cars import Car

class CarTest(unittest.TestCase):
    """Car klassini tekshirish uchun test"""
    
    def test_create(self):        
        # avto1 obyektini km va narhini bermasdan yaratamiz
        avto1 = Car("toyota","camry",2020)
        # Qiymatlar mavjudligini assertIsNotNone metodi bilan tekshiramiz
        self.assertIsNotNone(avto1.make)
        self.assertIsNotNone(avto1.model)
        self.assertIsNotNone(avto1.year)
        # Qiymat mavjud emasligini assertIsNone metodi bilan tekshiramiz
        self.assertIsNone(avto1.price)
        # Qiymat tengligini assertEquals metodi bilan tekshiramiz
        self.assertEqual(0,avto1.get_km())
        # Yangi obyekt yaratamiz va narhini ham ko'rsatamiz
        avto2 = Car("toyota","camry",2020,price=75000)
        self.assertEqual(75000,avto2.price)
        
unittest.main() 
```

Testni bajaramiz va quyidagi natijani olamiz:

```aspnet
Ran 1 test in 0.001s

OK
```

Testimizni tahlil qilamiz. Dastaval biz obyektimiz to'g'ri yaratilayotganini tekshrish uchun `avto1` obyektini 3 ta prametr bilan yaratib oldik (`make, model, year`) va  bu xususiyatlar bo'sh emasligini  `assertIsNotNone()` metodi bilan tekshirdik.&#x20;

`avto1` obyektini yaratishda uning narhini ko'rsatmadik, demak bu xususiyat standart qiymat (`None`) ga teng bo'lishi kerak. Buni tekshirish uchun esa `assertIsNone()` metodiga murojat qildik. Vanihoyat, avtomobil kilometraji `0` ga teng ekanligini `assertEquals()` metodi yordamida test qildik.

Test so'ngida biz yana bir obyekt yaratdik (`avto2`) va bu safar avtomobil narhini ko'rsatganimiz uchun `assertEquals()` metodi yordamida bu qiymat to'g'ri saqlanganini tekshirib oldik.

Testlarni yozishni davom etamiz. Navbat obyektga tegishli turli metodlarga.

**Test dasturlarni alohida faylga yozishni unutmang.**

## `setUp()` METODI

Yuqoridagi misolda bitta test davomida 2 ta obyekt yaratdik, va obyektning parametrlarini qo'lda yangidan kiritdik. Agar shu yo'sinda davom etadigan bo'lsak, turli testlar uchun har gal yangi obyekt yaratishimiz, va ularning har biriga xususiyatlarni qayta-qayta kiritishimiz talab qilinadi. Buning oldini olish uchun test klassimizning boshida `setUp()` metodini yaratib, bu metod ichida barcha kerakli qiymatlarni va obyektlarni saqlab qo'yishimiz va turli testlarda shu qiymatlarga murojat qilishimiz mumkin:

```python
import unittest
from cars import Car

class CarTest(unittest.TestCase):
    """Car klassini tekshirish uchun test"""
    def setUp(self):        
        make = "GM"
        model = "Malibu"
        year = 2020        
        self.price = 40000
        self.km = 10000
        self.avto1 = Car(make,model,year)
        self.avto2 = Car(make,model,year,price=self.price)
        
    def test_create(self):                
        # Qiymatlar mavjudligini assertIsNotNone metodi bilan tekshiramiz
        self.assertIsNotNone(self.avto1.make)
        self.assertIsNotNone(self.avto1.model)
        self.assertIsNotNone(self.avto1.year)
        # Qiymat mavjud emasligini assertIsNone metodi bilan tekshiramiz
        self.assertIsNone(self.avto1.price)
        # Qiymat tengligini assertEquals metodi bilan tekshiramiz
        self.assertEqual(0,self.avto1.get_km())
        # avto2 narhini tekshiramiz
        self.assertEqual(self.price,self.avto2.price)

unittest.main()  
```

E'tibor bering, `setUp()` metodi ichida ba'zi o'zagruvchilar self yordamida berilgan (`self.price`,`self.km`, `self.avto1`, `self,avto2`). Bu o'zgaruvchilarga biz `CarTest()` klassining ichida istalgan joydan murojat qilishimiz mumkin. Shuning uchun ham, `test_create()` funksiyasi ichida biz yangi obyekt yaratmasdan, `setUp()` ichidagi `avto1` va `avto2` obyektlariga murojat qildik.

## METODLARNI TEKSHIRISH

Obyektimiz bir nechta metodlardan iborat. Ularning har biri uchun alohida test yozamiz. Bu metodlarni `CarTest` ichida yozishni unutmang.

Osonidan boshlaymiz:

```python
    def test_set_price(self):
        self.avto2.set_price(self.price)
        self.assertEqual(self.price,self.avto2.price)
```

Endi `add_km()` metodini tekshiraylik. Bu metodimiz faqatgina musbat qiymat qabul qilishi, manfiy qiymat uzatilganda `ValueError` xatosini qaytarishi kerak edi. Shuning uchun metodni test qilishda avval musbat, keyin esa manfiy qiymat berib ko'ramiz.

```python
    def test_add_km(self):
        #1 Musbat qiymat berib ko'ramiz
        self.avto1.add_km(self.km)
        self.assertEqual(self.km,self.avto1.get_km())
        #2 Manfiy qiymat berib ko'ramiz
        new_km = -5000        
        try:
            self.avto1.add_km(new_km)
        except ValueError as error:
            self.assertEqual(type(error), ValueError)
```

Navbat `get_info()` metodiga. Bu metod ham obyektning xususiyatlaridan kelib chiqqan holda 2 hil qiymat qaytarishi mumkin, demak testimiz bu ikki holatni hisobga olishi kerak.

```python
    def test_get_info(self):
        avto1_info = 'GM Malibu, 2020-yil, 0km yurgan.'
        self.assertEqual(avto1_info,self.avto1.get_info())
        # avto1 narhi va km o'zgartiramiz
        self.avto1.set_price(50000)
        self.avto1.add_km(20000)
        avto1_info = 'GM Malibu, 2020-yil, 20000km yurgan. Narhi: 50000'
        self.assertEqual(avto1_info,self.avto1.get_info())
```

Yakuniy test dasturimiz quyidagi ko'rinishga ega bo'ldi:

```python
import unittest
from cars import Car

class CarTest(unittest.TestCase):
    """Car klassini tekshirish uchun test"""
    def setUp(self):        
        make = "GM"
        model = "Malibu"
        year = 2020        
        self.price = 40000
        self.km = 10000
        self.avto1 = Car(make,model,year)
        self.avto2 = Car(make,model,year,price=self.price)
        
    def test_create(self):                
        # Qiymatlar mavjudligini assertIsNotNone metodi bilan tekshiramiz
        self.assertIsNotNone(self.avto1.make)
        self.assertIsNotNone(self.avto1.model)
        self.assertIsNotNone(self.avto1.year)
        # Qiymat mavjud emasligini assertIsNone metodi bilan tekshiramiz
        self.assertIsNone(self.avto1.price)
        # Qiymat tengligini assertEquals metodi bilan tekshiramiz
        self.assertEqual(0,self.avto1.get_km())
        # avto2 narhini tekshiramiz
        self.assertEqual(self.price,self.avto2.price)
    
    def test_set_price(self):
        self.avto2.set_price(self.price)
        self.assertEqual(self.price,self.avto2.price)
    
    def test_add_km(self):
        # Musbat qiymat berib ko'ramiz
        self.avto1.add_km(self.km)
        self.assertEqual(self.km,self.avto1.get_km())
        # Manfiy qiymat berib ko'ramiz
        new_km = -5000        
        try:
            self.avto1.add_km(new_km)
        except ValueError as error:
            self.assertEqual(type(error), ValueError)
    
    def test_get_info(self):
        avto1_info = 'GM Malibu, 2020-yil, 0km yurgan.'
        self.assertEqual(avto1_info,self.avto1.get_info())
        # avto1 narhi va km o'zgartiramiz
        self.avto1.set_price(50000)
        self.avto1.add_km(20000)
        avto1_info = 'GM Malibu, 2020-yil, 20000km yurgan. Narhi: 50000'
        self.assertEqual(avto1_info,self.avto1.get_info())

        
unittest.main()
```

Testni bajaramiz va quyidagi natijani olamiz:

```aspnet
....
----------------------------------------------------------------------
Ran 4 tests in 0.002s

OK
```

## AMALIYOT

* [30-darsimizda](https://python.sariq.dev/oop/30-vorislik-polimorfizm) `Shaxs` va `Talaba` klasslarini yaratgan edik. Shu ikki klassning xususiyatlari va metodlarini tekshiruvchi test dasturlar yozing.&#x20;
* Ikki klass uchun yagona test yoza olasizmi? (`isInstance()` funksiyasini eslang)

## KODLAR

---''',
    vocabularyRaw: '''setUp()	Har bir testdan oldin muhitni tayyorlovchi metod	def setUp(self):
tearDown()	Test tugagandan so\'ng tozalash ishlari metodi	def tearDown(self):''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Testlar uchun boshlang\'ich obyektlarni yaratuvchi maxsus metod nomi?''',
        answer: '''setUp''',
      ),
      Exercise(
        number: 2,
        question: '''setUp metodi qachon ishga tushadi?''',
        answer: '''har bir testdan oldin''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 38,
    title: '''Python Standart Kutubxonasi''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/last-words/38-python-library.md).

## KIRISH

Python dasturlash tili yildan-yilga ommalashib bormoqda. Bunga birinchi navbatda Pythonning sodda va tushunarli sintaksi sabab bo'lsa, ikkinchi va ehtimol eng ko'zga ko'ringan sabab bu Pythonning keng qamrovli kutubxonalar to'plamidir. Ushbu darsimizda Pytyon kutubxonasidagi ba'zi muhim modullar bilan tanishamiz. Standart kutubxonanig to'liq tarkibi bilan [Python rasmiy sahifasida](https://docs.python.org/3/library/) tanishishingiz mumkin.

Kutubxona bu boshqalar tarafidan yozilgan tayyor funksiyalar va obyektlar to'plami.&#x20;

## `datetime` — SANA VA VAQT

Ushbu modul yordamida Pythonda sanalar bilan ishlashimiz mumkin. Moduldan foydalanishdan avval uni import qilamiz. Har gal moduldan foydalanishda `datetime` deb qayta yozmaslik uchun, import qilishda modulga `dt` nomini beramiz.

```python
import datetime as dt
```

Hozirgi vaqt va sanani koʻrish uchun `datetime.now()` moduliga murojat qilamiz:

```python
hozir = dt.datetime.now()
print(hozir)
```

Natija: `2021-03-09 12:12:19.894899`

Kurib turganingizdek, natija yil, oy, kun soat, minut, sekund va millisekund koʻrinishida chiqdi. Biz bu qiymatlardan istaganimzni maxsus metodlar yordamida ajratib olishimiz mumkin:

```python
# sanani ajratib olish
print(hozir.date())

# vaqtni ajratib olish
print(hozir.time())

# soatni ajratib olish
print(hozir.hour)

# minutni ajratib olish
print(hozir.minute)

# sekundni ajratib olish
print(hozir.second)
```

Natija:

```aspnet
2021-03-09
12:15:35.367013
12 # soat
15 # minut
35 # sekund
```

Agar bugungi kunning sanasi talab qilinsa `datetime` moduli ichidagi `date.today()` moduliga murojat qilamiz.

```python
bugun = dt.date.today()
print(f"Bugungi sana: {bugun}")
```

Natija: `Bugungi sana: 2021-03-09`

Agar biror sanani qoʻlda kiritish talab qilinsa .date() metodiga kerakli sanani (yil, oy, kun) koʻrinishida kiritamiz.

```python
ertaga = dt.date(2021, 3, 10)
print(f"Ertangi sana: {ertaga}")
```

Natija: `Ertangi sana: 2021-03-10`

Faqatgina vaqt bilan ishlash uchun `.datetime.now().time()` metodiga murojat qilishimiz mumkin:

```python
hozir = dt.datetime.now()
vaqtHozir = hozir.time()
print(f"Hozir soat: {vaqtHozir}")
```

Natija: `Hozir soat: 12:21:54.529788`

Istalgan vaqtni qoʻlda kiritish uchun esa .time() metodiga kerakli vaqtni (soat, minut, sekund) koʻrinishida beramiz:

```python
vaqtKeyin = dt.time(23,45,00)
```

Ayirish operatori yordamida sanalalar va vaqtlar orasidagi farqni hisoblashimiz mumkin:

```python
bugun = dt.date.today()
ramazon = dt.date(2021, 4, 13)
farq = ramazon-bugun
print(farq)
print(f"Ramazonga {farq.days} kun qoldi")
```

Natija: Ramazonga 35 kun qoldi

Huddi shu kabi ikki vaqt oraligʻini sekundlarda yoki soatlarda ham koʻrishimiz mumkin:

```python
hozir = dt.datetime.now()
futbol = dt.datetime(2021, 3, 10, 23, 45, 00)
farq= futbol-hozir
sekundlar = farq.seconds
minutlar = int(sekundlar/60)
soatlar = int(minutlar/60)
print(f"Futbol boshlanishiga {sekundlar} sekund qoldi")
print(f"Futbol boshlanishiga {minutlar} minut qoldi")
print(f"Futbol boshlanishiga {soatlar} soat qoldi")
```

Natija:

```aspnet
Futbol boshlanishiga 40797 sekund qoldi
Futbol boshlanishiga 679 minut qoldi
Futbol boshlanishiga 11 soat qoldi
```

Yuqorida sanalar AQSh standartiga koʻra, yil-oy-kun koʻrinishida chiqayapti. Sanani oʻzimizga moslab chiqarish uchun `.strftime()` metodini chaqiramiz, va sanani oʻzimizga qulay formatda chiqaramiz.

```python
# vaqtni millisekundsiz chiqaramiz
vaqt = hozir.strftime("%H:%M:%S")
print(f"Hozir soat: {vaqt}")

# sanani kun-oy-yil koʻrinishida chiqaramiz
sana = hozir.strftime("%d-%m-%Y")
print(f"Bugun sana: {sana}")

# sanani kun/oy/yil koʻrinishida chiqaramiz
sana_vaqt = hozir.strftime("%d/%m/%Y, %H:%M")
print(sana_vaqt)
```

Natija:

```aspnet
Hozir soat: 12:28:21
Bugun sana: 09-03-2021
09/03/2021, 12:28
```

## `math` —MATEMATIK FUNKSIYALAR

Bu modul oʻz ichida matematikaga oid turli funksilayar va oʻzgaruvchilarni saqlaydi. Keling, ularning baʻzilari bilan tanishamiz.

### \$\$\pi\$\$ ning qiymati

```python
import math
PI = math.pi
print(f"PI ning qiymati: {PI}")
```

Natija: `PI ning qiymati: 3.141592653589793`

### e — natural logarifm asosi

```python
E = math.e
print(f"e ning qiymati: {E}")
```

Natija: `e ning qiymati: 2.718281828459045`

### Trigonometriya

Modul tarkibida deyarli barcha trigonometrik funksiyalar mavjud (cos, sin, tangens, arccos, va hokazo)&#x20;

```python
math.sin(math.pi/2)
math.cos(0)
math.tan(PI)
```

Shunigdek degrees va radians metodlari yordamida burchakdan radianga va aksincha konvertasiya qilishimiz ham mumkin:

```python
math.degrees(math.pi/2)
math.radians(90)
```

### LOGARIFMLAR

`log()` va `log10()` funksiyalari yordamida natural va o'n asosli logarifmlarni hisoblash mumkin:

```python
# natural logarifm
math.log(5)
# 10 asosli logarifm
math.log10(100)
```

### SONLARNI YAXLITLASH

Sonlarni eng yaxlitlash uchun Pythonda maxsus round() funksiyasi mavjud. Bunga qo'shimcha ravishda, math moduli ichidagi ceil() funksiyasi yordamida berilgan o'nlik sonni keyingi butun songa, floor() yordamida esa quyi butun songa yaqinlashtirish mumkin:

```python
x = 4.6
print(math.ceil(x))
print(math.floor(x))
```

Natija:&#x20;

```aspnet
5
4
```

### ILDIZ VA DARAJA

Berilgan sonning kvadrat ildizini hisoblash uchun sqrt(), sonni darajaga oshirish uchun esa pow() funksiyalariga murojat qilamiz:

```python
x = 81

# Kvadrat ildiz
math.sqrt(x)

# Darajaga oshirish
math.pow(x,3) # x ning kubi
math.pow(x,5) # x ning 5-darajasi
math.pow(x,1/3) # x dan kub ildiz
```

`math` moduli tarkibida boshqa funksiyalar ham mavjud. Yuqorida biz ularning ba'zilari bilan tanishdik. Bu modul asosan butun va oʻnlik sonlar bilan ishlashga moʻljallangan. Kompleks sonlar bilan ishlash uchun `cmath` moduliga murojat qilishingiz mumkin.

## `pprint` - CHIROYLI PRINT

`pprint` moduli yordamida turli o'zgaruvchilarni chiroyli ko'rinishda konsolga chiqarishimiz mumkin. Bu bizga uzun lug'atlar, JSON fayllar yoki matnlar bilan ishlashda juda asqotadi.

Misol uchun, avvalgi darslarimizning birida yaratgan `bemor.json` faylini ochamiz va avval `print()` keyin `pprint()` yordamida konsolga chiqaramiz.

bemor.json fayli

```python
from pprint import pprint
import json

filename = 'bemor.json'
with open(filename) as f:
    bemor = json.load(f)

print(bemor)
```

Natija:

```aspnet
{'ism': 'Alijon Valiyev', 'yosh': 30, 'oila': True, 'farzandlar': ['Ahmad', 'Bonu'], 'allergiya': None, 'dorilar': [{'nomi': 'Analgin', 'miqdori': 0.5}, {'nomi': 'Panadol', 'miqdori': 1.2}]}
```

Navbat `pprint()` funksiyasiga:

```python
pprint(bemor)
```

Natija:

```aspnet
{'allergiya': None,
 'dorilar': [{'miqdori': 0.5, 'nomi': 'Analgin'},
             {'miqdori': 1.2, 'nomi': 'Panadol'}],
 'farzandlar': ['Ahmad', 'Bonu'],
 'ism': 'Alijon Valiyev',
 'oila': True,
 'yosh': 30}
```

## RegEx - ANDOZA YORDAMIDA MATN IZLASH

Pythondagi juda foydali modullardan biri bu **`re`** (*regular expressions*) moduli. Bu modul yordamida biror matn berilgan andozaga tushish, tushmalsigini tekshrib ko'rishimiz mumkin. Yoki berilgan andoza asosida matnlar orasidan kerakli matnlarni ajratib olish mumkin.

Keling boshlanishiga sodda misol ko'ramiz. Quyida biz 3 ta so'z va so'zlarni tekshirish uchun andoza yaratdik. Quyidagi andozamiz т harfidan boshlanuvchi (`^т`), р harfiga tugovchi (р`\$`), 5 harfdan iborat so'zlarni qidiradi (`^т...р\$`).&#x20;

Avvaliga andozalarni tushunish biroz qiyin bo'lishi mumkin, lekin vaqt o'tishi bilan andoza qanday ishlashini tushunib olasiz deb umid qilamiz.

So'zlarni andozaga solishtirish uchun `re.match()` funksiyasidan foydalanamiz. Agar tekshirgan so'zimiz andozaga mosh tushsa, `re.match()` metodi so'zni o'zini qaytaradi, aks holda `None` qiymatini qaytaradi.

```python
import re

word1 = "темир"
word2 = "томир"
word3 = "тулпор"

andoza = "^т...р"

print(re.match(andoza, word1))
print(re.match(andoza, word2))
print(re.match(andoza, word3))
```

Natija:

```python
<re.Match object; span=(0, 5), match='темир'>
<re.Match object; span=(0, 5), match='томир'>
None
```

Natijadan ko'rishimiz mumkin, `word1` va `word2` o'zgaruvchilari anfozaga tushdi, `word3` esa tushmadi.

Keling endi, so'z to'pish o'yinida ishlatilgan soz'lar ro'yxatidan foydalanamiz, va ro'yxatdan biz bergan andozaga tushuvchi so'zlarni ajratib olamiz.

```python
from uzwords import words
andoza = "^т...р\$"

matches = []
for word in words:
    if re.match(andoza,word):
        matches.append(word)
print(matches)
```

Natija:&#x20;

```aspnet
['табар', 'табор', 'тавир', 'тайёр', 'татар', 'татир', 'тахир', 'тақир', 'театр', 'тембр', 'темир', 'темур', 'тенор', 'тикер', 'тихир', 'товар', 'товор', 'тожир', 'томир', 'тонер', 'тоҳир', 'триер', 'тумор', 'тўпар', 'тўпир']
```

Andozalar biror matnda biz uchun kerakli maʻlumotlarni ajratib olish uchun juda qulay. Masalan, Telegram orqali yuborilgan habardan email manzilini yoki telefon raqamini ajratib olish uchun maxsus andoza yozishmiz mumkin. [ihateregex.io](https://ihateregex.io/) sahifasidan esa loyihangiz uchun tayyor andozalarni topishingiz mumkin.&#x20;

![ihateregex.io sahifasida email uchun andoza](/files/-MVLeZ9FVlbBBhfluJuR)

Keling, yuqoridagi andoza asosida biror matndan email manzilini ajratib olamiz. Buning uchun `re.findall()` funksiyasidan foydalanamiz.

```python
matn = """Maqolalar  2020-yilning 20-martiga qadar rtmkonferensiya2021@mail.ru elektron pochtasida qabul qilinadi.
Quyidagi yo'nalishdagi maqolalar qabul qilinadi:
👉 Aniq va tabiiy fanlarni zamonaviy pedagogik texnologiyalar asosida o‘qitish  metodikasi.
👉 Umumta’lim  fanlarini o‘qitishda  STEAM yondashuvning o’rni va ahamiyati. """

andoza = '[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+'
email = re.findall(andoza,matn)
print(email)
```

Natija: `['rtmkonferensiya2021@mail.ru']`

Andoza yordamida foydalanuvchi kiritgan qiymatlarni ham ma'lum shartlarga javob berishini tekshirib olishimiz mumkin:

```python
# Kuchli parolni tekshirish
# Quyidagi andoza ham ihateregex.io sahifasidan olindi
andoza = '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$ %^&*-]).{8,}\$'
msg = "Yangi parol kiriting"
msg += '(kamida 8 belgidan iborat, kamida 1 ta lotin bosh harf, 1 ta kichik harf, '
msg += '1 ta son va 1 ta maxsus belgi boʻlishi kerak): '

while True:
    password = input(msg)
    if re.match(andoza,password):
        print("Maxfiy so'z qabul qilindi")
        break
    else:
        print("Maxfiy so'z talabga javob bermadi")
```

RegEx juda katta mavzu boʻlgani uchun, kelajakda bu haqida alohida dars qilamiz.&#x20;

## AMALIYOT

* Bugungi sanadan boshlab 2 hafta farq bilan 10 ta sanani konsolga chiqaring
* Ramazon va qurbon hayitigacha qolgan kunlarni konsolga chiqaring
* Tug'ilgan kuningizdan bugungi sanagacha qancha yil, oy, kun o'tganini qaytaruvchi funksiya yozing
* Foydalanuvchidan telefon raqamini kiritishni so'rang. Kiritlgan qiymatni andoza yordamida tekshiring
* Berilgan matndan veb sahifa manzilini ajratib olyuvchi funksiya yozing. Quyidagi matndan namuna sifatida foydalanishingiz mumkin:

> Assalom alaykum hurmatli do'stlar. Navbatdagi darsimiz YouTubega yuklandi: <https://youtu.be/vsxJPRLXpgI>
>
> Ushbu darsimizda unittest moduli yordamida klasslarning xususiyatlar va metodlarini tekshiruvchi dastur yozishni o'rganamiz. Bugungi dars manzili: <https://python.sariq.dev/testing/37-klass-test>

## KODLAR

---''',
    vocabularyRaw: '''datetime	Sana va vaqt bilan ishlash moduli	import datetime
math	Matematik amallar va funksiyalar moduli	import math
re	Muntazam ifodalar (Regular Expressions) moduli	import re''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Hozirgi vaqtni datetime yordamida olish kodini yozing.''',
        answer: '''import datetime
hozir = datetime.datetime.now()''',
      ),
      Exercise(
        number: 2,
        question: '''Muntazam ifodalar (Regex) bilan ishlash moduli nomi nima?''',
        answer: '''re''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 39,
    title: '''Pip va Tashqi Kutubxonalar''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/last-words/39-pip-pypi.md).

## KIRISH

Avvalgi darsimizda Python bilan birga o'rnatluvchi, standart kutubxona va undagi ba'zi foydali modullar bilan tanishdik. Ushbu darsimizda esa tashqi kutubxona bilan tanishamiz. Bu kutubxonalar yillar davomida turli foydalanuvchilar tarafidan yaratilib, yangilanib kelinadi. Bunday kutubxonalarda boshqa dasturchilar o'zlari yaratgan turli paketlarni (package) boshqalar bilan ulashadi.

Paket (package) —modullar yig'indisi.

Tashqi kutubxonalar va ular ichidagi paketlar shunchalik ko'pki, deyarli istalgan vazifa yoki xizmat uchun katta ehtimollik bilan kerakli dasturlar allaqachon bir nechtadan yaratilgan. Bugungi kunda Python uchun eng katta tashqi kutubxonalardan biri bu [PyPi.org](https://pypi.org/) sahifasi.

## PIP&#x20;

Tashqi paketlarni o'rnatish uchun Pythonda maxsus `pip` paket menejeri mavjud. `pip` odatda Python bilan birga o'rnatiladi, lekin turli sabablarga ko'ra kompyuteringizda `pip` o'rnatilmagan bo'lsa, uni quyidagi sahifadan yuklab olishnigiz mumkin: <https://pypi.org/project/pip/>

Paket menejer yordamida tashqi paketlarni o'rnatish juda oson, buning uchun Windows terminalda (cmd) (yoki  Spyder konsolida, yoki  PyCharm konsolida va hokazo)`pip install paket_nomi` komandasidan foydalanasiz.&#x20;

Paket nomi qanday yozilishini paketning rasmiy sahifasidan ko'rib olishingiz mumkin. Misol uchun, quyidagi rasmda googletrans paketinig sahifasi va pip komandasi qanday yozilishi ko'rsatilgan.

![googletrans paketi sahifasi](/files/-MVWFLRB9W5-YpZoHH6M)

Demak ushbu paketni o'rnatish uchun `pip install gooletrans` deb yozamiz.

![googletrans paketi o'rnatilish jarayoni](/files/-MVWFpmQQ7lFP6qmfaJU)

Biror paketni oʻchirib tashlash uchun esa `pip uninstall paket_nomi` deb yozamiz.

Ushbu darsimizning maqsadi tashqi paktelar va modullar bilan tanishish orqali, Pythonning naqadar keng qamrovli til ekanini ko'rsatish. Aslida, har bir modul haqida, ularning imkoniyatlari haqida soatlab gapirish mumkin, lekin biz vaqtni tejash maqsadida turli yo'nalishlardagi ba'zi modullar bilan tanishamiz va ularning ishlashiga sodda misollar ko'rish bilan chegaralanamiz.&#x20;

Har bir modul haqida batafsil ma'lumot olish uchun modulning sahifasiga murojat qiling.

## googletrans

`pip install googletrans`

Ushbu modul yordamida Googlening tarjimonlik xizmatiga murojat qilib, istalgan matnni turli tillarga tarjima qilishimiz mumkin. Moduldan foydalanish uchun avvalo `googletrans` modulidan `Translator` klassini import qilamiz va bu klassdan yangi obyekt yaratamiz (tarjimon). Bevosita tarjimonlik xizmatiga murojat qilish uchun tarjimon obyekti ichidagi `.translate()` metodiga murojat qilamiz va parametr sifatida tarjima qilish kerak bo'lgan matnni uzatamiz.&#x20;

```python
from googletrans import Translator
tarjimon = Translator() # Translator bu maxsus klass (tarjimon esa obyekt)
matn_uz = "Python - dunyodagi eng mashxur dasturlash tili"
tarjima = tarjimon.translate(matn_uz)
print(tarjima.text)
```

Natija: `Python is the most popular programming language in the world`

DIQQAT! Agar yuqoridagi kod xato bersa (`TKK token error`), `googletrans` modulini o'chirib tashlab, huddi shu modulning yangi versiyasini o'rnating:

`pip uninstall googletrans # modulni o'chirish`

`pip install googletrans==3.1.0a0 # yangi verisyani o'rnatish`

Agar boshqa tillarga tarjima qilish kerak bo'lsa, `.translate()` metodiga matnga qo'shimcha ravishda `dest` parametrini ham uzatamiz va bu parametrga tarjima qilinishi kerak bo'lgan tilning qisqartmasini beramiz. Tarjima uchun mavjuda tillarni quyidagi manzilfa ko'rishingiz mumkin: <https://sites.google.com/site/opti365/translate_codes>

Masalan, rus tiliga tarjima qilish ucuhn `dest='ru'` deb yozamiz.&#x20;

```python
tarjima_ru = tarjimon.translate(matn_uz, dest='ru')
print(tarjima_ru.text)
```

Natija: `Python - самый популярный язык программирования в мире`

Ingliz tilidan boshqa tillarga tarjima ham shunday:

```python
matn_en = "Tashkent is the capital of Uzbekistan"
tarjima_uz = tarjimon.translate(matn_en, dest='uz')
print(tarjima_uz.text)
```

Natija: `Toshkent - O'zbekistonning poytaxti`

Odatda, Google asl matnning tilini o'zi aniqlaydi. Lekin matn tilini ham alohida ko'rsatmoqchi bo'lsangiz, `src` parametridan foydalaning:

```python
tarjima_uz = tarjimon.translate(matn_en, src='uz', dest='uz')
```

## requests

`pip install requests`

Bu paket yordamida Pythonda veb sahifalarga murojat qilishimiz (so'rov yuborishimiz) va ulardan qaytgan ma'lumotlar ustida turli amallar bajarishimiz mumkin. Misol uchun quyida requests yordamida kun.uz sahifasini to'liqligicha toritb olamiz:

```python
import requests
from pprint import pprint

manzil= "https://kun.uz/news/main"
r = requests.get(manzil)
pprint(r.text)
```

Ko'pincha requests paketidan APIlar bilan ishlashda foydalaniladi. API bu ma'lum bir veb hizmatga so'rov yuborish orqali undan foydalanish. Misol uchun yandex tarjimonga yoki google haritalari xizmatiga requests paketi yordamida API so'rov yuborish va o'zimizga kerakli ma'lumotlarni olishimiz mumkin. API haqida kelgusida batafsil dars qilamiz. Hozir esa sodda misola bilan cheklanamiz.&#x20;

Internetda restcountries.eu sahifasi mavjud. Bu sahifa orqali dunyodagi davlatlar haqida turli maʻlumotlarni olishingiz mumkin. Sahifadan foydalanish qulay boʻlishi uchun esa, sahifa yaratuvchilari bir nechta tayyor API lar eʻlon qilishgan. Misol uchun Oʻzbekiston haqida maʻlumot olish uchun quyidagi manzilga soʻrov yuborasiz: <https://restcountries.eu/rest/v2/name/Uzbekistan>

API dan qaytgan natija JSON (lugʻat) koʻrinishda boʻladi va biz bu lugʻatdan oʻzimizga kerakli maʻlumotni sugʻurib olishimiz mumkin. Misol uchun quyidagi kodimiz APIga yuborilgan davlatning poytaxtini koʻrsatadi:

```python
country = "Uzbekistan"
url = f"https://restcountries.eu/rest/v2/name/{country}"
r = requests.get(url)
r_json = r.json()[0]
print(r_json['capital'])
```

Natija: `Tashkent`

## BeautifulSoup4

`pip install beautifulsoup4`

BeautifulSoup juda kuchli modullardan biri bo'lib, bu modul yordamida turli veb sahifalardan istalgan ma'lumotlarni yig'ishtirib (scarpping) olish mumkin. Biror kishining instagram sahifasidagi barcha rasmlar deysizmi, Facebook guruhidagi barcha postlar va izohlar deysizmi, oldi-sotdi bozoridagi e'lonlar deysizmi, marhamat, `bs4` moduli yordamida buni bemalol avtomatlashtirish mumkin.&#x20;

Odatda `bs4` moduli `requests` moduli bilan hamkorlikda ishlaydi. Keling, sodda misol kor'amiz. Avvalgi bo'limda, requests yordamida kun.uz sahifasining html kodini olgan edik. Endi esa bs4 yordamida html sahifadan oxirgi yangiliklarning mavzusini ajratib olamiz.

```python
import requests
from bs4 import BeautifulSoup

sahifa = "https://kun.uz/news/main"
r = requests.get(sahifa)

soup = BeautifulSoup(r.text, 'html.parser')
news = soup.find_all(class_="news-title") # yangiliklarning mavzusini ajratib olamiz
print(news[0].text) # eng birinchi yangilikni konsolga chiqaramiz
```

Natija: `Коронавирус: AstraZeneca гумон остида, Европада вазият оғирлашмоқда`

Bu modul haqida ham kelajakda alohida dars qilamiz.

## wordcloud va matplotlib

`pip install wordcloud`

`pip install matplotlib`

Wordcloud moduli yordamida katta matnlarda eng ko'p uchraydigan so'zlarni chiroyli qilib, so'zlar buluti chiqarish mumkin. 2020-yil yakunida, [sariqdev ](https://t.me/sariqdev)sahifasida chop etilgan mashxur blogerlarning siluetlari ham aynan shu modul yordamida qilingan.&#x20;

![wordcloud moduli mahsuli](/files/-MVZ0KjYFs9RPPdaglja)

`wordcloud` moduli grafiklarni chizishga mo'ljallangan `matplotlib` moduli bilan hamkorlikda ishlaydi.&#x20;

Quyida kun.uz sahifasidan olingan yangiliklar uchun so'zlar bulutini yaratishni ko'ramiz.

```python
import requests

from bs4 import BeautifulSoup
from wordcloud import WordCloud 
import matplotlib.pyplot as plt 

sahifa = "https://kun.uz/news/main"
r = requests.get(sahifa)

soup = BeautifulSoup(r.text, 'html.parser')
news = soup.find_all(class_="news-title")
matn=""
for n in news:
    matn += n.text

# kerakmas so'zlar
stopwords = ["учун","бўйича","лекин","билан","ва","бор","ҳам","хил","йил"]
# bulutni yaratamiz
wordcloud = WordCloud(width = 1000, height = 1000, 
                background_color ='white', 
                stopwords = stopwords, 
                min_font_size = 20).generate(matn) 
  
# plot the WordCloud image                        
plt.figure(figsize = (8, 8), facecolor = None) 
plt.imshow(wordcloud) 
plt.axis("off") 
plt.tight_layout(pad = 0) 
plt.show() 
```

![kun.uz da so'nggi yangiliklar](/files/-MVZ2fE0ne2Qvq3sYYxz)

## fuzzywuzzy

`pip install fuzzywuzzy`

Bu modul yordamida so'zlarni bir-biriga solishtirish yoki matnlar tarkibida kerakli so'zni topishda foydalanamiz.&#x20;

Quyidagi misolda "salom" so'zini "assalom" va "salim" so'zlari bilan naqadar o'xshashligini tekshrib ko'ramiz:

```python
from fuzzywuzzy import fuzz
print(fuzz.ratio("salom",'assalom'))
print(fuzz.ratio("salom","salim"))
```

Natija:&#x20;

```python
83
80
```

Keling endi so'zlar orasidan o'xshash so'zlarni topishni ko'ramiz. Buning uchun avvalgi darslarimizdagi [uzwords](https://github.com/anvarnarz/uzwords) modulidan foydalanamiz. Ro'yxatdan bir nechta so'zlarni ajratib olish uchun `.process.extract()` funksiyasiga murojat qilamiz.

```python
from fuzzywuzzy import process
from uzwords import words

# Matnlar orasidan 3 ta eng o'xshashlarini ajratib olish
text = "салом"
matches = process.extract(text, words, limit=3)
print(matches)
```

Natija: `[('салом', 100), ('салдом', 91), ('слалом', 91)]`

Agar yagona so'zni tanlab olish talab qilinsa `extractOne()` metodini chaqiramiz:

```python
# Matnlar orasidan eng o'xshashini topish
text = "талба"
match = process.extractOne(text,words)
print(match)
```

Natija: `('талаба', 91)`

## wxPython

`pip install wxPython`

wxPython paketi deyarli barcha operatsion tizimlarda ishlaydigan grafik interfeysli dasturlar yaratish uchun mo'ljallangan. Bu paket haqida alohida darsliklar qilish mumkin, shuning uchun biz faqatgina bitta misol bilan chegralanamiz.

```python
import wx
from googletrans import Translator

tarjimon = Translator()
class MyFrame(wx.Frame):    
    def __init__(self):
        super().__init__(parent=None, title='Oʻzbek-Ingliz Lugʻat')
        panel = wx.Panel(self)        
        my_sizer = wx.BoxSizer(wx.VERTICAL)        
        self.text_ctrl = wx.TextCtrl(panel)
        my_sizer.Add(self.text_ctrl, 0, wx.ALL | wx.EXPAND, 5)        
        
        my_btn = wx.Button(panel, label='TARJIMA')
        my_btn.Bind(wx.EVT_BUTTON, self.on_press)
        my_sizer.Add(my_btn, 0, wx.ALL | wx.CENTER, 5)        
        
        self.text_out = wx.TextCtrl(panel,style = wx.TE_READONLY)        
        my_sizer.Add(self.text_out, 0, wx.ALL | wx.EXPAND, 5)         
        panel.SetSizer(my_sizer)        
        self.Show()

    def on_press(self, event):
        value = self.text_ctrl.GetValue()
        if not value:                       
            self.text_out.SetValue("Soʻz kiritmadingiz")
        else:
            tarjima = tarjimon.translate(value, src='uz', dest='en')
            self.text_out.SetValue(tarjima.text.capitalize()) 
    

if __name__ == '__main__':
    app = wx.App()
    frame = MyFrame()
    app.MainLoop()
```

![wxPython asosida yaratilgan sodda dastur](/files/-MVZdLPtLpxlgy5jH1GB)

## openCV

`pip install opencv-python`

openCV bu kompyuter yordamida rasm va video tasvirlar bilan ishlash uchun maxsus kutubxona. Bugungi kunda sun'iy intellekt yordamida tasvirlar bilan ishlaydigan dasturlarning deyarli barchasi openCV yordamida yaratiladi.&#x20;

Bu dastur yordamida rasm va videolardagi turli obyektlarni "ko'rish", ajratib olish mumkin. Avtomobillar nomerini aniqlash, odamlarning yuzidan tanish, obyektlarni klassifikasiya qilish kabi dasturlarning kasari aynan openCV kutubxonasi yordamida ishlaydi.

![openCV kutubxonasi yordamida obyektlarni klassifikasiya qilish](/files/-MVZfEiZbukTd3GPyULb)

Bu kutubxona haqida kelajakda Sun'iy Intellektga bag'ishlangan darsliklarimizda alohida batafsil to'xtalamiz. Hozircha esa quyidagi dastur yordamida videodagi odamlarning yuzi va ko'zini ajratishga misol ko'ramiz.

```python
import cv2

cap = cv2.VideoCapture(0)
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
eye_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_eye.xml')

while True:
    ret, frame = cap.read()

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, 1.3, 5)
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 5)
        roi_gray = gray[y:y+w, x:x+w]
        roi_color = frame[y:y+h, x:x+w]
        eyes = eye_cascade.detectMultiScale(roi_gray, 1.3, 5)
        for (ex, ey, ew, eh) in eyes:
            cv2.rectangle(roi_color, (ex, ey), (ex + ew, ey + eh), (0, 255, 0), 5)

    cv2.imshow('frame', frame)

    if cv2.waitKey(1) == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()

# copyright Tim Ruscia aka techwithtim
# code from https://github.com/techwithtim/OpenCV-Tutorials
```

Natija:

![openCV yordamida videoda yuz va ko'zni aniqlash](/files/-MVZgBCLAEEZY6O62z9J)

## KODLAR

---''',
    vocabularyRaw: '''pip install	Tashqi kutubxonani o\'rnatish buyrug\'i	pip install requests
venv	Virtual muhit yaratish moduli (Virtual Environment)	python -m venv venv
requirements.txt	Loyiha kutubxonalari ro\'yxati fayli	pip freeze''',
    exercises: [
      Exercise(
        number: 1,
        question: '''requests kutubxonasini o\'rnatish buyrug\'ini yozing.''',
        answer: '''pip install requests''',
      ),
      Exercise(
        number: 2,
        question: '''Virtual muhit yaratish buyrug\'ini yozing.''',
        answer: '''python -m venv venv''',
      ),
    ],
  ),
  Lesson(
    lessonNumber: 40,
    title: '''So\'ngso\'z va Keyingi Qadamlar''',
    introduction: '''> For the complete documentation index, see [llms.txt](https://python.sariq.dev/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://python.sariq.dev/last-words/40-the-end.md).

---''',
    vocabularyRaw: '''Django	Pythonning eng kuchli web-freymvorki	djangoproject.com
FastAPI	Tezkor API yaratish freymvorki	fastapi
Pandas	Ma\'lumotlar tahlili (Data Science) kutubxonasi	import pandas as pd''',
    exercises: [
      Exercise(
        number: 1,
        question: '''Python tilini a\'lo baholarga o\'rganib tugatganingizni tasdiqlovchi so\'zni yozing.''',
        answer: '''tamom''',
      ),
      Exercise(
        number: 2,
        question: '''Django freymvorki qaysi soha uchun ishlatiladi?''',
        answer: '''web dasturlash''',
      ),
    ],
  ),
];
