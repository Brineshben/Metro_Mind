class QuotesModel {
  String? quote;
  String? author;

  QuotesModel({this.quote, this.author});

  QuotesModel.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quote'] = this.quote;
    data['author'] = this.author;
    return data;
  }
}