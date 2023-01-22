List join({List list, dynamic sep}) {
  List modifiedList = [list.first];

  list.sublist(1, list.length).forEach((e) {
    modifiedList.addAll([sep, e]);
  });

  return modifiedList;
}

List joinV2({List list, dynamic sep}) {
  if (list == null) return null;
  if (list.isEmpty) return [];
  if (sep == null) return list;
  List modifiedList = [list.first];
  if (sep is Iterable) {
    list.sublist(1, list.length).forEach((e) {
      modifiedList.addAll([...sep, e]);
    });
  } else {
    list.sublist(1, list.length).forEach((e) {
      modifiedList.addAll([sep, e]);
    });
  }
  return modifiedList;
}
