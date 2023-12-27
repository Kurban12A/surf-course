
import 'package:flutter/material.dart';
import 'package:task_12/mock_data.dart';
import 'package:task_12/product_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(key: MyHomePage.homePageKey),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static final GlobalKey<_MyHomePageState> homePageKey = GlobalKey<_MyHomePageState>();
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 3;
  /// по умолчаню делаем активную последню вкадку меню как на макете
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  /// для обновления состояния экрана
  void update() {
    setState(() {});
  }

  /// метод сортировки по цене и отображения индикатора сортировки на иконке
  void _applySort() {
    setState(() {
      SortService.isSortingAscending = !SortService.isSortingAscending;
      dataForStudents.sort((a, b) {
        if (SortService.isSortingAscending) {
          return a.price.compareTo(b.price);
        } else {
          return b.price.compareTo(a.price);
        }
      });
      SortService.isSortingApplied = true;
    });
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorTheme.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: MainColorTheme.iconsTextColor,
        items: const [
          BottomNavigationBarItem(
            icon: BottomIcons.catalog,
            label: MocksDataText.bottonNavBarCatalog,
          ),
          BottomNavigationBarItem(
            icon: BottomIcons.search,
            label: MocksDataText.bottonNavBarSearch
          ),
          BottomNavigationBarItem(
            icon: BottomIcons.cart, 
            label: MocksDataText.bottonNavBarCart
          ),
          BottomNavigationBarItem(
            icon: BottomIcons.personal,
            label: MocksDataText.bottonNavBarPersonal,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MainColorTheme.accentColor,
        selectedIconTheme:
            const IconThemeData(color: MainColorTheme.accentColor),
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        surfaceTintColor: MainColorTheme.backgroundColor,
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 40.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    MocksDataText.heading,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _SortButton(
                    onApplySort: _applySort,
                    isSortingApplied: SortService.isSortingApplied,
                  ),
                ],
              ),
            )),
        centerTitle: true,
        backgroundColor: MainColorTheme.backgroundColor,
        title: const _AppBarTitle(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// проверяем если список пуст то выводим сообщение 
            dataForStudents.isEmpty
            ? const Center(
              child: Text('Здесь пока ничего нет', style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold
              ),)
            )
            : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: dataForStudents.length,
              itemBuilder: (context, index) {
                final product = dataForStudents[index];
                bool showCategory = index == 0 ||
                    product.category != dataForStudents[index - 1].category;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// отображаем категорию один раз (группируем товары)
                    if (showCategory)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          product.category.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: _BaseContainerProductCards(
                        product: product,
                        category: product.category,
                      ),
                    ),
                    /// условие для прогрессбара
                    if (SortService.isSortingInProgress)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                );
              },
            ),
            const BaseTotalWidget(),
          ],
        ),
      ),
    );
  }
}


/// виджет итоговых данных
class BaseTotalWidget extends StatelessWidget {
  const BaseTotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// получаем список товаров
    List<ProductEntity> fetchProducts() {
      return dataForStudents;
    }

    /// Получение данных из класса ProductEntity
    List<ProductEntity> products = fetchProducts();

    /// Вычисляем общую стоимость
    int totalCost =
        products.map((product) => product.price).reduce((a, b) => a + b);

    /// расчет скидки
    int totalDiscount = (totalCost * 5) ~/ 100;

    /// расчет итоговой суммы
    int totalSumOrder = totalCost - totalDiscount;

    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              MocksDataText.cart,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${dataForStudents.length} товаров'),
                Text(
                  '$totalCost',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(MocksDataText.discount),
                Text('-$totalDiscount',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  MocksDataText.total,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$totalSumOrder',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// аппбар
class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.arrow_back_ios_new,
          color: MainColorTheme.accentColor,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  MocksDataText.appBarTitle,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  MocksDataText.appBarLowText,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

///логика сортировки
class SortService {
  static bool isSortingAscending = true;
  static bool isSortingApplied = false;
  static bool isSortingInProgress = false;

  static void applySort(List<ProductEntity> dataForStudents) {
    if (isSortingInProgress) {
      return; /// Если сортировка уже выполняется, прервать
    }

    isSortingInProgress = true;

    /// переключить порядок сортировки
    isSortingAscending = !isSortingAscending;

    // Сортировка данных по цене
    dataForStudents.sort((a, b) {
      if (isSortingAscending) {
        return a.price.compareTo(b.price);
      } else {
        return b.price.compareTo(a.price);
      }
    });

    // Обновляем состояние экрана после сортировки
    isSortingApplied = true;

    isSortingInProgress = false;
  }
}


/// иконка фильтра
class _SortButton extends StatefulWidget {
  final VoidCallback onApplySort;
  final bool isSortingApplied;

  const _SortButton({
    this.isSortingApplied = false,
    required this.onApplySort,
    super.key,
  });

  @override
  State<_SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<_SortButton> {

  @override
  void didUpdateWidget(covariant _SortButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Если состояние сортировки изменилось, обновляем виджет
    if (widget.isSortingApplied && SortService.isSortingApplied) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            context: context,
            builder: (context) => const Padding(
                padding:  EdgeInsets.only(top: 70),
                child: FilteredBottomSheetInfo()));
      },
      child: Stack(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: MainColorTheme.iconColorButton,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.sort),
          ),
          ///условие если true то показываем индикатор сортировки
          if (widget.isSortingApplied)
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MainColorTheme.accentColor
              ),

            )
          )
        ],
      ),
    );
  }
}

/// данные для сортировки в модельном окне
class FilteredBottomSheetInfo extends StatefulWidget {
  const FilteredBottomSheetInfo({
    super.key,
  });

  @override
  State<FilteredBottomSheetInfo> createState() => _FilteredBottomSheetInfoState();
}

class _FilteredBottomSheetInfoState extends State<FilteredBottomSheetInfo> {
  String? _selectedSortOption;

  /// Устанавливаем значение по умолчанию
  @override
  void initState() {
    super.initState();
    _selectedSortOption = SortMockData.noSort; 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: MainColorTheme.backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HandleBottomSheet(),
          const SizedBox(
            height: 30,
          ),
          const RowSortAndCloseBottomSheet(),
          const SizedBox(
            height: 20,
          ),
          BaseSortContainer(
            text: SortMockData.noSort,
            groupValue: _selectedSortOption,
            onGroupValueChanged: (String value) {
              setState(() {
                _selectedSortOption = value;
              });
            },
          ),
          const BaseDivider(),
          const HeadSortCategory(
            text: SortMockData.categoryName,
          ),
          const SizedBox(
            height: 10,
          ),
          BaseSortContainer(
            text: SortMockData.nameToFromA,
            text2: SortMockData.reversenameToFromA,
            groupValue: _selectedSortOption,
            onGroupValueChanged: (String value) {
              setState(() {
                _selectedSortOption = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const BaseDivider(),
          const HeadSortCategory(
            text: SortMockData.categoryPrice,
          ),
          const SizedBox(
            height: 10,
          ),
          BaseSortContainer(
            text: SortMockData.lowToHighPrice,
            text2: SortMockData.highToLowPrice,
            groupValue: _selectedSortOption,
            onGroupValueChanged: (String value) {
              setState(() {
                _selectedSortOption = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const BaseDivider(),
          const HeadSortCategory(
            text: SortMockData.categoryType,
          ),
          const SizedBox(
            height: 10,
          ),
          BaseSortContainer(
            text: SortMockData.typeFromA,
            text2: SortMockData.reverseTypeFromA,
            groupValue: _selectedSortOption,
            onGroupValueChanged: (String value) {
              setState(() {
                _selectedSortOption = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter, 
                child: ApplyFilterButton(
                  onApplyFilter: () {
                    SortService.applySort(dataForStudents);
                    Navigator.of(context).pop();
                    MyHomePage.homePageKey.currentState?.update();
                  },
                )),
          ),
        ],
      ),
    );
    
  }
}

/// базовый контейнер для параметров сортировки
class BaseSortContainer extends StatefulWidget {
  final String text;
  final String? text2;
  final String? groupValue;
  final ValueChanged<String> onGroupValueChanged; // Добавляем функцию обратного вызова

  const BaseSortContainer({
    Key? key,
    required this.text,
    this.text2,
    this.groupValue,
    required this.onGroupValueChanged, // Принимаем функцию обратного вызова в конструкторе
  }) : super(key: key);

  @override
  _BaseSortContainerState createState() => _BaseSortContainerState();
}

class _BaseSortContainerState extends State<BaseSortContainer> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 18,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRadioButton(
          value: widget.text,
          groupValue: widget.groupValue,
          onChanged: (String? value) {
            if (value != null) {
              /// Вызываем функцию обратного вызова для обновления группового значения
              widget.onGroupValueChanged(value);
            }
          },
          label: widget.text,
        ),
        if (widget.text2 != null)
          CustomRadioButton(
            value: widget.text2!,
            groupValue: widget.groupValue,
            onChanged: (String? value) {
              if (value != null) {
                /// Вызываем функцию обратного вызова для обновления группового значения
                widget.onGroupValueChanged(value);
              }
            },
            label: widget.text2!,
          ),
      ],
    );
  }
}


/// разделитель
class BaseDivider extends StatelessWidget {
  const BaseDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: MainColorTheme.divaderColor,
    );
  }
}

/// базовый виджет для радиокнопки
class CustomRadioButton extends StatefulWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final String label;

  const CustomRadioButton({
    super.key, 
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
  });

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 18,
    );
    return Row(
      children: [
        Radio<String>(
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: widget.onChanged,
          activeColor: MainColorTheme.accentColor,
        ),
        Text(widget.label, style: textStyle,),
      ],
    );
  }
}

/// заколовки категорий сортировки
class HeadSortCategory extends StatelessWidget {
  final String text;
  const HeadSortCategory({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

/// заогловок сортировка и иконка закрытия модального окна
class RowSortAndCloseBottomSheet extends StatelessWidget {
  const RowSortAndCloseBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          SortMockData.sort,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        InkWell(
            onTap: () {
              /// Закрыть модальное окно при нажатии на иконку "close"
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.close,
              size: 26,
            ))
      ],
    );
  }
}

/// хэндл
class HandleBottomSheet extends StatelessWidget {
  const HandleBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 3,
          width: 40,
          color: const Color.fromARGB(221, 209, 209, 209),
        ),
      ],
    );
  }
}

/// кнокпка "готово" в  модальном окне
class ApplyFilterButton extends StatelessWidget {
  final VoidCallback onApplyFilter;
  const ApplyFilterButton({
    required this.onApplyFilter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const loginTextStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color.fromARGB(255, 255, 255, 255));
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onApplyFilter,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor:
                MaterialStateProperty.all(MainColorTheme.accentColor)),
        child: const Text(
          SortMockData.buttonBottomSheet,
          style: loginTextStyle,
        ),
      ),
    );
  }
}

/// базовый контейнер для карточки товара
class _BaseContainerProductCards extends StatelessWidget {
  final ProductEntity product;
  final Category category;

  const _BaseContainerProductCards({
    super.key,
    required this.product,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 90,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    /// если нет изображения выводим заглушку
                    errorBuilder:(context, error, stackTrace) {
                      return Container(
                        color: const Color.fromARGB(255, 215, 214, 214),
                        child: const Center(
                          child: Icon(Icons.restaurant, 
                            color: Color.fromARGB(255, 63, 63, 63),
                           ),
                        )
                        );
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${(product.amount is Grams ? product.amount.value / 1000 
                              : product.amount.value)} ${product.amount is Grams ? 'кг' : 'шт'}'),
                          Text(
                            '${product.price}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
