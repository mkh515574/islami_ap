import 'package:flutter/cupertino.dart';
import 'package:islamic_app/features/home/Radio/widgets/radio_item_card.dart';

class RadioListViewBuilder extends StatelessWidget {
  const RadioListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => RadioItemCard(),
        separatorBuilder: (context, index) =>  SizedBox(

          height: MediaQuery.of(context).size.height*0.02,
        ),
        itemCount: 10,
      ),
    );
  }
}
