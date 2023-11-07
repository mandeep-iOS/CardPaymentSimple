import 'package:paymenttest/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paymenttest/routes/payment/payment_util.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  TextEditingController cardNumberController = TextEditingController();

  CardType cardType = CardType.Invalid;

  // Whenever the credit card text field changes, we must run the getCardTypeFrmNumber method. You can do this by adding a listener to the cardNumberController on initState.

  @override
  void initState() {
    cardNumberController.addListener(
      () {
        getCardTypeFrmNumber();
      },
    );
    super.initState();
  }
  // Don’t forget to dispose of it.

  @override
  void dispose() {
    cardNumberController.dispose();
    super.dispose();
  }

  int selectedTabIndex = 0;
  bool saveCard = false;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: true,
          elevation: 1,
          title: R.S.payment,
        ), //
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: Insets.l),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 120),
              child: Column(
                children: [
                  const VSpace(47),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        R.S.forPayments,
                        style: TextStyles.body1
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '₦250,000',
                        style: TextStyles.body1
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const VSpace(15),
                  Divider(
                    color: theme.dividerColor,
                  ),
                  const VSpace(30),
                  CustomContainer(
                      height: 50,
                      // width: 200,
                      color: Colors.white,
                      shadows: Shadows.universal,
                      borderRadius: Corners.s8Border,
                      child: TabBar(
                          isScrollable: true,
                          unselectedLabelColor: theme.black,
                          splashBorderRadius: Corners.s8Border,
                          onTap: (val) {
                            selectedTabIndex = val;
                            setState(() {});
                          },
                          indicator: BoxDecoration(
                              borderRadius: Corners.s8Border, // Creates border
                              color: theme.primary),
                          tabs: [
                            Tab(
                              child: SizedBox(
                                width: context.widthPx * 0.4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: SvgPicture.asset(
                                        R.png.card.svg,
                                        color: selectedTabIndex == 0
                                            ? Colors.white
                                            : theme.black,
                                      ),
                                    ),
                                    const HSpace(5),
                                    Text(
                                      R.S.creditCard,
                                      style: TextStyles.body3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Tab(
                              child: SizedBox(
                                width: context.widthPx * 0.4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: SvgPicture.asset(
                                        R.png.apple.svg,
                                        color: selectedTabIndex == 1
                                            ? Colors.white
                                            : theme.black,
                                      ),
                                    ),
                                    const HSpace(5),
                                    Text(
                                      R.S.pay,
                                      style: TextStyles.body3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ])),
                  const VSpace(43.0),
                  Form(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              R.S.cardNumber,
                              style: TextStyles.body3.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme.greyWeak),
                            ),
                          ],
                        ),
                        CustomFormTextInput(
                          controller: cardNumberController,
                          type: InputType.num,
                          formatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(19),
                            CardNumberInputFormatter(),
                          ],
                          suffix: CardUtils.getCardIcon(cardType),
                        ),
                        VSpace(context.sp(25)),
                        Row(
                          children: [
                            Text(
                              R.S.cardholderName,
                              style: TextStyles.body3.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme.greyWeak),
                            ),
                          ],
                        ),
                        const CustomFormTextInput(),
                        const VSpace(25),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        R.S.cvc,
                                        style: TextStyles.body3.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: theme.greyWeak),
                                      ),
                                    ],
                                  ),
                                  CustomFormTextInput(
                                    // keyboardType: TextInputType.number,
                                    formatter: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      // Limit the input
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                    // decoration: const InputDecoration(hintText: "CVV"),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        R.S.expiresDate,
                                        style: TextStyles.body3.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: theme.greyWeak),
                                      ),
                                    ],
                                  ),
                                  CustomFormTextInput(
                                    // keyboardType: TextInputType.number,
                                    formatter: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(5),
                                      CardMonthInputFormatter(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const VSpace(46),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(R.S.saveCard,
                                  style: TextStyles.body1.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600)),
                              Switch(
                                  value: saveCard,
                                  onChanged: (bool value) {
                                    saveCard = !saveCard;
                                    setState(() {});
                                  },
                                  activeColor: theme.primary)
                            ]),
                      ],
                    ),
                  ),
                  const VSpace(46),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: PrimaryButton(
                      onPressed: () {
                        // context.push(const ConfirmedPaymentScreen());
                      },
                      label: R.S.pay,
                      fullWidth: true,
                      radius: Corners.s8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // In this class, lets define a method that lets us know the card type and updates it accordingly.

  void getCardTypeFrmNumber() {
    if (cardNumberController.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }
}

class LogoIconItem extends StatelessWidget {
  const LogoIconItem({super.key, this.allRoundPadding = 15, this.iconUrl});
  final double allRoundPadding;

  final String? iconUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(allRoundPadding),
      child: Image.asset(
        iconUrl ?? R.png.appLogoGrey.imgPng, //
      ),
    );
  }
}
