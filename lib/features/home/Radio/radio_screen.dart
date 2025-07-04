import 'package:flutter/cupertino.dart';
import 'package:islamic_app/core/constants/app_assets.dart';

import 'package:islamic_app/core/constants/app_text_style.dart';

import 'package:islamic_app/features/home/Radio/widgets/custom_toggle_buttons.dart';
import 'package:islamic_app/features/home/Radio/widgets/radio_list_view_builder.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isRadioSelected = true;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.radioBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(

          children: [
            Image.asset(AppAssets.logo),
            CustomToggleButtons(
              isFirstSelected: isRadioSelected,
              firstTitle: "Radio",
              secondTitle: "Reciters",
              onFirstTap: () {
                setState(() {
                  isRadioSelected = true;
                });
              },
              onSecondTap: () {
                setState(() {
                  isRadioSelected = false;
                });
              },
            ),


            isRadioSelected
                ? RadioListViewBuilder()
                : Expanded(child: Center(child: Text("Reciters coming soon",style: AppTextStyle.bold20white))),
          ],
        ),
      ),
    );
  }
}
