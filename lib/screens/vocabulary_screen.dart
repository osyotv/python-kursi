import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:python_darslari/theme/theme.dart';

class VocabTerm {
  final String term;
  final String category;
  final String definition;
  final String example;

  const VocabTerm({
    required this.term,
    required this.category,
    required this.definition,
    required this.example,
  });
}

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'Barchasi';

  final List<VocabTerm> _glossary = const [
    VocabTerm(
      term: 'print()',
      category: 'Asosiy',
      definition: 'Ekranga matn yoki o\'zgaruvchi qiymatini chop etish buyrug\'i.',
      example: 'print("Salom Dunyo!")',
    ),
    VocabTerm(
      term: 'input()',
      category: 'Asosiy',
      definition: 'Foydalanuvchidan klaviatura orqali ma\'lumot kiritishni so\'rash buyrug\'i. Doimo matn (str) qaytaradi.',
      example: 'ism = input("Ismingiz nima? ")',
    ),
    VocabTerm(
      term: 'int()',
      category: 'Asosiy',
      definition: 'Matn ko\'rinishidagi sonni yoki kasr sonni butun songa (integer) aylantirish funksiyasi.',
      example: 'yosh = int("5")',
    ),
    VocabTerm(
      term: 'float()',
      category: 'Asosiy',
      definition: 'Butun sonni yoki matnni nuqtali kasr songa (float) aylantirish funksiyasi.',
      example: 'pi = float("3.14")',
    ),
    VocabTerm(
      term: 'str()',
      category: 'Asosiy',
      definition: 'Sonlarni yoki boshqa ma\'lumot turlarini matn (string) ko\'rinishiga o\'tkazish funksiyasi.',
      example: 'matn = str(100)',
    ),
    VocabTerm(
      term: 'if / else',
      category: 'Mantiq',
      definition: 'Shartlarni tekshirish operatorlari. Shart to\'g\'ri (True) bo\'lsa if, xato (False) bo\'lsa else qismi ishlaydi.',
      example: 'if yosh >= 5:\n    print("Ruxsat")\nelse:\n    print("Kichik")',
    ),
    VocabTerm(
      term: 'for',
      category: 'Mantiq',
      definition: 'Takrorlanuvchi elementlarni (ro\'yxat, matn, oraliq) aylanib chiqish uchun ishlatiladigan sikl operatori.',
      example: 'for i in range(1, 5):\n    print(i)',
    ),
    VocabTerm(
      term: 'while',
      category: 'Mantiq',
      definition: 'Berilgan shart to\'g\'ri (True) bo\'lib turguncha to\'xtovsiz ishlaydigan sikl operatori.',
      example: 'while yosh < 10:\n    yosh += 1',
    ),
    VocabTerm(
      term: 'list',
      category: 'To\'plamlar',
      definition: 'Bir nechta ma\'lumotlarni tartiblangan holda bitta o\'zgaruvchida saqlash turi. Elementlarini o\'zgartirish mumkin.',
      example: 'mevalar = ["olma", "banan", "uzum"]',
    ),
    VocabTerm(
      term: 'tuple',
      category: 'To\'plamlar',
      definition: 'Xuddi list kabi ishlaydigan, lekin qiymatlarini o\'zgartirib bo\'lmaydigan o\'zgarmas ro\'yxat turi.',
      example: 'ranglar = ("qizil", "yashil", "ko\'k")',
    ),
    VocabTerm(
      term: 'set',
      category: 'To\'plamlar',
      definition: 'Takrorlanmaydigan elementlardan tashkil topgan tartibsiz to\'plam turi. Takrorlarni o\'chirishda foydalaniladi.',
      example: 'raqamlar = {1, 2, 2, 3} # natija: {1, 2, 3}',
    ),
    VocabTerm(
      term: 'dict (dictionary)',
      category: 'To\'plamlar',
      definition: 'Kalit-qiymat (key-value) juftliklaridan iborat ma\'lumotlar lug\'ati. Kalitlar yordamida tezkor qidirish imkonini beradi.',
      example: 'odam = {"ism": "Ali", "yosh": 10}',
    ),
    VocabTerm(
      term: 'def',
      category: 'Funksiyalar',
      definition: 'Dasturda qayta-qayta ishlatiladigan nomlangan kod blokini (funksiya) yaratish operatori.',
      example: 'def salom_ber(ism):\n    print(f"Salom, {ism}!")',
    ),
    VocabTerm(
      term: 'open()',
      category: 'Fayllar',
      definition: 'Tashqi fayllarni ochish buyrug\'i. "r" o\'qish, "w" yangidan yozish, "a" davomidan qo\'shish rejimlarida ochiladi.',
      example: 'with open("f.txt", "w") as f:\n    f.write("Salom")',
    ),
    VocabTerm(
      term: 'read() / write()',
      category: 'Fayllar',
      definition: 'Ochiq fayldan ma\'lumotlarni o\'qish (read) va faylga ma\'lumot yozish (write) metodlari.',
      example: 'with open("fayl.txt", "r") as f:\n    matn = f.read()',
    ),
    VocabTerm(
      term: 'import',
      category: 'Modullar',
      definition: 'Tayyor yozilgan kod kutubxonalari yoki modullarni (math, random, datetime va h.k.) dasturga ulash buyrug\'i.',
      example: 'import math\nprint(math.sqrt(25))',
    ),
    VocabTerm(
      term: 'random.randint()',
      category: 'Modullar',
      definition: 'Berilgan ikkita butun son oralig\'idan tasodifiy butun son tanlab qaytaruvchi random moduli metodi.',
      example: 'son = random.randint(1, 10)',
    ),
    VocabTerm(
      term: 'random.choice()',
      category: 'Modullar',
      definition: 'Berilgan ro\'yxat (list) ichidan tasodifiy biror elementni tanlab beruvchi random moduli metodi.',
      example: 'tanlov = random.choice(["Tosh", "Qog\'oz"])',
    ),
    VocabTerm(
      term: 'datetime.datetime.now()',
      category: 'Modullar',
      definition: 'Hozirgi aniq vaqt va sanani (yil, oy, kun, soat, daqiqa) qaytaruvchi datetime moduli metodi.',
      example: 'hozir = datetime.datetime.now()\nprint(hozir.year)',
    ),
    VocabTerm(
      term: 'try / except',
      category: 'Professional',
      definition: 'Dasturda yuz berishi mumkin bo\'lgan xatoliklarni (Errors) ushlash va dastur qotib qolmasligining oldini olish operatorlari.',
      example: 'try:\n    son = 5 / 0\nexcept ZeroDivisionError:\n    print("Nolga bo\'lib bo\'lmaydi!")',
    ),
    VocabTerm(
      term: 'lambda',
      category: 'Funksiyalar',
      definition: 'Qisqa, bitta qatordan iborat nomsiz funksiyalar yaratish usuli. Odatda map() va filter() bilan birga ishlatiladi.',
      example: 'kvadrat = lambda x: x ** 2',
    ),
    VocabTerm(
      term: 'class',
      category: 'OOP',
      definition: 'Obyektga yo\'naltirilgan dasturlashda (OOP) yangi obyektlar yaratish uchun qolip (sinf) yaratish kalit so\'zi.',
      example: 'class Moshina:\n    def yur(self):\n        print("Moshina yurdi!")',
    ),
    VocabTerm(
      term: '__init__',
      category: 'OOP',
      definition: 'Sinfdan yangi obyekt yaratilgan paytda avtomatik ishga tushadigan va obyekt xususiyatlarini saqlaydigan maxsus metod.',
      example: 'def __init__(self, ism, yosh):\n    self.ism = ism\n    self.yosh = yosh',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter by query and category
    final filteredTerms = _glossary.where((item) {
      final matchesSearch = item.term.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.definition.toLowerCase().contains(_searchQuery.toLowerCase());
      
      final matchesCategory = _selectedCategory == 'Barchasi' || item.category == _selectedCategory;
      
      return matchesSearch && matchesCategory;
    }).toList();

    final categories = ['Barchasi', 'Asosiy', 'Mantiq', 'To\'plamlar', 'Funksiyalar', 'Fayllar', 'Modullar', 'Professional', 'OOP'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Python Lug\'ati'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search Box and Category filter scroll
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  // Search Bar
                  TextField(
                    controller: _searchController,
                    onChanged: (val) {
                      setState(() {
                        _searchQuery = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Buyruq yoki so\'zni izlang...',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                      prefixIcon: const Icon(Icons.search_rounded, color: AppTheme.textSecondary),
                      suffixIcon: _searchQuery.isNotEmpty 
                          ? IconButton(
                              icon: const Icon(Icons.clear_rounded, color: AppTheme.textSecondary),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: AppTheme.glassSurface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppTheme.glassBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppTheme.glassBorder),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Categories list scroll
                  SizedBox(
                    height: 36,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final cat = categories[index];
                        final isSelected = _selectedCategory == cat;

                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(
                              cat,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.black : AppTheme.textSecondary,
                              ),
                            ),
                            selected: isSelected,
                            selectedColor: AppTheme.neonCyan,
                            backgroundColor: AppTheme.glassSurface,
                            onSelected: (selected) {
                              if (selected) {
                                setState(() {
                                  _selectedCategory = cat;
                                });
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Glossary Terms List View
            Expanded(
              child: filteredTerms.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      itemCount: filteredTerms.length,
                      itemBuilder: (context, index) {
                        final item = filteredTerms[index];
                        return _buildVocabCard(context, item);
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off_rounded, size: 48, color: Colors.white.withOpacity(0.2)),
                          const SizedBox(height: 12),
                          const Text(
                            'Hech narsa topilmadi',
                            style: TextStyle(color: AppTheme.textSecondary),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVocabCard(BuildContext context, VocabTerm item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row with command name and category tag
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.term,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.neonCyan,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.neonPurple.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppTheme.neonPurple.withOpacity(0.2)),
                  ),
                  child: Text(
                    item.category,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.neonPurple,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Definition Text
            Text(
              item.definition,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 14),

            // Code Example glass container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF070913),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.glassBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'MISOL:',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textMuted,
                          fontFamily: 'monospace',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: item.example));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 600),
                              content: Text('Kod nusxalandi!'),
                            ),
                          );
                        },
                        child: const Icon(Icons.copy_rounded, color: AppTheme.textMuted, size: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.example,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      color: Color(0xFF81D4FA),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
