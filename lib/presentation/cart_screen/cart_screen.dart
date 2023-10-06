import 'package:dilkara/models/item.dart';
import 'package:provider/provider.dart';
import '../../models/DBHelper.dart';
import '../../models/cartprovider.dart';
import 'bloc/cart_bloc.dart';
import 'models/cart_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';
import 'package:dilkara/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../models/cart.dart';
import 'package:badges/badges.dart';

class CartScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context) => CartBloc(CartState(
        cartModelObj: CartModel(),
      ))
        ..add(CartInitialEvent()),
      child: CartScreen(),
    );
  }

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            64,
          ),
          leadingWidth: 39,
          leading: AppbarImage(
            height: getSize(
              24,
            ),
            width: getSize(
              24,
            ),
            svgPath: ImageConstant.imgMenuBlack900,
            margin: getMargin(
              left: 15,
              top: 18,
              bottom: 22,
            ),
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "Dilkara".tr,
          ),
          styleType: Style.bgFillWhiteA700,
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 24,
            bottom: 24,
          ),
          child: Column(
            children: [
              Expanded(
                child: Consumer<CartProvider>(
                  builder: (BuildContext context, provider, widget) {
                    if (provider.cart.isEmpty) {
                      return const Center(
                          child: Text(
                        'Your Cart is Empty',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ));
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.cart.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white70,
                              elevation: 5.0,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      productitemlist[index].image,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            text: TextSpan(
                                                text: 'Name: ',
                                                style: TextStyle(
                                                    color: Colors
                                                        .blueGrey.shade800,
                                                    fontSize: 16.0),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          '${provider.cart[index].productName!}\n',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ]),
                                          ),
                                          RichText(
                                            maxLines: 1,
                                            text: TextSpan(
                                                text: 'Price: ' r"$",
                                                style: TextStyle(
                                                    color: Colors
                                                        .blueGrey.shade800,
                                                    fontSize: 16.0),
                                                children: [
                                                  TextSpan(
                                                      text: '\$${provider.cart[index].productPrice!.toStringAsFixed(2)}\n',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ValueListenableBuilder<int>(
                                        valueListenable:
                                            provider.cart[index].quantity!,
                                        builder: (context, val, child) {
                                          return PlusMinusButtons(
                                            addQuantity: () {
                                              cart.addQuantity(
                                                  provider.cart[index].id!);
                                              dbHelper!
                                                  .updateQuantity(Cart(
                                                      id: index,
                                                      productId:
                                                          index.toString(),
                                                      productName: provider
                                                          .cart[index]
                                                          .productName,
                                                      initialPrice: provider
                                                          .cart[index]
                                                          .initialPrice,
                                                      productPrice: provider
                                                          .cart[index]
                                                          .productPrice,
                                                      quantity: ValueNotifier(
                                                          provider.cart[index]
                                                              .quantity!.value),
                                                      unitTag: provider
                                                          .cart[index].unitTag,
                                                      image: provider
                                                          .cart[index].image))
                                                  .then((value) {
                                                setState(() {
                                                  cart.addTotalPrice(
                                                      double.parse(provider
                                                          .cart[index]
                                                          .productPrice
                                                          .toString()));
                                                });
                                              });
                                            },
                                            deleteQuantity: () {
                                              cart.deleteQuantity(
                                                  provider.cart[index].id!);
                                              cart.removeTotalPrice(
                                                  double.parse(provider
                                                      .cart[index].productPrice
                                                      .toString()));
                                            },
                                            text: val.toString(),
                                          );
                                        }),
                                    IconButton(
                                        onPressed: () {
                                          dbHelper!.deleteCartItem(
                                              provider.cart[index].id!);
                                          provider.removeItem(
                                              provider.cart[index].id!);
                                          provider.removeCounter();
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.black54,
                                        )),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  },
                ),
              ),
              Consumer<CartProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  double totalPrice = 0.0;
                  for (var element in value.cart) {
                    totalPrice +=
                    (element.productPrice!.toDouble() * element.quantity!.value.toDouble());
                  }
                  final totalPriceNotifier = ValueNotifier<double?>(totalPrice);
                  return Column(
                    children: [
                      ValueListenableBuilder<double?>(
                        valueListenable: totalPriceNotifier,
                        builder: (context, val, child) {
                          return ReusableWidget(
                            title: 'Sub-Total',
                            value: r'$' + (val?.toStringAsFixed(2) ?? '0'),
                          );
                        },
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
          },
          child: Container(
            color: Colors.black54,
            alignment: Alignment.center,
            height: 50.0,
            child: const Text(
              'Proceed to Pay',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
        Text(text),
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({Key? key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
