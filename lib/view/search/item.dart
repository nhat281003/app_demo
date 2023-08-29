class Item{
  String type;
  String mess;
  Session position;

  Item({required this.type, required this.mess, required this.position});

}
enum Session{
  start, emd, oneItem, center
}