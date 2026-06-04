String formatNumber(int number) {
  if (number < 1000) return number.toString();
  final str = number.toString();
  return '${str.substring(0, str.length - 3)},${str.substring(str.length - 3)}';
}

void main() {
  final templates = ['Batman', 'Toy Box', 'Epic Morph', 'Anime', 'Trending', 'New'];
  for (final title in templates) {
    final int hash = title.hashCode;
    final double views = ((hash % 90) + 10) / 10;
    final double percentage = ((hash % 30) + 15) / 100.0;
    final int baseLikes = (views * 1000 * percentage).toInt();
    final int likedLikes = baseLikes + 1;
    print('$title -> views: ${views}k, baseLikes: ${formatNumber(baseLikes)}, likedLikes: ${formatNumber(likedLikes)}');
  }
}
