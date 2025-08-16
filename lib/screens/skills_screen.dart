import 'package:flutter/material.dart';
import '../data/skills_data.dart';
import '../widgets/skill_chip.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skills & Technologies"),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              FadeTransition(
                opacity: _fadeAnimation,
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.psychology,
                        size: 64,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Skills & Technologies",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Technologies and tools I work with",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withValues(alpha: 0.7),
                                ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Skills Categories
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      _buildSkillsCategory(
                          "Core Technologies", _getCoreSkills()),
                      const SizedBox(height: 24),
                      _buildSkillsCategory("Development Tools", _getDevTools()),
                      const SizedBox(height: 24),
                      _buildSkillsCategory(
                          "Specializations", _getSpecializations()),
                      const SizedBox(height: 24),
                      _buildSkillsCategory("Other Skills", _getOtherSkills()),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillsCategory(String title, List<String> categorySkills) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _getCategoryIcon(title),
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: categorySkills.map((skill) {
              return AnimatedBuilder(
                animation: _fadeController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 0.8 + (0.2 * _fadeAnimation.value),
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: SkillChip(skill),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String title) {
    switch (title) {
      case "Core Technologies":
        return Icons.code;
      case "Development Tools":
        return Icons.build;
      case "Specializations":
        return Icons.star;
      case "Other Skills":
        return Icons.more_horiz;
      default:
        return Icons.category;
    }
  }

  List<String> _getCoreSkills() {
    return [
      "Flutter Development",
      "Dart",
      "Android",
      "SQLite",
      "API Integration",
      "Node.js",
      "Express",
      "MongoDB",
      "Firebase",
      "Provider",
    ];
  }

  List<String> _getDevTools() {
    return [
      "Android Studio",
      "VSCode",
      "Postman",
      "RESTful APIs",
      "Third-party Libraries",
      "Version Control",
      "Code Documentation",
      "Testing",
      "Debugging",
      "Performance Optimization",
    ];
  }

  List<String> _getSpecializations() {
    return [
      "Payment Gateway Integration",
      "UPI Integration",
      "BHIM UPI",
      "Real-time Features",
      "Chat & Call Integration",
      "Push Notifications",
      "Wallet Management",
      "Booking Systems",
      "Profile Management",
      "Crypto Exchange",
      "Dating App Development",
      "Gaming Applications",
      "Utility Bill Payments",
      "Mobile Recharge",
      "Investment Platforms",
      "Insurance Integration",
      "Anonymous Chat",
      "Video & Audio Calls",
    ];
  }

  List<String> _getOtherSkills() {
    return [
      "SDLC",
      "Agile Methodologies",
      "State Management",
      "UI/UX Design",
      "Responsive Design",
      "Cross-platform Development",
      "Code Optimization",
    ];
  }
}
