import 'package:flutter/material.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/theme/theme.dart';

class GarageCarData {
  final String key;
  final String name;
  final int price;
  final int minLevel; // Free default car level lock, or 0 if buy-only
  final String description;
  final Color themeColor;

  const GarageCarData({
    required this.key,
    required this.name,
    required this.price,
    required this.minLevel,
    required this.description,
    required this.themeColor,
  });
}

class GarageScreen extends StatefulWidget {
  const GarageScreen({super.key});

  @override
  State<GarageScreen> createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  static const List<GarageCarData> _cars = [
    GarageCarData(
      key: 'jiguli',
      name: 'VAZ-2106 (Jiguli)',
      price: 0,
      minLevel: 1,
      description: 'O\'zbekiston yo\'llarining klassik retro mashinasi. 1-darajadan bepul.',
      themeColor: Colors.white,
    ),
    GarageCarData(
      key: 'damas',
      name: 'Chevrolet Damas',
      price: 0,
      minLevel: 2,
      description: 'Haqiqiy mehnatkash va eng mashhur mikrovan. 2-darajadan bepul.',
      themeColor: Colors.cyan,
    ),
    GarageCarData(
      key: 'matiz',
      name: 'Chevrolet Matiz',
      price: 0,
      minLevel: 3,
      description: 'Kichik, chaqqon va juda tejamkor shahar mashinasi. 3-darajadan bepul.',
      themeColor: Colors.greenAccent,
    ),
    GarageCarData(
      key: 'gentra',
      name: 'Qora Gentra',
      price: 0,
      minLevel: 4,
      description: 'O\'zbekiston poyga yo\'llari qiroli. Qoraytirilgan oyna. 4-darajadan bepul.',
      themeColor: Color(0xFF9E9E9E),
    ),
    GarageCarData(
      key: 'cobalt',
      name: 'Chevrolet Cobalt',
      price: 150,
      minLevel: 0,
      description: 'Ishonchli, keng va qulay oilaviy sedan mashinasi.',
      themeColor: Colors.blueGrey,
    ),
    GarageCarData(
      key: 'malibu',
      name: 'Chevrolet Malibu 2',
      price: 350,
      minLevel: 0,
      description: 'Premium darajadagi biznes klass sedan. Kuchli turbo motor.',
      themeColor: Colors.redAccent,
    ),
    GarageCarData(
      key: 'tesla',
      name: 'Tesla Model S',
      price: 600,
      minLevel: 0,
      description: 'Ekologik toza va aqlli kiber elektromobil. Tezlanishi dahshat.',
      themeColor: AppTheme.neonCyan,
    ),
    GarageCarData(
      key: 'bmw',
      name: 'BMW M5 F90',
      price: 1000,
      minLevel: 0,
      description: 'Haqiqiy poyga va drift ishqibozlari uchun kiber poygachi mashina.',
      themeColor: AppTheme.neonBlue,
    ),
    GarageCarData(
      key: 'mers',
      name: 'Mercedes S-Class',
      price: 1500,
      minLevel: 0,
      description: 'Luks va cheksiz qulaylik timsoli bo\'lgan nemis flagmani.',
      themeColor: Colors.amberAccent,
    ),
    GarageCarData(
      key: 'gelik',
      name: 'Gelik (G-Class)',
      price: 2000,
      minLevel: 0,
      description: 'Mercedes-Benz G-Class. Qora kiber off-road yo\'ltanlamasi.',
      themeColor: AppTheme.neonPurple,
    ),
    GarageCarData(
      key: 'lambo',
      name: 'Lamborghini Aventador',
      price: 3000,
      minLevel: 0,
      description: 'Sariq neon ostida charillagan 3D superkar. Devorlarni yoradi.',
      themeColor: AppTheme.neonAmber,
    ),
    GarageCarData(
      key: 'ferrari',
      name: 'Ferrari LaFerrari',
      price: 4000,
      minLevel: 0,
      description: 'Chaqmoqdek tez poygachi qizil italyan afsonasi.',
      themeColor: AppTheme.errorRed,
    ),
  ];

  late GarageCarData _selectedCar;

  @override
  void initState() {
    super.initState();
    _selectedCar = _cars.first;
  }

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final userLevel = state.level;
    final userCoins = state.coins;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.spaceBlack, Color(0xFF0D0B24)],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom AppBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Avto Garaj (Garage)",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    // Coins counter UI
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppTheme.neonAmber.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppTheme.neonAmber.withOpacity(0.5)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.stars_rounded, color: AppTheme.neonAmber, size: 20),
                          const SizedBox(width: 6),
                          Text(
                            "$userCoins Tanga",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.neonAmber,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Selected Car Big Display Section
              _buildSelectedCarViewer(state, userLevel, userCoins),

              // Cars list header
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  "Mavjud Mashinalar Kolleksiyasi",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Grid view list of all cars
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.88,
                  ),
                  itemCount: _cars.length,
                  itemBuilder: (context, index) {
                    final car = _cars[index];
                    return _buildCarGridItem(car, state, userLevel);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedCarViewer(AppState state, int userLevel, int userCoins) {
    // Check if unlocked
    final isLevelUnlocked = _selectedCar.minLevel > 0 && userLevel >= _selectedCar.minLevel;
    final isBought = state.unlockedCars.contains(_selectedCar.key);
    final isUnlocked = isLevelUnlocked || isBought;
    final isEquipped = state.equippedCar == _selectedCar.key ||
        (state.equippedCar == 'default' && state.activeCarKey == _selectedCar.key);

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.glassSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _selectedCar.themeColor.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: _selectedCar.themeColor.withOpacity(0.08),
            blurRadius: 20,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        children: [
          // 3D Car Image Showcase
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Underglow glow circle
              Container(
                width: 150,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _selectedCar.themeColor.withOpacity(0.6),
                      blurRadius: 25,
                      spreadRadius: 2,
                    )
                  ],
                ),
              ),
              Image.asset(
                'assets/images/${_selectedCar.key}.png',
                height: 120,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.directions_car_filled_rounded, color: _selectedCar.themeColor, size: 100);
                },
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Name and description
          Text(
            _selectedCar.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _selectedCar.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 16),

          // Purchase / Equip actions
          _buildActionRow(state, isUnlocked, isEquipped, userCoins),
        ],
      ),
    );
  }

  Widget _buildActionRow(AppState state, bool isUnlocked, bool isEquipped, int userCoins) {
    if (isEquipped) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppTheme.neonGreen.withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.neonGreen),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_rounded, color: AppTheme.neonGreen, size: 20),
              SizedBox(width: 8),
              Text(
                "HOZIRDA JIXOZLANGAN (EQUIPPED)",
                style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.neonGreen, fontSize: 13),
              ),
            ],
          ),
        ),
      );
    }

    if (isUnlocked) {
      return SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedCar.themeColor,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () async {
            await state.equipCar(_selectedCar.key);
            setState(() {});
          },
          child: const Text(
            "JIHOZLASH (EQUIP CAR)",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      );
    }

    // Is Locked (requires buying or level)
    final isLevelLocked = _selectedCar.minLevel > 0;
    if (isLevelLocked) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppTheme.errorRed.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.errorRed.withOpacity(0.35)),
        ),
        child: Center(
          child: Text(
            "QULFLANGAN: ${_selectedCar.minLevel}-DARADA KERAK",
            style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.errorRed, fontSize: 13),
          ),
        ),
      );
    }

    // Requires Buy
    final hasEnough = userCoins >= _selectedCar.price;
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: hasEnough ? AppTheme.neonAmber : AppTheme.glassSurface,
          foregroundColor: hasEnough ? Colors.black : AppTheme.textMuted,
          side: BorderSide(color: hasEnough ? AppTheme.neonAmber : AppTheme.glassBorder, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: const Icon(Icons.shopping_cart_rounded, size: 18),
        label: Text(
          "SOTIB OLISH: ${_selectedCar.price} TANGA",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        onPressed: hasEnough
            ? () async {
                final success = await state.buyCar(_selectedCar.key, _selectedCar.price);
                if (success) {
                  // Auto equip after buying
                  await state.equipCar(_selectedCar.key);
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppTheme.neonGreen,
                      content: Text(
                        "${_selectedCar.name} muvaffaqiyatli sotib olindi va jihozlandi!",
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }
              }
            : null,
      ),
    );
  }

  Widget _buildCarGridItem(GarageCarData car, AppState state, int userLevel) {
    final isSelected = _selectedCar.key == car.key;
    final isLevelUnlocked = car.minLevel > 0 && userLevel >= car.minLevel;
    final isBought = state.unlockedCars.contains(car.key);
    final isUnlocked = isLevelUnlocked || isBought;
    final isEquipped = state.equippedCar == car.key ||
        (state.equippedCar == 'default' && state.activeCarKey == car.key);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCar = car;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? car.themeColor.withOpacity(0.08) : AppTheme.glassSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? car.themeColor
                : isEquipped
                    ? AppTheme.neonGreen
                    : AppTheme.glassBorder,
            width: isSelected ? 2.0 : 1.2,
          ),
        ),
        child: Stack(
          children: [
            // Status Tag
            Positioned(
              top: 8,
              left: 8,
              child: isEquipped
                  ? _buildBadge("FAOL", AppTheme.neonGreen)
                  : !isUnlocked
                      ? car.minLevel > 0
                          ? _buildBadge("Lvl ${car.minLevel}", AppTheme.errorRed)
                          : _buildBadge("${car.price} T", AppTheme.neonAmber)
                      : _buildBadge("OCHIQ", Colors.white54),
            ),

            // Main Contents
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/${car.key}.png',
                        height: 70,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.directions_car_filled_rounded, color: car.themeColor, size: 50);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    car.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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

  Widget _buildBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.5), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 9.5,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
