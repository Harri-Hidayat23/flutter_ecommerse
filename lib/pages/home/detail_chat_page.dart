part of 'home.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    header() {
      return PreferredSize(
        child: AppBar(
          backgroundColor: bgColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/image_shop_logo.png',
                width: 50,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bintang Jaya Hydra Utama',
                      style: primaryTextStyle.copyWith(
                          fontWeight: medium, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Online',
                      style: secondaryTextStyle.copyWith(
                          fontWeight: light, fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(70),
      );
    }

    Widget productView() {
      return Container(
        padding: EdgeInsets.all(10),
        width: 225,
        height: 74,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: bgColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: priceColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images_Product.png',
                width: 54,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product 1',
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Rp.500.000',
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/button_close.png',
              width: 22,
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            productView(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: bgColor4,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Typle Message...',
                            hintStyle: subtitleTextStyle),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/Send_Button.png',
                  width: 45,
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          ChatBubble(
            isSender: true,
            text: 'Hi, This item is still available?',
            hasProduct: true,
          ),
          ChatBubble(
            hasProduct: false,
            isSender: false,
            text: 'Good night, This item is only available in size 42 and 43',
          ),
          ChatBubble(
            isSender: true,
            text: 'Hi, This item is still available?',
          ),
          ChatBubble(
            isSender: true,
            text: 'Owww, it suits me very well',
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
