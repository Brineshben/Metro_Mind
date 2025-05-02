import 'package:intl/intl.dart';

String formatDate(String? isoDateString) {
  if (isoDateString == null || isoDateString.isEmpty) return "";

  try {
    DateTime dateTime = DateTime.parse(isoDateString).toLocal(); // Convert to local time if needed
    final formattedDate = DateFormat("dd-MM-yyyy [hh:mm a]").format(dateTime);
    return formattedDate;
  } catch (e) {
    return "";
  }
}