part of 'widget.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, right: 14, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: bgColor4),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images_Product.png',
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product 1',
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'Rp.123.456',
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          Image.asset(
            'assets/wishlist_round.png',
            width: 34,
          )
        ],
      ),
    );
  }
}
