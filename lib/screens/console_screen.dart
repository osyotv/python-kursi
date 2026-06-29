import 'package:flutter/material.dart';
import 'package:python_darslari/theme/theme.dart';
import 'dart:math' as dart_math;

class ConsoleScreen extends StatefulWidget {
  final String? preloadedCode;

  const ConsoleScreen({super.key, this.preloadedCode});

  @override
  State<ConsoleScreen> createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {
  final TextEditingController _codeController = TextEditingController();
  final List<String> _consoleLogs = [
    'Python 3.14.3 Simulated Terminal',
    'Advanced Block-Structured Python Interpreter Active.',
    'Supports: variables, loops, if/else, functions, lambdas, map/filter, try/except & OOP Classes!',
    'Type your code and tap Run...',
    ''
  ];

  @override
  void initState() {
    super.initState();
    if (widget.preloadedCode != null) {
      _codeController.text = widget.preloadedCode!;
    }
  }

  void _clearConsole() {
    setState(() {
      _consoleLogs.clear();
      _consoleLogs.addAll([
        'Python 3.14.3 Simulated Terminal',
        'Console cleared.',
        ''
      ]);
    });
  }

  void _runSimulatedPython() {
    final code = _codeController.text;
    if (code.trim().isEmpty) return;

    setState(() {
      _consoleLogs.add('>>> Running script...');
    });

    final interpreter = PythonInterpreter();
    final outputs = interpreter.run(code);

    setState(() {
      _consoleLogs.addAll(outputs);
      _consoleLogs.add(''); // Add spacer line
    });
  }

  void _loadTemplate(String code) {
    setState(() {
      _codeController.text = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Python Konsoli'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: _clearConsole,
            tooltip: 'Konsolni tozalash',
          ),
        ],
      ),
      body: Column(
        children: [
          // Template shortcuts bar
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: const Color(0xFF131625),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildTemplateChip('if / else', 'yosh = 7\nif yosh >= 18:\n    print("Ruxsat")\nelif yosh >= 7:\n    print("Maktab yoshi")\nelse:\n    print("Kichik")'),
                _buildTemplateChip('for loops', 'sonlar = [1, 2, 3]\nfor s in sonlar:\n    print(s * 2)\n    print("Aylanish tugadi")'),
                _buildTemplateChip('def functions', 'def qoshish(a, b):\n    return a + b\n\nnatija = qoshish(5, 12)\nprint("Yig\'indi: " + str(natija))'),
                _buildTemplateChip('Lambda Map', 'sonlar = [1, 2, 3]\ndubl = list(map(lambda x: x * 2, sonlar))\nprint(dubl)'),
                _buildTemplateChip('OOP Classes', 'class Moshina:\n    def __init__(self, rusumi, rangi):\n        self.rusumi = rusumi\n        self.rangi = rangi\n    def yur(self):\n        print(self.rangi + " " + self.rusumi + " yurdi!")\n\nm = Moshina("Malibu", "Qora")\nm.yur()'),
                _buildTemplateChip('try / except', 'try:\n    print(5 / 0)\nexcept ZeroDivisionError:\n    print("Nolga bo\'lib bo\'lmaydi!")'),
              ],
            ),
          ),

          // Code Editor TextField
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Container(
                  color: const Color(0xFF070913),
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _codeController,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 15,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    maxLines: null,
                    minLines: 30,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: '# Bu yerga Python kodingizni yozing...\nprint("Salom Python")',
                      hintStyle: TextStyle(color: Color(0xFF3B4254)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton.extended(
                    onPressed: _runSimulatedPython,
                    backgroundColor: AppTheme.neonCyan,
                    foregroundColor: Colors.black,
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: const Text('RUN', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Container(
            height: 1,
            color: AppTheme.glassBorder,
          ),

          // Terminal Output log
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              color: const Color(0xFF030408),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TERMINAL OUTPUT',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textMuted,
                          letterSpacing: 1.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _consoleLogs.clear();
                          });
                        },
                        child: const Text(
                          'CLEAR OUTPUT',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.neonPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _consoleLogs.length,
                      itemBuilder: (context, index) {
                        final log = _consoleLogs[index];
                        final isError = log.startsWith('Error:') || log.contains('Error:');
                        final isHeader = log.startsWith('Python 3.14.3') || log.startsWith('Advanced Block');
                        
                        Color logColor = const Color(0xFFE2E8F0);
                        if (isError) logColor = AppTheme.errorRed;
                        if (isHeader) logColor = AppTheme.textMuted;
                        if (log.startsWith('>>>')) logColor = AppTheme.neonCyan;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            log,
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 13,
                              color: logColor,
                              fontWeight: log.startsWith('>>>') ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemplateChip(String label, String code) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ActionChip(
        backgroundColor: AppTheme.glassSurface,
        side: const BorderSide(color: AppTheme.glassBorder),
        label: Text(
          label,
          style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary),
        ),
        onPressed: () => _loadTemplate(code),
      ),
    );
  }
}

// ----------------------------------------------------
// ADVANCED PYTHON INTERPRETER SYSTEM FOR DART / FLUTTER
// ----------------------------------------------------

class Context {
  final Context? parent;
  final Map<String, dynamic> variables = {};

  Context({this.parent});

  dynamic lookup(String name) {
    if (variables.containsKey(name)) {
      return variables[name];
    }
    if (parent != null) {
      return parent!.lookup(name);
    }
    return null;
  }

  void assign(String name, dynamic value) {
    variables[name] = value;
  }
}

class PythonFunction {
  final String name;
  final List<String> parameters;
  final List<Statement> body;

  PythonFunction(this.name, this.parameters, this.body);
}

class PythonClass {
  final String name;
  final Map<String, PythonFunction> methods = {};

  PythonClass(this.name);
}

class PythonInstance {
  final PythonClass klass;
  final Map<String, dynamic> fields = {};

  PythonInstance(this.klass);
}

class LambdaVal {
  final List<String> parameters;
  final String expression;

  LambdaVal(this.parameters, this.expression);
}

// AST Nodes
abstract class Statement {
  void execute(Context ctx, PythonInterpreter interp);
}

class BlockStatement extends Statement {
  final List<Statement> statements = [];

  @override
  void execute(Context ctx, PythonInterpreter interp) {
    for (var stmt in statements) {
      if (interp.hasReturned) return;
      stmt.execute(ctx, interp);
    }
  }
}

class PrintStatement extends Statement {
  final String expression;
  PrintStatement(this.expression);

  @override
  void execute(Context ctx, PythonInterpreter interp) {
    final val = interp.evaluate(expression, ctx);
    interp.log(val.toString());
  }
}

class AssignmentStatement extends Statement {
  final String name;
  final String expression;
  AssignmentStatement(this.name, this.expression);

  @override
  void execute(Context ctx, PythonInterpreter interp) {
    final val = interp.evaluate(expression, ctx);
    if (name.startsWith('self.')) {
      final selfObj = ctx.lookup('self');
      if (selfObj is PythonInstance) {
        final fieldName = name.substring(5).trim();
        selfObj.fields[fieldName] = val;
      }
    } else {
      ctx.assign(name, val);
    }
  }
}

class IfStatement extends Statement {
  final String condition;
  final List<Statement> ifBody;
  final List<ElifBranch> elifBranches;
  final List<Statement> elseBody;

  IfStatement(this.condition, this.ifBody, this.elifBranches, this.elseBody);

  @override
  void execute(Context ctx, PythonInterpreter interp) {
    final condVal = interp.evaluate(condition, ctx);
    if (interp.isTruthy(condVal)) {
      final localCtx = Context(parent: ctx);
      for (var stmt in ifBody) {
        if (interp.hasReturned) return;
        stmt.execute(localCtx, interp);
      }
      return;
    }

    for (var elif in elifBranches) {
      final elifCond = interp.evaluate(elif.condition, ctx);
      if (interp.isTruthy(elifCond)) {
        final localCtx = Context(parent: ctx);
        for (var stmt in elif.body) {
          if (interp.hasReturned) return;
          stmt.execute(localCtx, interp);
        }
        return;
      }
    }

    if (elseBody.isNotEmpty) {
      final localCtx = Context(parent: ctx);
      for (var stmt in elseBody) {
        if (interp.hasReturned) return;
        stmt.execute(localCtx, interp);
      }
    }
  }
}

class ElifBranch {
  final String condition;
  final List<Statement> body;
  ElifBranch(this.condition, this.body);
}

class ForStatement extends Statement {
  final String loopVar;
  final String iterableExpr;
  final List<Statement> body;

  ForStatement(this.loopVar, this.iterableExpr, this.body);

  @override
  void execute(Context ctx, PythonInterpreter interp) {
    final iterVal = interp.evaluate(iterableExpr, ctx);
    if (iterVal is Iterable) {
      for (var val in iterVal) {
        if (interp.hasReturned) return;
        final localCtx = Context(parent: ctx);
        localCtx.assign(loopVar, val);
        for (var stmt in body) {
          if (interp.hasReturned) return;
          stmt.execute(localCtx, interp);
        }
      }
    }
  }
}

class WhileStatement extends Statement {
  final String condition;
  final List<Statement> body;

  WhileStatement(this.condition, this.body);

  @override
  void execute(Context ctx, PythonInterpreter interp) {
    int maxIterations = 1000; // Prevent infinite loops
    int iterations = 0;
    
    while (interp.isTruthy(interp.evaluate(condition, ctx))) {
      if (interp.hasReturned) return;
      iterations++;
      if (iterations > maxIterations) {
        throw Exception("RuntimeError: Maximum recursion depth / infinite loop detected");
      }
      final localCtx = Context(parent: ctx);
      for (var stmt in body) {
        if (interp.hasReturned) return;
        stmt.execute(localCtx, interp);
      }
    }
  }
}

class ReturnStatement extends Statement {
  final String expression;
  ReturnStatement(this.expression);

  @override
  void execute(Context ctx, PythonInterpreter interp) {
    interp.returnValue = interp.evaluate(expression, ctx);
    interp.hasReturned = true;
  }
}

class DefStatement extends Statement {
  final String name;
  final List<String> parameters;
  final List<Statement> body;

  DefStatement(this.name, this.parameters, this.body);

  @override
  void execute(Context ctx, PythonInterpreter interp) {
    final func = PythonFunction(name, parameters, body);
    interp.functions[name] = func;
  }
}

class ClassStatement extends Statement {
  final String name;
  final List<Statement> body;

  ClassStatement(this.name, this.body);

  @override
  void execute(Context ctx, PythonInterpreter interp) {
    final klass = PythonClass(name);
    interp.classes[name] = klass;

    // Execute class body to populate methods
    for (var stmt in body) {
      if (stmt is DefStatement) {
        klass.methods[stmt.name] = PythonFunction(stmt.name, stmt.parameters, stmt.body);
      }
    }
  }
}

class TryExceptStatement extends Statement {
  final List<Statement> tryBody;
  final String exceptErrorType;
  final List<Statement> exceptBody;

  TryExceptStatement(this.tryBody, this.exceptErrorType, this.exceptBody);

  @override
  void execute(Context ctx, PythonInterpreter interp) {
    try {
      final localCtx = Context(parent: ctx);
      for (var stmt in tryBody) {
        if (interp.hasReturned) return;
        stmt.execute(localCtx, interp);
      }
    } catch (e) {
      // Simulate matching specific exception types
      final err = e.toString();
      bool isMatch = false;
      if (exceptErrorType == 'ZeroDivisionError' && err.contains('ZeroDivisionError')) isMatch = true;
      if (exceptErrorType == 'ValueError' && err.contains('ValueError')) isMatch = true;
      if (exceptErrorType == 'IndexError' && err.contains('IndexError')) isMatch = true;
      if (exceptErrorType == 'KeyError' && err.contains('KeyError')) isMatch = true;
      if (exceptErrorType == 'NameError' && err.contains('NameError')) isMatch = true;
      if (exceptErrorType.isEmpty || exceptErrorType == 'Exception') isMatch = true;

      if (isMatch) {
        final localCtx = Context(parent: ctx);
        for (var stmt in exceptBody) {
          if (interp.hasReturned) return;
          stmt.execute(localCtx, interp);
        }
      } else {
        rethrow;
      }
    }
  }
}

class ExpressionStatement extends Statement {
  final String expression;
  ExpressionStatement(this.expression);

  @override
  void execute(Context ctx, PythonInterpreter interp) {
    interp.evaluate(expression, ctx);
  }
}

class PythonInterpreter {
  final Map<String, PythonFunction> functions = {};
  final Map<String, PythonClass> classes = {};
  final List<String> outputs = [];
  
  dynamic returnValue;
  bool hasReturned = false;

  void log(String msg) {
    outputs.add(msg);
  }

  bool isTruthy(dynamic val) {
    if (val == null) return false;
    if (val is bool) return val;
    if (val is num) return val != 0;
    if (val is String) return val.isNotEmpty;
    if (val is Iterable) return val.isNotEmpty;
    if (val is Map) return val.isNotEmpty;
    return true;
  }

  List<String> run(String script) {
    outputs.clear();
    functions.clear();
    classes.clear();
    returnValue = null;
    hasReturned = false;

    try {
      final statements = parseScript(script);
      final globalCtx = Context();
      
      for (var stmt in statements) {
        stmt.execute(globalCtx, this);
      }
    } catch (e) {
      final err = e.toString().replaceAll('Exception: ', '');
      outputs.add('Error: ${_translateErrorToUzbek(err)}');
    }

    return outputs;
  }

  String _translateErrorToUzbek(String err) {
    err = err.trim();
    if (err.startsWith('ZeroDivisionError:')) {
      return "NolgaBo'lishXatosi (ZeroDivisionError): Nolga bo'lish mumkin emas!";
    }
    if (err.startsWith('NameError:')) {
      final match = RegExp(r"name '([^']+)' is not defined").firstMatch(err);
      if (match != null) {
        final varName = match.group(1);
        return "NomXatosi (NameError): '$varName' nomli o'zgaruvchi yoki funksiya aniqlanmagan!";
      }
      return "NomXatosi (NameError): Aniqlanmagan nom ishlatildi!";
    }
    if (err.startsWith('TypeError:')) {
      if (err.contains('has no len()')) {
        final match = RegExp(r"object of type '([^']+)' has no len\(\)").firstMatch(err);
        final typeStr = match != null ? match.group(1) : 'noma\'lum';
        return "TurXatosi (TypeError): '$typeStr' turidagi obyekt uchun len() funksiyasini ishlatib bo'lmaydi!";
      }
      if (err.contains('is not callable')) {
        return "TurXatosi (TypeError): Noto'g'ri ma'lumot turi! Obyekt funksiya kabi chaqiriluvchi emas!";
      }
      return "TurXatosi (TypeError): Noto'g'ri ma'lumot turi ishlatildi!";
    }
    if (err.startsWith('SyntaxError:')) {
      if (err.contains('invalid function declaration syntax')) {
        return "SintaksisXatosi (SyntaxError): Funksiyani e'lon qilishda xatolik! Masalan: def funksiya_nomi(): shaklida yozilishi kerak.";
      }
      if (err.contains('invalid class declaration syntax')) {
        return "SintaksisXatosi (SyntaxError): Sinf (class)ni e'lon qilishda xatolik! Masalan: class SinfNomi: shaklida yozilishi kerak.";
      }
      if (err.contains('invalid if condition format')) {
        return "SintaksisXatosi (SyntaxError): 'if' shart formatida xatolik! Masalan: if shart: ko'rinishida bo'lishi kerak.";
      }
      if (err.contains('invalid elif format')) {
        return "SintaksisXatosi (SyntaxError): 'elif' shart formatida xatolik! Masalan: elif shart: ko'rinishida bo'lishi kerak.";
      }
      if (err.contains('invalid for loop format')) {
        return "SintaksisXatosi (SyntaxError): 'for' sikl formatida xatolik! Masalan: for i in range(5): ko'rinishida bo'lishi kerak.";
      }
      if (err.contains('invalid while loop format')) {
        return "SintaksisXatosi (SyntaxError): 'while' sikl formatida xatolik! Masalan: while shart: ko'rinishida bo'lishi kerak.";
      }
      if (err.contains('invalid except format')) {
        return "SintaksisXatosi (SyntaxError): 'except' blok formatida xatolik! Masalan: except ErrorTuri: ko'rinishida bo'lishi kerak.";
      }
      return "SintaksisXatosi (SyntaxError): Kod sintaksisida xatolik mavjud!";
    }
    if (err.startsWith('RuntimeError:')) {
      if (err.contains('Maximum recursion depth / infinite loop detected')) {
        return "IshlashXatosi (RuntimeError): Cheksiz sikl yoki juda chuqur rekursiya aniqlandi!";
      }
      return "IshlashXatosi (RuntimeError): Dasturni ishlashida xatolik yuz berdi!";
    }
    if (err.startsWith('ValueError:')) {
      return "QiymatXatosi (ValueError): Noto'g'ri qiymat uzatildi!";
    }
    if (err.startsWith('IndexError:')) {
      return "IndeksXatosi (IndexError): Ro'yxat indeksi chegaradan chiqib ketdi!";
    }
    if (err.startsWith('KeyError:')) {
      return "KalitXatosi (KeyError): Lug'atda bunday kalit mavjud emas!";
    }
    return err;
  }

  // Parses python indentation blocks into Statements
  List<Statement> parseScript(String script) {
    final rawLines = script.split('\n');
    int index = 0;

    int getIndent(String line) {
      int count = 0;
      for (int i = 0; i < line.length; i++) {
        if (line[i] == ' ') count++;
        else if (line[i] == '\t') count += 4;
        else break;
      }
      return count;
    }

    List<Statement> parseBlock(int parentIndent) {
      List<Statement> block = [];
      while (index < rawLines.length) {
        final line = rawLines[index];
        final trimmed = line.trim();
        if (trimmed.isEmpty || trimmed.startsWith('#')) {
          index++;
          continue;
        }

        final indent = getIndent(line);
        if (indent <= parentIndent) {
          break; // Return control back to parent block parser
        }

        // 1. Function declaration def...
        if (trimmed.startsWith('def ')) {
          final defLine = trimmed;
          index++;
          final parenIdx = defLine.indexOf('(');
          final endParenIdx = defLine.indexOf('):');
          if (parenIdx == -1 || endParenIdx == -1) {
            throw Exception("SyntaxError: invalid function declaration syntax");
          }
          final name = defLine.substring(4, parenIdx).trim();
          final paramStr = defLine.substring(parenIdx + 1, endParenIdx).trim();
          final params = paramStr.isEmpty ? <String>[] : paramStr.split(',').map((e) => e.trim()).toList();
          
          final body = parseBlock(indent);
          block.add(DefStatement(name, params, body));
        }

        // 2. Class declaration class...
        else if (trimmed.startsWith('class ')) {
          final classLine = trimmed;
          index++;
          final colonIdx = classLine.indexOf(':');
          if (colonIdx == -1) throw Exception("SyntaxError: invalid class declaration syntax");
          final name = classLine.substring(6, colonIdx).trim();
          
          final body = parseBlock(indent);
          block.add(ClassStatement(name, body));
        }

        // 3. Conditional if...
        else if (trimmed.startsWith('if ')) {
          final ifLine = trimmed;
          index++;
          final colonIdx = ifLine.indexOf(':');
          if (colonIdx == -1) throw Exception("SyntaxError: invalid if condition format");
          final cond = ifLine.substring(3, colonIdx).trim();
          final ifBody = parseBlock(indent);

          List<ElifBranch> elifs = [];
          List<Statement> elseBody = [];

          // Lookahead for elif / else branches at the same indentation level
          while (index < rawLines.length) {
            final nextLine = rawLines[index];
            final nextTrimmed = nextLine.trim();
            if (nextTrimmed.isEmpty || nextTrimmed.startsWith('#')) {
              index++;
              continue;
            }

            final nextIndent = getIndent(nextLine);
            if (nextIndent != indent) break; // End of conditional branches structure

            if (nextTrimmed.startsWith('elif ')) {
              index++;
              final elifColon = nextTrimmed.indexOf(':');
              if (elifColon == -1) throw Exception("SyntaxError: invalid elif format");
              final elifCond = nextTrimmed.substring(5, elifColon).trim();
              final elifBody = parseBlock(indent);
              elifs.add(ElifBranch(elifCond, elifBody));
            } else if (nextTrimmed.startsWith('else:')) {
              index++;
              elseBody = parseBlock(indent);
              break; // Else branch always completes conditional checks
            } else {
              break;
            }
          }

          block.add(IfStatement(cond, ifBody, elifs, elseBody));
        }

        // 4. For loop loops
        else if (trimmed.startsWith('for ')) {
          final forLine = trimmed;
          index++;
          final inIdx = forLine.indexOf(' in ');
          final colonIdx = forLine.indexOf(':');
          if (inIdx == -1 || colonIdx == -1) throw Exception("SyntaxError: invalid for loop format");
          final loopVar = forLine.substring(4, inIdx).trim();
          final iterExpr = forLine.substring(inIdx + 4, colonIdx).trim();
          
          final body = parseBlock(indent);
          block.add(ForStatement(loopVar, iterExpr, body));
        }

        // 5. While loop loops
        else if (trimmed.startsWith('while ')) {
          final whileLine = trimmed;
          index++;
          final colonIdx = whileLine.indexOf(':');
          if (colonIdx == -1) throw Exception("SyntaxError: invalid while loop format");
          final cond = whileLine.substring(6, colonIdx).trim();
          
          final body = parseBlock(indent);
          block.add(WhileStatement(cond, body));
        }

        // 6. Try-except blocks
        else if (trimmed.startsWith('try:')) {
          index++;
          final tryBody = parseBlock(indent);
          String exceptErr = '';
          List<Statement> exceptBody = [];

          while (index < rawLines.length) {
            final nextLine = rawLines[index];
            final nextTrimmed = nextLine.trim();
            if (nextTrimmed.isEmpty || nextTrimmed.startsWith('#')) {
              index++;
              continue;
            }

            final nextIndent = getIndent(nextLine);
            if (nextIndent != indent) break;

            if (nextTrimmed.startsWith('except')) {
              index++;
              final colonIdx = nextTrimmed.indexOf(':');
              if (colonIdx == -1) throw Exception("SyntaxError: invalid except format");
              exceptErr = nextTrimmed.substring(6, colonIdx).trim();
              exceptBody = parseBlock(indent);
              break;
            } else {
              break;
            }
          }

          block.add(TryExceptStatement(tryBody, exceptErr, exceptBody));
        }

        // 7. Return statements
        else if (trimmed.startsWith('return ')) {
          final retExpr = trimmed.substring(7).trim();
          index++;
          block.add(ReturnStatement(retExpr));
        } else if (trimmed == 'return') {
          index++;
          block.add(ReturnStatement('None'));
        }

        // 8. Assignments & expressions
        else {
          index++;
          if (trimmed.contains('=')) {
            final eqIdx = trimmed.indexOf('=');
            // Make sure it is not comparison sign ==
            if (trimmed[eqIdx + 1] != '=') {
              final varName = trimmed.substring(0, eqIdx).trim();
              final expr = trimmed.substring(eqIdx + 1).trim();
              block.add(AssignmentStatement(varName, expr));
              continue;
            }
          }
          block.add(ExpressionStatement(trimmed));
        }
      }
      return block;
    }

    return parseBlock(-1);
  }

  // Recursively evaluates an expression to static Dart values
  dynamic evaluate(String expr, Context ctx) {
    expr = expr.trim();
    if (expr.isEmpty) return null;
    if (expr == 'None') return null;
    if (expr == 'True') return true;
    if (expr == 'False') return false;

    // String literals
    if ((expr.startsWith('"') && expr.endsWith('"')) || 
        (expr.startsWith("'") && expr.endsWith("'"))) {
      return expr.substring(1, expr.length - 1);
    }

    // Number literals
    if (RegExp(r'^\d+$').hasMatch(expr)) {
      return int.parse(expr);
    }
    if (RegExp(r'^\d+\.\d+$').hasMatch(expr)) {
      return double.parse(expr);
    }

    // Parenthesized expression or Tuple
    if (expr.startsWith('(') && expr.endsWith(')')) {
      final inside = expr.substring(1, expr.length - 1).trim();
      if (inside.isEmpty) return []; // Empty tuple
      
      final commas = _splitArgs(inside);
      if (commas.length > 1 || inside.endsWith(',')) {
        return inside.split(',').where((e) => e.trim().isNotEmpty).map((e) => evaluate(e.trim(), ctx)).toList();
      } else {
        return evaluate(inside, ctx);
      }
    }

    // List literals e.g. [1, 2, 3]
    if (expr.startsWith('[') && expr.endsWith(']')) {
      final inside = expr.substring(1, expr.length - 1).trim();
      if (inside.isEmpty) return [];
      return inside.split(',').map((e) => evaluate(e.trim(), ctx)).toList();
    }

    // Set literals e.g. {1, 2, 3}
    if (expr.startsWith('{') && expr.endsWith('}')) {
      final inside = expr.substring(1, expr.length - 1).trim();
      if (inside.isEmpty) return <dynamic>{};
      return inside.split(',').map((e) => evaluate(e.trim(), ctx)).toSet();
    }

    // -----------------------------------------------------------------
    // OPERATOR EVALUATION WITH PRECEDENCE AND NESTING RULES
    // -----------------------------------------------------------------

    // 1. Comparison operators (==, !=, >=, <=, >, <)
    final compIdx = _findOperator(expr, const ['==', '!=', '>=', '<=', '>', '<']);
    if (compIdx != -1) {
      final nextChar = compIdx < expr.length - 1 ? expr[compIdx + 1] : '';
      final isTwoChar = nextChar == '=';
      final op = isTwoChar ? expr.substring(compIdx, compIdx + 2) : expr.substring(compIdx, compIdx + 1);
      final leftStr = expr.substring(0, compIdx).trim();
      final rightStr = expr.substring(compIdx + (isTwoChar ? 2 : 1)).trim();

      final val1 = evaluate(leftStr, ctx);
      final val2 = evaluate(rightStr, ctx);

      if (op == '==') return val1 == val2;
      if (op == '!=') return val1 != val2;
      if (op == '>=') {
        if (val1 is num && val2 is num) return val1 >= val2;
        return false;
      }
      if (op == '<=') {
        if (val1 is num && val2 is num) return val1 <= val2;
        return false;
      }
      if (op == '>') {
        if (val1 is num && val2 is num) return val1 > val2;
        return false;
      }
      if (op == '<') {
        if (val1 is num && val2 is num) return val1 < val2;
        return false;
      }
    }

    // 2. Addition / Subtraction (+, -)
    final addSubIdx = _findOperator(expr, const ['+', '-']);
    if (addSubIdx != -1) {
      final op = expr[addSubIdx];
      final leftStr = expr.substring(0, addSubIdx).trim();
      final rightStr = expr.substring(addSubIdx + 1).trim();

      final val1 = evaluate(leftStr, ctx);
      final val2 = evaluate(rightStr, ctx);

      if (op == '+') {
        if (val1 is num && val2 is num) return val1 + val2;
        return '${val1 ?? ""}${val2 ?? ""}';
      }
      if (op == '-') {
        if (val1 is num && val2 is num) return val1 - val2;
      }
    }

    // 3. Multiplication / Division (*, /)
    final mulDivIdx = _findOperator(expr, const ['*', '/']);
    if (mulDivIdx != -1) {
      final op = expr[mulDivIdx];
      final leftStr = expr.substring(0, mulDivIdx).trim();
      final rightStr = expr.substring(mulDivIdx + 1).trim();

      final val1 = evaluate(leftStr, ctx);
      final val2 = evaluate(rightStr, ctx);

      if (op == '*') {
        if (val1 is num && val2 is num) return val1 * val2;
        if (val1 is String && val2 is int) return val1 * val2;
        if (val1 is int && val2 is String) return val2 * val1;
      }
      if (op == '/') {
        if (val2 == 0) throw Exception("ZeroDivisionError: division by zero");
        if (val1 is num && val2 is num) return val1 / val2;
      }
    }

    // -----------------------------------------------------------------
    // BUILT-IN FUNCTIONS, LAMBDAS, LIBRARIES AND METHOD CALLS
    // -----------------------------------------------------------------

    // Built-in print call
    if (expr.startsWith('print(') && expr.endsWith(')')) {
      final argStr = expr.substring(6, expr.length - 1).trim();
      if (argStr.isEmpty) {
        log('');
        return null;
      }
      final args = _splitArgs(argStr);
      final evaluatedArgs = args.map((e) => evaluate(e.trim(), ctx)).toList();
      log(evaluatedArgs.map((e) => e == null ? 'None' : e.toString()).join(' '));
      return null;
    }

    // lambda parsing: lambda x: x * 2
    if (expr.startsWith('lambda ')) {
      final colonIdx = expr.indexOf(':');
      if (colonIdx != -1) {
        final paramStr = expr.substring(7, colonIdx).trim();
        final params = paramStr.isEmpty ? <String>[] : paramStr.split(',').map((e) => e.trim()).toList();
        final bodyExpr = expr.substring(colonIdx + 1).trim();
        return LambdaVal(params, bodyExpr);
      }
    }

    // Built-in map/filter calls
    if (expr.startsWith('list(') && expr.endsWith(')')) {
      final arg = expr.substring(5, expr.length - 1).trim();
      final evaluatedArg = evaluate(arg, ctx);
      if (evaluatedArg is Iterable) return evaluatedArg.toList();
      return evaluatedArg;
    }

    if (expr.startsWith('map(') && expr.endsWith(')')) {
      final argsStr = expr.substring(4, expr.length - 1).trim();
      final commas = _splitArgs(argsStr);
      if (commas.length == 2) {
        final func = evaluate(commas[0], ctx);
        final listVal = evaluate(commas[1], ctx);
        if (listVal is List) {
          return listVal.map((e) => _invokeLambdaOrFunction(func, [e], ctx)).toList();
        }
      }
    }

    if (expr.startsWith('filter(') && expr.endsWith(')')) {
      final argsStr = expr.substring(7, expr.length - 1).trim();
      final commas = _splitArgs(argsStr);
      if (commas.length == 2) {
        final func = evaluate(commas[0], ctx);
        final listVal = evaluate(commas[1], ctx);
        if (listVal is List) {
          return listVal.where((e) => isTruthy(_invokeLambdaOrFunction(func, [e], ctx))).toList();
        }
      }
    }

    // Math/Random library evaluations
    if (expr.startsWith('math.')) {
      final call = expr.substring(5);
      if (call == 'pi') return dart_math.pi;
      
      final parenIdx = call.indexOf('(');
      if (parenIdx != -1 && call.endsWith(')')) {
        final func = call.substring(0, parenIdx);
        final argStr = call.substring(parenIdx + 1, call.length - 1);
        final arg = evaluate(argStr, ctx);
        
        if (arg is num) {
          if (func == 'sqrt') return dart_math.sqrt(arg);
          if (func == 'floor') return arg.floor();
          if (func == 'ceil') return arg.ceil();
        }
        if (func == 'pow') {
          final parts = argStr.split(',');
          if (parts.length == 2) {
            final base = evaluate(parts[0], ctx);
            final exp = evaluate(parts[1], ctx);
            if (base is num && exp is num) return dart_math.pow(base, exp);
          }
        }
      }
    }

    if (expr.startsWith('random.')) {
      final call = expr.substring(7);
      final parenIdx = call.indexOf('(');
      if (parenIdx != -1 && call.endsWith(')')) {
        final func = call.substring(0, parenIdx);
        final argStr = call.substring(parenIdx + 1, call.length - 1);
        final rand = dart_math.Random();

        if (func == 'randint') {
          final parts = argStr.split(',');
          if (parts.length == 2) {
            final minVal = evaluate(parts[0], ctx) as int;
            final maxVal = evaluate(parts[1], ctx) as int;
            return minVal + rand.nextInt(maxVal - minVal + 1);
          }
        }
        if (func == 'choice') {
          final listVal = evaluate(argStr, ctx);
          if (listVal is List && listVal.isNotEmpty) {
            return listVal[rand.nextInt(listVal.length)];
          }
        }
      }
    }

    // Built-in standard functions
    final builtInPattern = RegExp(r'^(len|max|min|sum|type|int|float|str)\((.*)\)$');
    final builtInMatch = builtInPattern.firstMatch(expr);
    if (builtInMatch != null) {
      final func = builtInMatch.group(1);
      final argStr = builtInMatch.group(2)!;
      final argVal = evaluate(argStr, ctx);

      if (func == 'len') {
        if (argVal is List) return argVal.length;
        if (argVal is Set) return argVal.length;
        if (argVal is String) return argVal.length;
        throw Exception("TypeError: object of type '${argVal.runtimeType}' has no len()");
      }
      if (func == 'max' && argVal is List) {
        return argVal.reduce((curr, next) => curr > next ? curr : next);
      }
      if (func == 'min' && argVal is List) {
        return argVal.reduce((curr, next) => curr < next ? curr : next);
      }
      if (func == 'sum' && argVal is List) {
        return argVal.fold<num>(0, (prev, element) => prev + (element as num));
      }
      if (func == 'type') {
        if (argVal is String) return "<class 'str'>";
        if (argVal is int) return "<class 'int'>";
        if (argVal is double) return "<class 'float'>";
        if (argVal is List) return "<class 'list'>";
        if (argVal is Set) return "<class 'set'>";
        return "<class '${argVal.runtimeType}'>";
      }
      if (func == 'int') return int.parse(argVal.toString());
      if (func == 'float') return double.parse(argVal.toString());
      if (func == 'str') return argVal.toString();
    }

    // Method calls on object e.g. m.yur()
    if (expr.contains('.') && expr.endsWith(')')) {
      final dotIdx = expr.indexOf('.');
      final parentName = expr.substring(0, dotIdx).trim();
      final callStr = expr.substring(dotIdx + 1);
      final parenIdx = callStr.indexOf('(');
      
      if (parenIdx != -1) {
        final methodName = callStr.substring(0, parenIdx).trim();
        final argStr = callStr.substring(parenIdx + 1, callStr.length - 1);
        final args = argStr.isEmpty ? <dynamic>[] : argStr.split(',').map((e) => evaluate(e.trim(), ctx)).toList();

        final parentObj = evaluate(parentName, ctx);
        if (parentObj is PythonInstance) {
          if (parentObj.klass.methods.containsKey(methodName)) {
            return _invokeFunction(parentObj.klass.methods[methodName]!, args, ctx, instance: parentObj);
          }
        }
      }
    }

    // Class / object attribute lookups e.g. self.rusumi or obj.name
    if (expr.contains('.')) {
      final dotIdx = expr.indexOf('.');
      final parentName = expr.substring(0, dotIdx).trim();
      final childField = expr.substring(dotIdx + 1).trim();
      
      final parentObj = evaluate(parentName, ctx);
      if (parentObj is PythonInstance) {
        // Field lookup
        if (parentObj.fields.containsKey(childField)) {
          return parentObj.fields[childField];
        }
        
        // Method lookup and binding
        if (parentObj.klass.methods.containsKey(childField)) {
          return BoundMethod(parentObj, parentObj.klass.methods[childField]!);
        }
      }
    }

    // Custom function calling or class instantiation
    final callPattern = RegExp(r'^([a-zA-Z_][a-zA-Z0-9_]*)\((.*)\)$');
    final callMatch = callPattern.firstMatch(expr);
    if (callMatch != null) {
      final name = callMatch.group(1)!;
      final argStr = callMatch.group(2)!;
      final args = argStr.isEmpty ? <dynamic>[] : argStr.split(',').map((e) => evaluate(e.trim(), ctx)).toList();

      // Is it a custom function call?
      if (functions.containsKey(name)) {
        return _invokeFunction(functions[name]!, args, ctx);
      }

      // Is it a class instantiation?
      if (classes.containsKey(name)) {
        final klass = classes[name]!;
        final instance = PythonInstance(klass);
        
        // Execute constructor if it exists
        if (klass.methods.containsKey('__init__')) {
          _invokeFunction(klass.methods['__init__']!, args, ctx, instance: instance);
        }
        return instance;
      }
    }

    // Variable lookup
    final localVal = ctx.lookup(expr);
    if (localVal != null) return localVal;

    throw Exception("NameError: name '$expr' is not defined");
  }

  int _findOperator(String expr, List<String> ops) {
    int depth = 0;
    bool inSingleQuote = false;
    bool inDoubleQuote = false;

    for (int i = expr.length - 1; i >= 0; i--) {
      final char = expr[i];

      // Handle quotes
      if (char == "'" && (i == 0 || expr[i - 1] != '\\')) {
        if (!inDoubleQuote) inSingleQuote = !inSingleQuote;
        continue;
      }
      if (char == '"' && (i == 0 || expr[i - 1] != '\\')) {
        if (!inSingleQuote) inDoubleQuote = !inDoubleQuote;
        continue;
      }

      if (inSingleQuote || inDoubleQuote) continue;

      // Handle brackets depth
      if (char == ')' || char == ']' || char == '}') {
        depth++;
      } else if (char == '(' || char == '[' || char == '{') {
        depth--;
      }

      if (depth == 0) {
        // Look for multi-character operators first (e.g. ==, !=, >=, <=)
        if (i >= 1) {
          final twoChars = expr.substring(i - 1, i + 1);
          if (ops.contains(twoChars)) {
            return i - 1;
          }
        }
        // Single-character operators (e.g. +, -, *, /, >, <)
        if (ops.contains(char)) {
          // Prevent matching parts of multi-character operators as single-character
          if (char == '=') {
            if (i > 0 && (expr[i - 1] == '=' || expr[i - 1] == '!' || expr[i - 1] == '>' || expr[i - 1] == '<')) {
              continue; 
            }
            if (i < expr.length - 1 && expr[i + 1] == '=') {
              continue;
            }
          }
          if (char == '>' || char == '<') {
            if (i < expr.length - 1 && expr[i + 1] == '=') {
              continue;
            }
          }
          return i;
        }
      }
    }
    return -1;
  }

  // Splits list arguments correctly, taking commas outside brackets/parentheses
  List<String> _splitArgs(String s) {
    List<String> parts = [];
    int depth = 0;
    StringBuffer current = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final char = s[i];
      if (char == '(' || char == '[' || char == '{') depth++;
      else if (char == ')' || char == ']' || char == '}') depth--;

      if (char == ',' && depth == 0) {
        parts.add(current.toString().trim());
        current.clear();
      } else {
        current.write(char);
      }
    }
    if (current.isNotEmpty) {
      parts.add(current.toString().trim());
    }
    return parts;
  }

  dynamic _invokeLambdaOrFunction(dynamic func, List<dynamic> args, Context parentCtx) {
    if (func is LambdaVal) {
      final lambdaCtx = Context(parent: parentCtx);
      for (int i = 0; i < func.parameters.length; i++) {
        if (i < args.length) {
          lambdaCtx.assign(func.parameters[i], args[i]);
        }
      }
      return evaluate(func.expression, lambdaCtx);
    }
    if (func is PythonFunction) {
      return _invokeFunction(func, args, parentCtx);
    }
    if (func is BoundMethod) {
      return _invokeFunction(func.method, args, parentCtx, instance: func.instance);
    }
    throw Exception("TypeError: object is not callable");
  }

  dynamic _invokeFunction(PythonFunction func, List<dynamic> args, Context parentCtx, {PythonInstance? instance}) {
    final localCtx = Context(parent: parentCtx);
    
    int argOffset = 0;
    if (instance != null) {
      localCtx.assign('self', instance);
      argOffset = 1;
    }

    for (int i = 0; i < func.parameters.length; i++) {
      final paramName = func.parameters[i];
      if (paramName == 'self' && instance != null) continue;
      
      final argIdx = i - argOffset;
      if (argIdx >= 0 && argIdx < args.length) {
        localCtx.assign(paramName, args[argIdx]);
      }
    }

    // Save previous returns state
    final oldHasReturned = hasReturned;
    final oldReturnVal = returnValue;
    
    hasReturned = false;
    returnValue = null;

    try {
      for (var stmt in func.body) {
        if (hasReturned) break;
        stmt.execute(localCtx, this);
      }
    } finally {
      // Restore state
      final res = returnValue;
      hasReturned = oldHasReturned;
      returnValue = oldReturnVal;
      return res ?? 'None';
    }
  }
}

class BoundMethod {
  final PythonInstance instance;
  final PythonFunction method;
  BoundMethod(this.instance, this.method);
}
