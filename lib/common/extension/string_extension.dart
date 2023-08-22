/// Được tạo bởi Phạm Nhớ từ 10/09/2022
/// mọi hành vi sao chép cần được sự cho phép

extension StringExtension on String {
  String lowerCaseFirstLetter() {
    return "${this[0].toLowerCase()}${substring(1)}";
  }
}