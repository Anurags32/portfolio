import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String skill;
  const SkillChip(this.skill, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      child: Chip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getSkillIcon(skill),
              size: 16,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(width: 6),
            Text(
              skill,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  IconData _getSkillIcon(String skill) {
    switch (skill.toLowerCase()) {
      case 'flutter':
        return Icons.flutter_dash;
      case 'dart':
        return Icons.code;
      case 'firebase':
        return Icons.cloud;
      case 'node.js':
        return Icons.settings;
      case 'rest api':
        return Icons.api;
      case 'bloc / provider / getx':
        return Icons.architecture;
      case 'riverpod':
        return Icons.water_drop;
      case 'clean architecture':
        return Icons.layers;
      case 'unit & widget testing':
        return Icons.bug_report;
      case 'git & github':
        return Icons.source;
      case 'state management':
        return Icons.settings_applications;
      case 'ui/ux design':
        return Icons.design_services;
      case 'material design':
        return Icons.palette;
      case 'responsive design':
        return Icons.phone_android;
      case 'api integration':
        return Icons.integration_instructions;
      case 'local storage':
        return Icons.storage;
      case 'push notifications':
        return Icons.notifications;
      case 'app store deployment':
        return Icons.store;
      case 'performance optimization':
        return Icons.speed;
      case 'debugging':
        return Icons.bug_report;
      default:
        return Icons.star;
    }
  }
}
