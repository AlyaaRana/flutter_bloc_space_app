String safeString(dynamic v) => v?.toString() ?? '';
List<String> safeStringList(dynamic v) {
  final list = v as List<dynamic>?;
  if (list == null) return <String>[];
  return list.where((e) => e != null).map((e) => e.toString()).toList();
}
