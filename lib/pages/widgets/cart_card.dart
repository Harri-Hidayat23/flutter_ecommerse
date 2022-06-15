part of 'widget.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
          color: bgColor4, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage('assets/products/md_788g.png')),
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
                    'MD-788G',
                    style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  Text(
                    'Rp.9.000.000',
                    style: priceTextStyle,
                  )
                ],
              )),
              Column(
                children: [
                  Image.asset(
                    'assets/button_add.png',
                    width: 16,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '2',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(height: 2),
                  Image.asset(
                    'assets/button_min.png',
                    width: 16,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Image.asset(
                'assets/icon_trash.png',
                width: 10,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: alertTextStyle.copyWith(fontSize: 12, fontWeight: light),
              )
            ],
          )
        ],
      ),
    );
  }
}
