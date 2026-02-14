import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

class DownloadUtils {
  /// Download a file on web platform
  ///
  /// Throws [UnsupportedError] if called on non-web platforms
  static void downloadFileWeb(Uint8List bytes, String fileName) {
    if (!kIsWeb) {
      throw UnsupportedError(
        'downloadFileWeb can only be called on web platform. '
        'Check kIsWeb before calling this method.',
      );
    }

    // Create a blob from the bytes
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Create an anchor element and trigger download
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();

    // Clean up
    html.Url.revokeObjectUrl(url);
  }

  /// Download CSV file on web platform
  ///
  /// Throws [UnsupportedError] if called on non-web platforms
  static void downloadCsvWeb(String csvContent, String fileName) {
    if (!kIsWeb) {
      throw UnsupportedError(
        'downloadCsvWeb can only be called on web platform. '
        'Check kIsWeb before calling this method.',
      );
    }

    // Create a blob with CSV content
    final blob = html.Blob([csvContent], 'text/csv');
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Create an anchor element and trigger download
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();

    // Clean up
    html.Url.revokeObjectUrl(url);
  }
}
