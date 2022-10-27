class ChatItem {
  final String message;
  final String user;

  ChatItem({required this.message, required this.user});
}

List<ChatItem> chatList = [
  ChatItem(message: 'Hi, Whats You Name Firstname?', user: '1'),
  ChatItem(message: 'Abdalla', user: '2'),
  ChatItem(message: 'Ok, Abdalla Whats Your Lastname?', user: '1'),
  ChatItem(message: 'Salah', user: '2'),
  ChatItem(message: "Mr Abdalla Salah, What's your Title? ", user: '1'),
  ChatItem(message: "Front-end Developer", user: '2'),
  ChatItem(message: "What Categories you will need expert In?", user: '1'),
];
class ChatCategoryItem {
  final String text;
  bool active;

  ChatCategoryItem({required this.text, required this.active});
}

List<ChatCategoryItem> chatCategoryItem = [
  ChatCategoryItem(text: 'Security', active: false),
  ChatCategoryItem(text: 'Supply Chain', active: false),
  ChatCategoryItem(text: 'Information Technology', active: false),
  ChatCategoryItem(text: 'Human Resource', active: false),
  ChatCategoryItem(text: 'Business Research', active: false),

];
