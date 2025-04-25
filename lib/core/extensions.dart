
import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime{
  String toDetailed() {
    const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    const months = ['January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'];

    final dayName = days[weekday % 7];
    final monthName = months[month - 1];
    final hour12 = hour > 12 ? hour - 12 : hour == 0 ? 12 : hour;
    final period = hour < 12 ? 'AM' : 'PM';
    final minuteStr = minute.toString().padLeft(2, '0');
    final hourStr = hour12.toString().padLeft(2, '0');

    return '$dayName, $monthName $day, $year - $hourStr:$minuteStr $period';
  }
  String formattedDate() {
    const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    const months = ['January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'];

    final dayName = days[weekday % 7];
    final monthName = months[month - 1];

    return '$dayName, $monthName $day, $year';
  }

  String formatTo({
    String format = 'EEE, MMM d, yyyy',
    String locale = 'en_US',
  }) => DateFormat(format, locale).format(this);

}







