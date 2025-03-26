class SortDto {
  final SortOrder order;
  final String sort;

  SortDto(this.order, this.sort);

  Map<String, dynamic> toJson() {
    return {'order': order.toString(), 'sort': sort};
  }
}

enum SortOrder { asc, desc }
