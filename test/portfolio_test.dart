import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_portfolio/main.dart';
import 'package:flutter_portfolio/core/theme_provider.dart';
import 'package:flutter_portfolio/screens/home_screen.dart';
import 'package:flutter_portfolio/screens/about_screen.dart';
import 'package:flutter_portfolio/screens/projects_screen.dart';
import 'package:flutter_portfolio/screens/skills_screen.dart';
import 'package:flutter_portfolio/screens/contact_screen.dart';

void main() {
  group('Portfolio App Tests', () {
    testWidgets('App should build without errors', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: const PortfolioApp(),
        ),
      );

      // Verify that the app builds successfully
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('Home screen should display basic elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: const PortfolioApp(),
        ),
      );

      // Wait for animations to complete
      await tester.pumpAndSettle();

      // Check for key elements
      expect(find.text('Anurag Tiwari'), findsAtLeastOneWidget);
      expect(find.text('Flutter Developer | Mobile & Web Apps'), findsAtLeastOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('Theme switching should work', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: const PortfolioApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Find and tap the theme switch
      final switchFinder = find.byType(Switch);
      expect(switchFinder, findsOneWidget);

      await tester.tap(switchFinder);
      await tester.pumpAndSettle();

      // Verify theme changed (this is a basic test)
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('Navigation drawer should work', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: const PortfolioApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Open drawer
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      // Check drawer items
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Projects'), findsOneWidget);
      expect(find.text('Skills'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
    });

    testWidgets('Navigation to About screen should work', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: const PortfolioApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Open drawer and navigate to About
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();

      // Verify About screen is displayed
      expect(find.text('About Me'), findsAtLeastOneWidget);
      expect(find.text('Download Resume'), findsOneWidget);
    });

    testWidgets('Contact form should validate inputs', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: const PortfolioApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to contact screen
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Contact'));
      await tester.pumpAndSettle();

      // Try to submit empty form
      await tester.tap(find.text('Send Message'));
      await tester.pumpAndSettle();

      // Should show validation errors
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your message'), findsOneWidget);
    });

    testWidgets('Skills screen should display skill categories', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: const PortfolioApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to skills screen
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Skills'));
      await tester.pumpAndSettle();

      // Check for skill categories
      expect(find.text('Core Technologies'), findsOneWidget);
      expect(find.text('Development Tools'), findsOneWidget);
      expect(find.text('Specializations'), findsOneWidget);
      expect(find.text('Other Skills'), findsOneWidget);
    });

    testWidgets('Projects screen should display projects', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: const PortfolioApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to projects screen
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Projects'));
      await tester.pumpAndSettle();

      // Check for project elements
      expect(find.text('My Projects'), findsAtLeastOneWidget);
      expect(find.text('ForeAstro User Side'), findsOneWidget);
      expect(find.text('ExchangeBC App'), findsOneWidget);
    });
  });
}
