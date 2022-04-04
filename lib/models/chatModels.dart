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
      imageUrl:
          "https://www.finetoshine.com/wp-content/uploads/2020/07/111-Best-Whatsapp-DP-Images-For-Girls-Stylish-Girls.png"),
  ChatModels(
      name: "Alex",
      message: "Call me ASAP!",
      time: "9:50 pm",
      imageUrl:
          "https://smileworld.in/wp-content/uploads/2020/06/Cool-Boy-Hidden-Face-DP-Images-for-Whatsapp.jpg"),
  ChatModels(
      name: "Natasha",
      message: "Hey wanna date!",
      time: "12:07 am",
      imageUrl:
          "https://1.bp.blogspot.com/-KnsRj0Xv6LQ/XmoQ4H2Lf9I/AAAAAAAAPZU/sWgscMHUVnUhYJLxNqTdTi2NGxPIgzXGQCLcBGAsYHQ/s1600/Whatsapp%2BDP%2BImages%2BFor%2BGirl%2B%252818%2529.jpg")
];
