import 'package:flutter/material.dart';

class DemoMWAppBarScreen extends StatefulWidget {
  const DemoMWAppBarScreen({super.key, required String initialCategory});

  @override
  DemoMWAppBarScreenState createState() => DemoMWAppBarScreenState();
}

class DemoMWAppBarScreenState extends State<DemoMWAppBarScreen> {
  final Color textPrimaryColor = const Color(0xFF212121);
  final Color backgroundColor = Colors.white;
  late TextStyle style;

  FocusNode focusNode = FocusNode();
  late String searchText;
  late Widget appBarTitle;

  Icon actionIcon = const Icon(
    Icons.search,
    color: Colors.white,
  );

  // Ficticia lista de productos con título, descripción e imagen
  List<Map<String, dynamic>> productList = [
    // Productos con categoría "Sillas"
    {
      'category': 'Comedor',
      'title': 'Silla gamer roja',
      'description':
          'Esta silla es para ti por piensa en ti con su color personalizado',
      'image': 'assets/Silla-Gamer-Roja.png',
      'precio': 'precio: 15.00',
    },
    {
      'category': 'Oficina',
      'title': 'Silla gamer verde',
      'description':
          'Esta silla es para ti por piensa en ti con su color personalizado',
      'image': 'assets/Silla-Gamer-Roja.png',
      'precio': 'precio: 15.00',
    },
    // Productos con categoría "Mesas"
    {
      'category': 'Evento',
      'title': 'Silla de escritorio',
      'description': 'Escritorio espacioso para trabajar cómodamente',
      'image': 'assets/Silla-Gamer-Roja.png',
      'precio': 'precio: 50.00',
    },
    {
      'category': 'Gamers',
      'title': 'Silla de comedor',
      'description': 'Mesa grande para disfrutar de comidas en familia',
      'image': 'assets/Silla-Gamer-Roja.png',
      'precio': 'precio: 80.00',
    },
    // Agregar más productos aquí...
    // {
    //   'category': 'Mesas',
    //   'title': 'Mesa de comedor',
    //   'description': 'Mesa grande para disfrutar de comidas en familia',
    //   'image': 'assets/img/mesas/mesa_comedor.jfif',
    //   'precio': 'precio: 80.00',
    // },
    // {
    //   'category': 'Mesas',
    //   'title': 'Mesa de comedor',
    //   'description': 'Mesa grande para disfrutar de comidas en familia',
    //   'image': 'assets/img/mesas/mesa_comedor.jfif',
    //   'precio': 'precio: 80.00',
    // },
  ];

  // Lista ficticia de categorías con opción "Ver todas"
  List<String> categories = [
    'Ver todas',
    'Comedor',
    'Oficina',
    'Evento',
    'Gamers'
  ];

  String selectedCategory = '';
  Set<Map<String, dynamic>> selectedProducts = {};

  @override
  void initState() {
    super.initState();
    searchText = '';
    style = TextStyle(color: textPrimaryColor);
    appBarTitle = Text("Edenesca S.A", style: style);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  List<Map<String, dynamic>> getFilteredProducts() {
    if (selectedCategory == 'Ver todas' || selectedCategory.isEmpty) {
      return productList.where((product) {
        final title = product['title']?.toLowerCase() ?? '';
        return title.contains(searchText.toLowerCase());
      }).toList();
    } else {
      return productList
          .where((product) => product['category'] == selectedCategory)
          .toList();
    }
  }

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      selectedProducts.add(product);
    });
  }

  void removeFromCart(Map<String, dynamic> product) {
    setState(() {
      selectedProducts.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Verificar el ancho de la pantalla para determinar el número de columnas en el GridView
            final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

            return Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Barra de búsqueda
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      style: TextStyle(color: textPrimaryColor, fontSize: 20),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: textPrimaryColor),
                        hintText: "Buscar",
                        hintStyle: TextStyle(
                          color: textPrimaryColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),

                  // Botón de Categorías
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedCategory.isEmpty ? null : selectedCategory,
                      hint: const Text('Seleccionar Categoría'),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                        });
                      },
                      items: categories
                          .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category),
                              ))
                          .toList(),
                    ),
                  ),

                  // esto hace la separación del bar con los contaners
                  const SizedBox(height: 16),

                  // desde aqui es es que comienza todo lo de producto
                  Expanded(
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: getFilteredProducts().length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          // aqui commienza lo de abajo osea el modal
                          // Construir cada cuadro de producto con título, nombre, descripción e imagen
                          return GestureDetector(
                            onTap: () {
                              // Mostrar el modal con la información del producto
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  // Obtener el tamaño del modal según el tamaño de la pantalla
                                  final modalHeight =
                                      constraints.maxHeight * 0.8;
                                  final modalWidth = constraints.maxWidth;

                                  return Container(
                                    height: modalHeight,
                                    width: modalWidth,
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          getFilteredProducts()[index]
                                                  ['image'] ??
                                              '',
                                          height: modalHeight * 0.3,
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          getFilteredProducts()[index]
                                                  ['title'] ??
                                              '',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(getFilteredProducts()[index]
                                                ['description'] ??
                                            ''),
                                        const SizedBox(height: 16),
                                        Text(getFilteredProducts()[index]
                                                ['precio'] ??
                                            ''),
                                        const SizedBox(height: 20),

                                        // aqui es el botón de carrito
                                        ElevatedButton(
                                          onPressed: () {
                                            // Si el producto ya está en el carrito, mostrará una opción para quitarlo.
                                            if (selectedProducts.contains(
                                                getFilteredProducts()[index])) {
                                              removeFromCart(
                                                  getFilteredProducts()[index]);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Producto quitado del carrito')),
                                              );
                                            } else {
                                              addToCart(
                                                  getFilteredProducts()[index]);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Producto agregado al carrito')),
                                              );
                                            }
                                            Navigator.pop(
                                                context); // Cerrar el modal
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 238, 198, 138),
                                            foregroundColor: Colors.black,
                                            textStyle:
                                                const TextStyle(fontSize: 18),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 60, vertical: 12),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          child: selectedProducts.contains(
                                                  getFilteredProducts()[index])
                                              ? const Text('Quitar del carrito')
                                              : const Text(
                                                  'Agregar al carrito'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },

                            // esto es para la vista principal osea la de arriba
                            child: Container(
                              color: Colors.grey[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    getFilteredProducts()[index]['image'] ?? '',
                                    height: 110,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    getFilteredProducts()[index]['title'] ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(getFilteredProducts()[index]['precio'] ??
                                      ''),
                                  const SizedBox(height: 8),
                                  // Mostrar mensaje si el producto está en el carrito
                                  if (selectedProducts
                                      .contains(getFilteredProducts()[index]))
                                    const Text('Producto en el carrito',
                                        style: TextStyle(color: Colors.green)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Ir a la pantalla del carrito
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(
                    selectedProducts: selectedProducts.toList(),
                    removeFromCart: removeFromCart),
              ),
            );
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> selectedProducts;
  final Function(Map<String, dynamic> product) removeFromCart;

  const CartScreen(
      {Key? key, required this.selectedProducts, required this.removeFromCart})
      : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de compras'),
      ),
      body: ListView.builder(
        itemCount: widget.selectedProducts.length,
        itemBuilder: (context, index) {
          final product = widget.selectedProducts[index];
          return ListTile(
            leading: Image.asset(product['image'] ?? ''),
            title: Text(product['title'] ?? ''),
            subtitle: Text(product['precio'] ?? ''),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart),
              onPressed: () {
                widget.removeFromCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Producto quitado del carrito')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
