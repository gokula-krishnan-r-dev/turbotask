import 'package:equatable/equatable.dart';

/// Create project request entity.
/// Contains data needed to create a new project.
class CreateProjectRequest extends Equatable {
  const CreateProjectRequest({
    required this.title,
    required this.description,
    required this.category,
    required this.colorTheme,
    this.imageUrl,
  });

  final String title;
  final String description;
  final String category;
  final String colorTheme;
  final String? imageUrl;

  @override
  List<Object?> get props => [
    title,
    description,
    category,
    colorTheme,
    imageUrl,
  ];

  @override
  String toString() {
    return 'CreateProjectRequest(title: $title, category: $category)';
  }
}
