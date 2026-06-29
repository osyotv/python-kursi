import 'dart:math';
import 'package:python_darslari/data/lessons_data.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}

class QuizGenerator {
  // Generates exactly 50 multiple choice questions for a block of 5 lessons
  static List<QuizQuestion> generateBlockQuiz(int examNumber, List<Lesson> blockLessons) {
    final rand = Random(); // UNSEEDED: guarantees completely dynamic shuffling every time
    final List<QuizQuestion> pool = [];

    for (var lesson in blockLessons) {
      // 1. Process Vocabulary
      final List<Map<String, String>> vocabItems = [];
      if (lesson.vocabularyRaw.isNotEmpty) {
        final lines = lesson.vocabularyRaw.split('\n');
        for (var line in lines) {
          final parts = line.split('\t');
          if (parts.length >= 2) {
            vocabItems.add({
              'term': parts[0].trim(),
              'def': parts[1].trim(),
            });
          }
        }
      }

      // Generate vocabulary matching questions
      if (vocabItems.isNotEmpty) {
        for (var item in vocabItems) {
          final term = item['term']!;
          final correctDef = item['def']!;
          
          // Truncate overly long definitions for clean MCQ rendering
          final cleanDef = correctDef.length > 80 ? '${correctDef.substring(0, 77)}...' : correctDef;

          // Find distractors
          final distractors = vocabItems
              .where((x) => x['def'] != correctDef)
              .map((x) => x['def']!.length > 80 ? '${x['def']!.substring(0, 77)}...' : x['def']!)
              .toList();
          
          while (distractors.length < 3) {
            distractors.add('Noto\'g\'ri / boshqa operator ta\'rifi');
            distractors.add('Hech qanday maxsus ma\'noga ega emas');
            distractors.add('None/pass kalit so\'zi');
          }
          distractors.shuffle(rand);

          // Build option list and shuffle dynamically
          final options = [cleanDef, distractors[0], distractors[1], distractors[2]];
          options.shuffle(rand);
          final correctIdx = options.indexOf(cleanDef);

          pool.add(QuizQuestion(
            question: '"$term" atamasining to\'g\'ri ta\'rifini belgilang:',
            options: options,
            correctOptionIndex: correctIdx,
          ));

          // Option matching in reverse
          final distTerms = vocabItems
              .where((x) => x['term'] != term)
              .map((x) => x['term']!)
              .toList();
          while (distTerms.length < 3) {
            distTerms.add('pass');
            distTerms.add('None');
            distTerms.add('break');
          }
          distTerms.shuffle(rand);

          final optionsTerms = [term, distTerms[0], distTerms[1], distTerms[2]];
          optionsTerms.shuffle(rand);
          final correctIdxTerm = optionsTerms.indexOf(term);

          pool.add(QuizQuestion(
            question: '"$cleanDef" ta\'rifi qaysi operator yoki atamaga tegishli?',
            options: optionsTerms,
            correctOptionIndex: correctIdxTerm,
          ));
        }
      }

      // 2. Generate questions from Exercises (predict code result)
      for (var ex in lesson.exercises) {
        final code = ex.answer.trim();
        final questionText = ex.question.trim();

        if (code.isNotEmpty && !code.startsWith('#')) {
          final distractors = lesson.exercises
              .where((x) => x.answer.trim() != code)
              .map((x) => x.answer.trim())
              .toList();
          
          while (distractors.length < 3) {
            distractors.add('SyntaxError (kodda sintaktik xato bor)');
            distractors.add('Dasturda hech narsa chop etilmaydi');
            distractors.add('O\'zgaruvchi e\'lon qilinmagan xatoligi');
          }
          distractors.shuffle(rand);

          final options = [code, distractors[0], distractors[1], distractors[2]];
          options.shuffle(rand);
          final correctIdx = options.indexOf(code);

          pool.add(QuizQuestion(
            question: 'Ushbu topshiriq uchun to\'g\'ri Python kodini belgilang:\n"$questionText"',
            options: options,
            correctOptionIndex: correctIdx,
          ));
        }
      }

      // 3. Fallback Pool of topic-based questions matching the module
      final topicPool = _getTopicQuestions(lesson.lessonNumber);
      for (var q in topicPool) {
        // Shuffle options for the topic question to randomize correct indexes completely
        final correctText = q.options[q.correctOptionIndex];
        final options = List<String>.from(q.options);
        options.shuffle(rand);
        final newCorrectIdx = options.indexOf(correctText);

        pool.add(QuizQuestion(
          question: q.question,
          options: options,
          correctOptionIndex: newCorrectIdx,
        ));
      }
    }

    // 4. Shuffle the entire question pool dynamically
    pool.shuffle(rand);

    final List<QuizQuestion> finalQuestions = [];
    for (var q in pool) {
      if (!finalQuestions.any((x) => x.question == q.question)) {
        finalQuestions.add(q);
      }
      if (finalQuestions.length == 50) break;
    }

    // If still under 50, pull from generic pool
    if (finalQuestions.length < 50) {
      final genericPool = _getGenericPythonQuestions();
      genericPool.shuffle(rand);
      
      int idx = 0;
      while (finalQuestions.length < 50 && idx < genericPool.length) {
        final genQ = genericPool[idx++];
        if (!finalQuestions.any((x) => x.question == genQ.question)) {
          // Shuffle options for the generic question
          final correctText = genQ.options[genQ.correctOptionIndex];
          final options = List<String>.from(genQ.options);
          options.shuffle(rand);
          final newCorrectIdx = options.indexOf(correctText);

          finalQuestions.add(QuizQuestion(
            question: genQ.question,
            options: options,
            correctOptionIndex: newCorrectIdx,
          ));
        }
      }
    }

    // Hard fallback to hit exactly 50
    while (finalQuestions.length < 50) {
      final options = ['Guido van Rossum', 'Dennis Ritchie', 'Bjarne Stroustrup', 'James Gosling'];
      options.shuffle(rand);
      final idx = options.indexOf('Guido van Rossum');

      finalQuestions.add(QuizQuestion(
        question: 'Python dasturlash tilining yaratuvchisi kim?',
        options: options,
        correctOptionIndex: idx,
      ));
    }

    return finalQuestions;
  }

  static List<QuizQuestion> _getTopicQuestions(int lessonNum) {
    if (lessonNum <= 5) {
      return [
        const QuizQuestion(
          question: 'Python sintaksisida bir qatorli sharhlar (comments) yozish uchun qaysi belgidan foydalaniladi?',
          options: ['#', '//', '/*', '<!--'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'print("3 * 4") kodi konsolga nima chop etadi?',
          options: ['3 * 4', '12', 'SyntaxError', 'Noma\'lum'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Pythonda sonni darajaga ko\'tarish operatori qaysi?',
          options: ['**', '^', '^2', 'pow'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Pythonda qoldiqli bo\'lish operatorini ko\'rsating:',
          options: ['%', '/', '//', '&'],
          correctOptionIndex: 0,
        ),
      ];
    } else if (lessonNum <= 10) {
      return [
        const QuizQuestion(
          question: 'Butun sonlar ma\'lumot turi qanday ataladi?',
          options: ['int', 'float', 'string', 'double'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Qaysi o\'zgaruvchi nomi XATO e\'lon qilingan?',
          options: ['2_user_name', 'user_name', '_user', 'userName'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'f-string yordamida matnni formatlash qaysi qatorda to\'g\'ri yozilgan?',
          options: ['f"Salom {ism}"', '"Salom {ism}"', 'f(Salom {ism})', 'str("Salom " + ism)'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Matndagi barcha harflarni kattaga o\'tkazuvchi metod qaysi?',
          options: ['.upper()', '.lower()', '.title()', '.capitalize()'],
          correctOptionIndex: 0,
        ),
      ];
    } else if (lessonNum <= 15) {
      return [
        const QuizQuestion(
          question: 'Ro\'yxat (List) yaratish uchun qaysi qavslardan foydalaniladi?',
          options: ['[ ]', '( )', '{ }', '< >'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Ro\'yxat oxiriga yangi element qo\'shish metodi qaysi?',
          options: ['.append()', '.insert()', '.add()', '.push()'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Tuple (o\'zgarmas ro\'yxat) elementlarini o\'zgartirish mumkinmi?',
          options: ['Yo\'q, o\'zgartirib bo\'lmaydi', 'Ha, indeks orqali', 'Faqat oxiriga qo\'shish mumkin', 'Ha, .update() bilan'],
          correctOptionIndex: 0,
        ),
      ];
    } else if (lessonNum <= 20) {
      return [
        const QuizQuestion(
          question: 'Taqqoslash operatorlarida "teng emas" sharti qanday yoziladi?',
          options: ['!=', '<>', '==', 'not'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Ko\'p tarmoqli shart zanjirida if-else orasida qaysi operator ishlatiladi?',
          options: ['elif', 'else if', 'elseif', 'or'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'not True ifodasi nima qaytaradi?',
          options: ['False', 'True', 'None', 'SyntaxError'],
          correctOptionIndex: 0,
        ),
      ];
    } else if (lessonNum <= 25) {
      return [
        const QuizQuestion(
          question: 'Dictionary (Lug\'at) yaratish uchun qaysi qavslardan foydalaniladi?',
          options: ['{ }', '[ ]', '( )', 'dict( )'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Set (To\'plam) ma\'lumot turining o\'ziga xosligi nima?',
          options: ['Elementlar takrorlanmaydi', 'Elementlari o\'zgarmasdir', 'Tartiblangan ro\'yxatdir', 'Kalit va qiymatdan iborat'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Lug\'atning barcha kalitlarini olish metodi qaysi?',
          options: ['.keys()', '.values()', '.items()', '.get()'],
          correctOptionIndex: 0,
        ),
      ];
    } else if (lessonNum <= 30) {
      return [
        const QuizQuestion(
          question: 'Funksiya yaratish uchun qaysi kalit so\'z ishlatiladi?',
          options: ['def', 'function', 'func', 'lambda'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Funksiyadan qiymat qaytarish uchun qaysi buyruq yoziladi?',
          options: ['return', 'get', 'output', 'print'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Nomsiz, qisqa bir qatorli funksiyalar nima deb ataladi?',
          options: ['lambda', 'def', 'inline', 'anonymous'],
          correctOptionIndex: 0,
        ),
      ];
    } else if (lessonNum <= 35) {
      return [
        const QuizQuestion(
          question: 'Klass yaratish uchun qaysi kalit so\'zdan foydalaniladi?',
          options: ['class', 'def', 'struct', 'object'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Konstruktor metodi (obyekt yaratilganda avtomatik ishlaydigan) qanday yoziladi?',
          options: ['__init__', '__new__', 'constructor', 'init'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Klass metodida birinchi parametr sifatida o\'sha obyektning o\'zini ko\'rsatuvchi o\'zgaruvchi nomi?',
          options: ['self', 'this', 'object', 'me'],
          correctOptionIndex: 0,
        ),
      ];
    } else {
      return [
        const QuizQuestion(
          question: 'Faylni ochganda uni avtomatik tarzda yopilishini ta\'minlovchi blok nomi?',
          options: ['with', 'open', 'try', 'file'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'JSON faylidan ma\'lumotni o\'qib, Python dict turiga o\'tkazuvchi funksiya qaysi?',
          options: ['json.load()', 'json.dump()', 'json.loads()', 'json.dumps()'],
          correctOptionIndex: 0,
        ),
        const QuizQuestion(
          question: 'Xatolar bilan ishlashda, xato yuz berganda ishlaydigan blok qaysi?',
          options: ['except', 'try', 'finally', 'catch'],
          correctOptionIndex: 0,
        ),
      ];
    }
  }

  static List<QuizQuestion> _getGenericPythonQuestions() {
    return [
      const QuizQuestion(
        question: 'Python tili qachon yaratilgan?',
        options: ['1991-yil', '1985-yil', '2000-yil', '1995-yil'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'Python tili qaysi dasturlash tili oilasiga kiradi?',
        options: ['Yuqori darajadagi interpretatsiya qilinadigan til', 'Past darajadagi mashina tili', 'Kompilyatsiya qilinadigan statik til', 'Faqat scripting tili'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'Matnli ma\'lumotlar turi Pythonda qanday belgilanadi?',
        options: ['str', 'string', 'text', 'char'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: '10 // 3 ifodasi qanday natija qaytaradi?',
        options: ['3', '3.333', '1', '4'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: '10 % 3 ifodasining natijasi qanday bo\'ladi?',
        options: ['1', '3', '0', '2'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'len("Salom") funksiyasi qanday javob qaytaradi?',
        options: ['5', '6', 'Salom', 'ValueError'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'Ro\'yxatning birinchi elementining indeksi nechaga teng?',
        options: ['0', '1', '-1', '0.0'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'Ro\'yxatning oxirgi elementiga qaysi indeks orqali murojaat qilinadi?',
        options: ['-1', '0', 'last', 'len(list)'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'Qaysi kalit so\'z tsikl qadamini o\'tkazib yuborib keyingi qadamga o\'tadi?',
        options: ['continue', 'break', 'pass', 'next'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'Mantiqiy "rost" qiymati Pythonda qanday yoziladi?',
        options: ['True', 'true', '1', 'Correct'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'Mantiqiy "yolg\'on" qiymati qaysi qatorda to\'g\'ri yozilgan?',
        options: ['False', 'false', '0', 'Wrong'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'Qaysi operator shartli tsikl yaratadi?',
        options: ['while', 'for', 'if', 'loop'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'Ro\'yxatdan elementni indeks bo\'yicha o\'chirib tashlaydigan metod nomi?',
        options: ['.pop()', '.remove()', '.delete()', '.clear()'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'Foydalanuvchidan ma\'lumot qabul qiluvchi standart funksiya qaysi?',
        options: ['input()', 'read()', 'get()', 'scan()'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'Python nima uchun "Indentation" (surish) dan foydalanadi?',
        options: ['Kod bloklarini guruhlash uchun', 'Faqat dizayn uchun', 'Tezlikni oshirish uchun', 'Kompilyatsiya qoidasi uchun'],
        correctOptionIndex: 0,
      ),
      const QuizQuestion(
        question: 'range(1, 5) qaysi sonlarni o\'z ichiga oladi?',
        options: ['1, 2, 3, 4', '1, 2, 3, 4, 5', '2, 3, 4', '0, 1, 2, 3, 4'],
        correctOptionIndex: 0,
      ),
    ];
  }
}
