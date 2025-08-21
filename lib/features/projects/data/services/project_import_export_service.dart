import 'dart:io';
import 'dart:typed_data';
import 'package:injectable/injectable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_service.dart';
import '../models/export_import_models.dart';

/// Service for handling project data export and import operations.
/// Provides methods to export project data as ZIP files and import from ZIP files.
@singleton
class ProjectImportExportService {
  const ProjectImportExportService(this._apiService);

  final ApiService _apiService;

  /// Exports project data as a ZIP file containing CSV data.
  /// Returns the file path where the exported ZIP file is saved.
  Future<String> exportProject(String projectId) async {
    try {
      // Call the backend export endpoint
      final response = await _apiService.get(
        '/api/v1/todo/projects/$projectId/export',
        options: Options(
          responseType: ResponseType.bytes,
          headers: {'Accept': 'application/zip'},
        ),
      );

      // Get the appropriate directory for saving files
      Directory saveDirectory;
      try {
        final Directory? downloadsDir = await getDownloadsDirectory();
        saveDirectory =
            downloadsDir ?? await getApplicationDocumentsDirectory();
      } catch (e) {
        // Fallback to documents directory if downloads directory access fails
        saveDirectory = await getApplicationDocumentsDirectory();
      }

      // Ensure the directory exists
      if (!await saveDirectory.exists()) {
        await saveDirectory.create(recursive: true);
      }

      // Create filename with timestamp and project info
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'project_export_$timestamp.zip';
      final filePath = '${saveDirectory.path}/$fileName';

      // Write the ZIP file
      final file = File(filePath);
      await file.writeAsBytes(response.data as Uint8List);

      // Verify file was written successfully
      if (!await file.exists()) {
        throw Exception('Failed to save export file to local storage');
      }

      final fileSize = await file.length();
      print('Export saved successfully: $filePath (${fileSize} bytes)');

      return filePath;
    } catch (e) {
      throw Exception('Failed to export project: ${e.toString()}');
    }
  }

  /// Imports project data from a ZIP file.
  /// Opens a file picker to select the ZIP file and uploads it to the backend.
  Future<ImportProjectResponse> importProject(String projectId) async {
    try {
      // Open file picker to select ZIP file
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['zip'],
        allowMultiple: false,
      );

      if (result == null || result.files.isEmpty) {
        throw Exception('No file selected');
      }

      final file = result.files.first;
      final filePath = file.path;

      if (filePath == null) {
        throw Exception('Invalid file path');
      }

      // Prepare multipart form data
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: file.name),
      });

      // Call the backend import endpoint
      final response = await _apiService.post(
        '/api/v1/todo/projects/$projectId/import',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      return ImportProjectResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw Exception('Failed to import project: ${e.toString()}');
    }
  }

  /// Validates a ZIP file before import.
  /// Checks if the file contains the expected CSV structure.
  Future<bool> validateImportFile(String filePath) async {
    try {
      // Basic validation - check if file exists and has .zip extension
      final file = File(filePath);
      if (!await file.exists()) {
        return false;
      }

      final extension = filePath.split('.').last.toLowerCase();
      return extension == 'zip';
    } catch (e) {
      return false;
    }
  }

  /// Gets the appropriate downloads directory for the current platform.
  Future<Directory?> getDownloadsDirectory() async {
    try {
      if (Platform.isAndroid) {
        // Try common Android download paths
        final possiblePaths = [
          '/storage/emulated/0/Download',
          '/storage/emulated/0/Downloads',
          '/sdcard/Download',
          '/sdcard/Downloads',
        ];

        for (final path in possiblePaths) {
          final dir = Directory(path);
          if (await dir.exists()) {
            return dir;
          }
        }

        // Fallback to app documents directory for Android
        return await getApplicationDocumentsDirectory();
      } else if (Platform.isIOS) {
        // iOS doesn't have a user-accessible Downloads directory
        return await getApplicationDocumentsDirectory();
      } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
        final home =
            Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];
        if (home != null) {
          final downloadsPath = Platform.isMacOS
              ? '$home/Downloads'
              : Platform.isWindows
              ? '$home\\Downloads'
              : '$home/Downloads';

          final downloadsDir = Directory(downloadsPath);
          if (await downloadsDir.exists()) {
            return downloadsDir;
          }
        }

        // Fallback to documents directory if Downloads doesn't exist
        return await getApplicationDocumentsDirectory();
      }
    } catch (e) {
      print('Error accessing downloads directory: $e');
    }

    // Final fallback
    return await getApplicationDocumentsDirectory();
  }
}
