class PaginationDto {
  final int limit;
  final int skip;

  PaginationDto(this.limit, this.skip);

  Map<String, dynamic> toJson() {
    return {'limit': limit, 'skip': skip};
  }
}
