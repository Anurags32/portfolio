# Flutter Portfolio App

A beautiful and modern portfolio application built with Flutter, showcasing skills, projects, and contact information with a responsive design and smooth animations.

## Features

- 🌙 **Dark/Light Theme Toggle** - Switch between light and dark themes
- 📱 **Responsive Design** - Works seamlessly across different screen sizes
- ✨ **Smooth Animations** - Beautiful fade and slide animations
- 🎨 **Modern UI/UX** - Material Design 3 with custom styling
- 📋 **Project Showcase** - Display your projects with images and links
- 🛠️ **Skills Section** - Showcase your technical skills with icons
- 📧 **Contact Form** - Integrated email contact form
- 🔗 **Social Links** - Direct links to your social profiles

## Screenshots

The app includes the following screens:

- **Home Screen** - Welcome page with profile information and animations
- **About Screen** - Detailed information about you and social links
- **Projects Screen** - Showcase of your projects with descriptions
- **Skills Screen** - Display of your technical skills with icons
- **Contact Screen** - Contact form for potential clients or collaborators

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or Physical Device

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/flutter_portfolio.git
cd flutter_portfolio
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

## Project Structure

```
lib/
├── core/
│   ├── constants.dart          # App constants and data
│   ├── theme.dart             # App theme configuration
│   └── theme_provider.dart    # Theme state management
├── data/
│   ├── project_data.dart      # Project information
│   └── skills_data.dart       # Skills information
├── screens/
│   ├── home_screen.dart       # Main home screen
│   ├── about_screen.dart      # About page
│   ├── projects_screen.dart   # Projects showcase
│   ├── skills_screen.dart     # Skills display
│   └── contact_screen.dart    # Contact form
├── widgets/
│   ├── section_title.dart     # Reusable section titles
│   ├── project_card.dart      # Project display cards
│   ├── skill_chip.dart        # Skill display chips
│   └── contact_form.dart      # Contact form widget
└── main.dart                  # App entry point
```

## Customization

### Personal Information

Update your personal information in `lib/core/constants.dart`:

- Name and tagline
- Description and detailed description
- Social media links

### Projects

Add or modify your projects in `lib/data/project_data.dart`:

```dart
{
  "title": "Your Project Name",
  "description": "Project description",
  "image": "assets/images/project_image.png",
  "link": "https://your-project-link.com"
}
```

### Skills

Update your skills in `lib/data/skills_data.dart`:

```dart
const List<String> skills = [
  "Flutter",
  "Dart",
  "Firebase",
  // Add more skills...
];
```

### Profile Image

Replace `assets/images/profile.jpg` with your profile picture.

### Project Images

Add your project screenshots to `assets/images/` and update the image paths in `project_data.dart`.

## Dependencies

- **provider**: State management
- **url_launcher**: Launch external URLs
- **google_fonts**: Custom fonts
- **lottie**: Animations (for future enhancements)

## Features to Add

- [ ] Lottie animations for enhanced visual appeal
- [ ] Blog section to share technical articles
- [ ] Downloadable resume
- [ ] Portfolio analytics
- [ ] Multi-language support
- [ ] PWA support for web deployment

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

Anurag Tiwari - [LinkedIn](https://linkedin.com/in/yourprofile) - anurag.tiwari@example.com

Project Link: [https://github.com/yourusername/flutter_portfolio](https://github.com/yourusername/flutter_portfolio)
