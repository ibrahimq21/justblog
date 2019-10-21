class DateUtil {
  var months = [
    'January',
    'Febuary',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String buildDate(String date) {
    try {
      var datatime = DateTime.parse(date);
      return "${datatime.day} of ${months[datatime.month - 1]} at ${datatime.year} @ ${datatime.hour}:${datatime.minute}";
    } catch (e) {
      return "";
    }
  }
}
