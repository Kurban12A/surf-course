
/// описание товара
class Articles {
  final int id;
  final String category;
  final String name;
  final int price;
  final int quantity;

  Articles(this.id, this.category, this.name, this.price, this.quantity);
  
}

/// интерфейс фильтра
abstract class Filter {
  bool apply(Articles article); /// базовый фильтр, который не изменяет список
}

/// реализация фильтра по категории
class CategoryFliter extends Filter {
  final String category;

  CategoryFliter({required this.category});

  @override
  bool apply(Articles article) {
    return article.category == category;
  }
  
}

/// реализация фильтра по цене
class MaxPrice extends Filter {
  final int maxPrice;

  MaxPrice({required this.maxPrice});

  @override
  bool apply(Articles article) {
    return article.price >= maxPrice;
  }
  
}
/// реализация фильтра по количеству
class QuantityFilter extends Filter {
  final int maxQuantity;

  QuantityFilter({required this.maxQuantity});

  @override
  bool apply(Articles article) {
    return article.quantity <= maxQuantity;
  }
}


void applyFilter(List<Articles> articles, Filter filter) {
  final filteredArticles = articles.where((article) => filter.apply(article)).toList();
  /// Вывод результатов в консоль
  print('ID\tCategory\tName\tPrice (руб.)\tQuantity (шт.)'.padLeft(10));
  for (var article in filteredArticles) {
    print('|${article.id}|\t|${article.category}|\t|${article.name}|\t|${article.price}|\t\t|${article.quantity}|');
  }
}


void main() {
    final articles = '''
    1,хлеб,Бородинский,500,5
    2,хлеб,Белый,200,15
    3,молоко,Полосатый кот,50,53
    4,молоко,Коровка,50,53
    5,вода,Апельсин,25,100
    6,вода,Бородинский,500,5
  ''';

    final articleList = articles
      .split('\n')
      .where((line) => line.trim().isNotEmpty)
      .map((line) {
        final values = line.split(',');
        return Articles(
          int.parse(values[0]),
          values[1],
          values[2],
          int.parse(values[3]),
          int.parse(values[4]),
        );
      })
      .toList();

    /// использования фильтрации по maxPrice
    final maxPrice = MaxPrice(maxPrice: 500);
    applyFilter(articleList, maxPrice);
    print('');
    /// использования фильтрации по category
    final whicChategory = CategoryFliter(category: 'Молоко'.toLowerCase());
    applyFilter(articleList, whicChategory);
}