part of 'pages.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text('Your Cart'),
        elevation: 0,
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_empty_cart.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Opss! Your Cart is Empty',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite product',
              style: secondaryTextStyle,
            ),
            Container(
              width: 154,
              height: 44,
              margin: EdgeInsets.only(top: 20),
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  )),
            )
          ],
        ),
      );
    }

    Widget conten() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: cartProvider.carts.map((cart) => CartCard(cart)).toList(),
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$ ${cartProvider.totalPrice()}',
                    style:
                        priceTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 0.2,
              color: subtitleColor,
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryTextColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: conten(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
