import 'package:flutter/material.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/theme/theme.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String _selectedGroup = 'Katta guruh'; // Default selection
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final state = AppStateProvider.of(context, listen: false);
      
      // Format full name and phone number
      final fullName = _nameController.text.trim();
      final phone = '+998 ${_phoneController.text.trim()}';

      // Call AppState register logic
      await state.registerUser(
        name: fullName,
        group: _selectedGroup,
        phone: phone,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Xatolik yuz berdi: $e'),
          backgroundColor: AppTheme.errorRed,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.midnightBg,
      body: Stack(
        children: [
          // Background Glows
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.neonCyan.withOpacity(0.08),
                blurRadius: 100,
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -150,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.neonPurple.withOpacity(0.08),
                blurRadius: 120,
              ),
            ),
          ),

          // Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Logo Icon
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppTheme.neonCyan.withOpacity(0.05),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.neonCyan.withOpacity(0.2),
                              width: 1.5,
                            ),
                          ),
                          child: const Icon(
                            Icons.rocket_launch_rounded,
                            color: AppTheme.neonCyan,
                            size: 48,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Title
                      Text(
                        'Python Kursiga\nXush kelibsiz!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.textPrimary,
                          letterSpacing: -0.5,
                          height: 1.2,
                          shadows: [
                            Shadow(
                              color: AppTheme.neonCyan.withOpacity(0.3),
                              blurRadius: 15,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Global reytingda qatnashish va bilimingizni oshirish uchun ro\'yxatdan o\'ting',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 36),

                      // Name Field Card
                      _buildLabel('Ism va Familiya'),
                      TextFormField(
                        controller: _nameController,
                        style: const TextStyle(color: AppTheme.textPrimary, fontSize: 15),
                        textCapitalization: TextCapitalization.words,
                        decoration: _buildInputDecoration(
                          hint: 'Ism Familiyangizni kiriting',
                          icon: Icons.person_outline_rounded,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().length < 3) {
                            return 'Iltimos, ism familiyangizni to\'liq kiriting';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Phone Field Card
                      _buildLabel('Telefon raqam'),
                      TextFormField(
                        controller: _phoneController,
                        style: const TextStyle(color: AppTheme.textPrimary, fontSize: 15),
                        keyboardType: TextInputType.phone,
                        decoration: _buildInputDecoration(
                          hint: '90 123 45 67',
                          icon: Icons.phone_android_rounded,
                          prefix: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Text(
                              '+998',
                              style: TextStyle(
                                color: AppTheme.textPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Telefon raqamingizni kiriting';
                          }
                          // Simple digit count validation
                          final clean = value.replaceAll(RegExp(r'\D'), '');
                          if (clean.length < 9) {
                            return 'Telefon raqam noto\'g\'ri kiritildi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),

                      // Group Selector Label
                      _buildLabel('Guruhni tanlang'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: _buildGroupOption('Katta guruh', AppTheme.neonPurple),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: _buildGroupOption('Kichik guruh', AppTheme.neonCyan),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),

                      // Submit Button
                      _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.neonCyan),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: (_selectedGroup == 'Katta guruh'
                                            ? AppTheme.neonPurple
                                            : AppTheme.neonCyan)
                                        .withOpacity(0.3),
                                    blurRadius: 20,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 4),
                                  )
                                ],
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                onPressed: _handleRegister,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: _selectedGroup == 'Katta guruh'
                                          ? [AppTheme.neonPurple, AppTheme.neonBlue]
                                          : [AppTheme.neonCyan, AppTheme.neonBlue],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Darslarni Boshlash',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildGroupOption(String groupName, Color activeColor) {
    final bool isSelected = _selectedGroup == groupName;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGroup = groupName;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? activeColor.withOpacity(0.08) : AppTheme.glassSurface.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? activeColor : AppTheme.glassBorder,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: activeColor.withOpacity(0.15),
                    blurRadius: 12,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        child: Column(
          children: [
            Icon(
              groupName == 'Katta guruh' ? Icons.school_rounded : Icons.child_care_rounded,
              color: isSelected ? activeColor : AppTheme.textMuted,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              groupName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isSelected ? AppTheme.textPrimary : AppTheme.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration({
    required String hint,
    required IconData icon,
    Widget? prefix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppTheme.textMuted, fontSize: 14),
      prefixIcon: Icon(icon, color: AppTheme.textMuted, size: 20),
      prefix: prefix,
      filled: true,
      fillColor: AppTheme.glassSurface.withOpacity(0.4),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppTheme.glassBorder, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppTheme.neonCyan, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppTheme.errorRed, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppTheme.errorRed, width: 1.5),
      ),
    );
  }
}
