class MessageModel {
  late String id;
  late String body;

  MessageModel(this.body, this.id);
  factory MessageModel.fromJson(json) {
    return MessageModel(json['body'], json['id']);
  }
}
