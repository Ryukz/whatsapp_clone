// ignore_for_file: camel_case_types

class StatusModels {
  late final String imageUrl;
  late final String name;
  late final String time;

  StatusModels(
      {required this.imageUrl, required this.name, required this.time});
}

List<StatusModels> dummydata = [
  StatusModels(
      name: "Scarlet",
      time: "3:47 PM",
      imageUrl:
          "https://www.finetoshine.com/wp-content/uploads/2020/07/111-Best-Whatsapp-DP-Images-For-Girls-Stylish-Girls.png"),
  StatusModels(
      name: "Alex",
      time: "9:50 PM",
      imageUrl:
          "https://smileworld.in/wp-content/uploads/2020/06/Cool-Boy-Hidden-Face-DP-Images-for-Whatsapp.jpg"),
  StatusModels(
      name: "Natasha",
      time: "12:07 AM",
      imageUrl:
          "https://1.bp.blogspot.com/-KnsRj0Xv6LQ/XmoQ4H2Lf9I/AAAAAAAAPZU/sWgscMHUVnUhYJLxNqTdTi2NGxPIgzXGQCLcBGAsYHQ/s1600/Whatsapp%2BDP%2BImages%2BFor%2BGirl%2B%252818%2529.jpg")
];
