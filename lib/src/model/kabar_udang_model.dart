class KabarUdangModel {
  int? id;
  int? authorId;
  int? categoryId;
  String? image;
  String? status;
  bool? featured;
  String? advertisement;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? seoTitle;
  String? excerpt;
  String? body;
  String? slug;
  String? metaDescription;
  String? metaKeywords;

  KabarUdangModel({
    this.id,
    this.authorId,
    this.categoryId,
    this.image,
    this.status,
    this.featured,
    this.advertisement,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.seoTitle,
    this.excerpt,
    this.body,
    this.slug,
    this.metaDescription,
    this.metaKeywords,
  });

  factory KabarUdangModel.fromJson(Map<String, dynamic> json) =>
      KabarUdangModel(
        id: json["id"],
        authorId: json["author_id"],
        categoryId: json["category_id"],
        image: json["image"],
        status: json["status"],
        featured: json["featured"],
        advertisement: json["advertisement"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        title: json["title"],
        seoTitle: json["seo_title"],
        excerpt: json["excerpt"],
        body: json["body"],
        slug: json["slug"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author_id": authorId,
        "category_id": categoryId,
        "image": image,
        "status": status,
        "featured": featured,
        "advertisement": advertisement,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "title": title,
        "seo_title": seoTitle,
        "excerpt": excerpt,
        "body": body,
        "slug": slug,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
      };
}
