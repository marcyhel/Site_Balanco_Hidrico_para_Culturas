import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

List<String> UF = [
  "AC",
  "AL",
  "AP",
  "AM",
  "BA",
  "CE",
  "DF",
  "ES",
  "GO",
  "MA",
  "MT",
  "MS",
  "MG",
  "PA",
  "PB",
  "PR",
  "PE",
  "PI",
  "RJ",
  "RN",
  "RS",
  "RO",
  "RR",
  "SC",
  "SP",
  "SE",
  "TO",
];

class _DropDownState extends State<DropDown> {
  String selec = UF[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: AwesomeDropDown(
        numOfListItemToShow: 6,
        elevation: 8,
        isPanDown: false,
        dropDownList: UF,
        dropDownIcon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
          size: 23,
        ),
        selectedItem: selec,
        onDropDownItemClick: (selectedItem) {
          selec = selectedItem;
        },
        dropStateChanged: (isOpened) {
          /* _isDropDownOpened = isOpened;
                if (!isOpened) {
                  _isBackPressedOrTouchedOutSide = false;
                }*/
        },
      ),
    );
  }
}
