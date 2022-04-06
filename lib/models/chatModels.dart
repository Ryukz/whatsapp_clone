// ignore_for_file: file_names

class ChatModels {
  late final String name;
  late final String message;
  late final String time;
  late final String imageUrl;

  ChatModels(
      {required this.name,
      required this.message,
      required this.time,
      required this.imageUrl});
}

List<ChatModels> dummydata = [
  ChatModels(
      name: "Scarlet",
      message: "Hey! What are you doing",
      time: "11:07 am",
      imageUrl: "images/Scarlet.png"),
  ChatModels(
      name: "Alex",
      message: "Call me ASAP!",
      time: "9:50 pm",
      imageUrl: "images/Alex.jpg"),
  ChatModels(
      name: "Natasha",
      message: "Hey wanna date!",
      time: "12:07 am",
      imageUrl: "images/Natasha.jpg")
];
