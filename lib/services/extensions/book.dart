class Book {
  String id;
  String? author;
  String? title;
  String? pages;
  String? publisher;
  String? size;
  String? year;
  String? extension;
  String? mirror_1;
  String? mirror_2;
  String? mirror_3;

  Book(
      {required this.id,
      this.author,
      this.title,
      this.pages,
      this.publisher,
      this.size,
      this.year,
      this.extension,
      this.mirror_1,
      this.mirror_2,
      this.mirror_3});
}
