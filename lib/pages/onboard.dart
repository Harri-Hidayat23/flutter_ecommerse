part of 'pages.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images_onboard1.png',
      text: "Welcome",
      desc: "Find the spare part you ordered",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/images_onboard2.png',
      text: "Original Product",
      desc: "The products we sell are original products and official warranty",
      bg: Color(0xFF4756DF),
      button: Colors.white,
    ),
    OnboardModel(
      img: 'assets/images_onboard3.png',
      text: "Professional Technician",
      desc:
          "We are a provider of goods and services, we have professional and certified technicians",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              // _storeOnboardInfo();
              // Navigator.pushReplacement(
              //     context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text("Skip", style: secondaryTextStyle),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(screens[index].img),
                  Container(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                width: currentIndex == index ? 25 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: bgColor2,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                  Text(screens[index].text,
                      textAlign: TextAlign.center,
                      style: primaryTextStyle.copyWith(
                          fontSize: 27.0, fontWeight: semiBold)),
                  Text(screens[index].desc,
                      textAlign: TextAlign.center,
                      style: primaryTextStyle.copyWith(fontSize: 12)),
                  InkWell(
                    onTap: () async {
                      // print(index);
                      // if (index == screens.length - 1) {
                      //   await _storeOnboardInfo();
                      //   Navigator.pushReplacement(context,
                      //       MaterialPageRoute(builder: (context) => Home()));
                      // }

                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Container(
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                      // decoration: BoxDecoration(
                      //     color: secondaryColor,
                      //     borderRadius: BorderRadius.circular(15.0)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Next",
                                style:
                                    primaryTextStyle.copyWith(fontSize: 16.0)),
                            SizedBox(
                              width: 15.0,
                            ),
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: primaryTextColor,
                            )
                          ]),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
