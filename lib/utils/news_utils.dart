class NewsUtils {
  static String formatNumber(int count) {
    if (count < 10000) {
      return '$count';
    } else {
      return '${(count / 10000).toStringAsFixed(1)}w';
    }
  }

  static String formatDate(int timestamp, {String format = 'YYYY-MM-DD hh:mm'}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return format.replaceAllMapped(new RegExp('YYYY|MM|DD|hh|mm|ss'), (item) {
      switch (item.group(0)) {
        case 'YYYY':
          return '${date.year}';
          break;
        case 'MM':
          return '${date.month}'.padLeft(2, '0');
          break;
        case 'DD':
          return '${date.day}'.padLeft(2, '0');
          break;
        case 'hh':
          return '${date.hour}'.padLeft(2, '0');
          break;
        case 'mm':
          return '${date.minute}'.padLeft(2, '0');
          break;
        case 'ss':
          return '${date.second}'.padLeft(2, '0');
          break;
        default:
          break;
      }
    });
  }

  /*
   * 发布时间语义转化
   * @method timeAlissa
   * @param {Number} 目标时间
   * @param {Number} 系统时间
   */
  static String timeAlissa(int curTime, {int systemTime ,String format = 'MM-DD'}) {
    systemTime = systemTime??DateTime.now().millisecond;
    // 秒
    int time = (systemTime - curTime) ~/ 1000;
    // 小于一分钟=> 刚刚
    if (time <= 60) {
      return '刚刚';
    }
    // 小于一小时 => x分钟
    if (time <= 60 * 60) {
      return '${time ~/ 60}分钟前';
    }
    // 小于24小时 => 'x小时前发布'
    if (time < 24 * 60 * 60) {
      return '${time ~/ 3600}小时前';
    }
    return formatDate(curTime, format: format);
  }
}