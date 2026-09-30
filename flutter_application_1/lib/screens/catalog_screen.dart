import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../theme/app_theme.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => _showAddProduct(context), child: const Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('Smart-Cart'),
        actions: [
          // Icon keranjang + badge counter real-time via Consumer
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Consumer<CartProvider>(
              builder: (context, cart, _) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const CartScreen()),
                        );
                      },
                    ),
                    if (cart.totalQuantity > 0)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                          constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                          decoration: BoxDecoration(
                            color: AppColors.rust,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: AppColors.primary, width: 1.5),
                          ),
                          child: Text(
                            '${cart.totalQuantity}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Katalog Produk', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 14),
              Expanded(
                child: Consumer<ProductProvider>(builder: (context, products, _) {
                  if (products.loading) return const Center(child: CircularProgressIndicator());
                  return GridView.builder(
                  itemCount: products.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(product: products.products[index]);
                  },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showAddProduct(BuildContext context) {
    final name=TextEditingController(), price=TextEditingController(), description=TextEditingController();
    showDialog(context:context,builder:(dc)=>AlertDialog(title:const Text('Tambah Produk'),content:SingleChildScrollView(child:Column(mainAxisSize:MainAxisSize.min,children:[TextField(controller:name,decoration:const InputDecoration(labelText:'Nama produk')),TextField(controller:price,keyboardType:TextInputType.number,decoration:const InputDecoration(labelText:'Harga')),TextField(controller:description,decoration:const InputDecoration(labelText:'Deskripsi'))])),actions:[TextButton(onPressed:()=>Navigator.pop(dc),child:const Text('Batal')),ElevatedButton(onPressed:() async {final n=name.text.trim(), h=int.tryParse(price.text.trim());if(n.isEmpty||h==null||h<=0){ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Isi nama dan harga dengan benar')));return;}await context.read<ProductProvider>().addProduct(Product(id:DateTime.now().microsecondsSinceEpoch.toString(),name:n,price:h,description:description.text.trim()));if(dc.mounted)Navigator.pop(dc);},child:const Text('Simpan'))]));
  }

}
