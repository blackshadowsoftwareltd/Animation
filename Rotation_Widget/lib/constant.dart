enum RotationDirection { clockwise, counterclockwise }

enum StaggeredGridType { square, horizontal, vertical }

class User {
  final String name;
  final String image;
  const User({required this.name, required this.image});
}

class UserList {
  static List<User> users = const [
    User(
        name: "Perry Cooper",
        image:
            "https://images.unsplash.com/photo-1643903096045-07741be1f245?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"),
    User(
        name: "Audrey Thomas",
        image:
            "https://images.unsplash.com/photo-1626667700063-4a4cd77d1b15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
    User(
        name: "Cody Stevens",
        image:
            "https://images.unsplash.com/photo-1550791639-8e2650c5f21c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
    User(
        name: "Eloides Mendes",
        image:
            "https://images.unsplash.com/photo-1621306558135-3500aef6c517?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
    User(
        name: "Albert Hayes",
        image:
            "https://images.unsplash.com/photo-1585091479806-70a5e192518d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=720&q=80"),
    User(
        name: "Naomi Chevalier",
        image:
            "https://images.unsplash.com/photo-1531368345462-e180bd618c89?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    User(
        name: "Dwight Roberts",
        image:
            "https://images.unsplash.com/photo-1502086223501-7ea6ecd79368?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1138&q=80"),
    User(
        name: "Anna Chambers",
        image:
            "https://images.unsplash.com/photo-1630618358992-d4f8fd611dfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"),
  ];
}
