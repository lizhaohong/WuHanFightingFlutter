class API {
  // 请求的url
  static const reqUrl = 'http://49.232.173.220:3001';

  // 按时间线获取事件
  static const timelineService = '/data/getTimelineService';

  // 最新辟谣
  static const getIndexRumorList = '/data/getIndexRumorList';

  // 最新防护知识
  static const getIndexRecommendList = '/data/getIndexRecommendList';

  // 最新知识百科
  static const getWikiList = '/data/getWikiList';

  // 获取整体统计信息
  static const getStatisticsService = '/data/getStatisticsService';

  // 获取省份信息
  static const getAreaStat = '/data/getAreaStat';

  // 诊疗信息
  static const getEntries = '/data/getEntries';

  // 版本更新
  static const update = '/app/update';
}