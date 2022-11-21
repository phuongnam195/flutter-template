import 'package:intl/intl.dart';

extension DateTimeExt on DateTime? {
  String? formatDate1() =>
      this == null ? null : DateFormat('dd-MM-yyyy').format(this!);
  String? formatDate2() =>
      this == null ? null : DateFormat('dd/MM/yyyy').format(this!);
  String? formatDate3() =>
      this == null ? null : DateFormat('EEE, dd MMM yy').format(this!);

  String? formatTime1() =>
      this == null ? null : DateFormat('hh:mm').format(this!);

  String? formatDateTime() =>
      this == null ? null : DateFormat('EEE, dd MMM yy hh:mm').format(this!);
}

DateTime? fronJsonTimestamp(int? int) =>
    int == null ? null : DateTime.fromMillisecondsSinceEpoch(int);
int? toJsonTimestamp(DateTime? time) => time?.millisecondsSinceEpoch;

extension DurationExt on Duration {
  /// HH:MM:SS
  String formatTime() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return '${twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }
}

extension ListExt on List? {
  bool get isNullOrEmpty => this == null || this?.isEmpty == true;
}

extension StringExt on String? {
  bool get isNullOrEmpty => this == null || this?.trim().isEmpty == true;

  // 'Hello world'
  String toCapitalized() => isNullOrEmpty
      ? ''
      : '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';

  // 'Hello World'
  String toTitleCase() => this == null
      ? ''
      : this!
          .replaceAll(RegExp(' +'), ' ')
          .split(' ')
          .map((str) => str.toCapitalized())
          .join(' ');
}
