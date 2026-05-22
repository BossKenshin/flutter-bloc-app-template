import 'package:flutter/material.dart';

class ErrorFallbackPage extends StatelessWidget {
  const ErrorFallbackPage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}

class NotFoundFallbackPage extends StatelessWidget {
  const NotFoundFallbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page not found')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'The page you are looking for does not exist.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
