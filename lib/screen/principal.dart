import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'dart:math' as math show pi;

import 'package:plat11/screen/dashboard/dashboard.dart';
import 'package:plat11/screen/graficos/grafico.dart';
import 'package:plat11/screen/resultado/resultado.dart';
import 'package:plat11/screen/tabela/tabela.dart';
import 'package:plat11/util/themes.dart';

import 'clima/clima.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  NetworkImage avatarImg = const NetworkImage(
      'data:image/png;base64,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');
  NetworkImage avatarImgDark = const NetworkImage(
      'https://cdn0.iconfinder.com/data/icons/ecommerce-vol-2-solid/32/Interface_ui_ecommerce-38-512.png');
  List<CollapsibleItem> _items = List.empty();
  String _headline = "";
  int index = 0;
  List screen = [
    Clima(),
    Dashboard(),
    TabelaDados(),
    Grafico(),
    ResultadoFinal(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.purple,
    ),
  ];

  @override
  void initState() {
    super.initState();

    _items = _generateItems;
    index = 0;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => index = 0),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Errors',
        icon: Icons.cancel,
        onPressed: () => setState(() => index = 1),
      ),
      CollapsibleItem(
        text: 'Search',
        icon: Icons.search,
        onPressed: () => setState(() => index = 2),
      ),
      CollapsibleItem(
        text: 'Notifications',
        icon: Icons.notifications,
        onPressed: () => setState(() => index = 3),
      ),
      CollapsibleItem(
        text: 'Dark mode',
        icon: Icons.light_mode,
        onPressed: () => setState(() => index = 4),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    dynamic avatar = Icon(
      (EasyDynamicTheme.of(context).themeMode == ThemeMode.light)
          ? Icons.light_mode
          : Icons.dark_mode,
      size: 35,
      color: Theme.of(context).hoverColor,
    );
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: CollapsibleSidebar(
          selectedIconColor: Theme.of(context).hintColor,
          selectedIconBox: Theme.of(context).hoverColor,
          items: _items,
          avatarImg: avatar,
          title: '',
          onTitleTap: () {
            if (EasyDynamicTheme.of(context).themeMode == ThemeMode.light) {
              EasyDynamicTheme.of(context).changeTheme(dark: true);
              avatar = Icon(
                Icons.dark_mode,
                size: 35,
                color: Theme.of(context).hoverColor,
              );
            } else {
              EasyDynamicTheme.of(context).changeTheme(dark: false);
              avatar = Icon(
                Icons.light_mode,
                size: 35,
                color: Theme.of(context).hoverColor,
              );
            }
            //setState(() {});

            /*ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));*/
          },
          body: _body(size, context),
          backgroundColor: Theme.of(context).hintColor,
          selectedTextColor: Colors.black,
          unselectedIconColor: Theme.of(context).hoverColor,
          textStyle: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
          titleStyle: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          toggleTitleStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: screen[index],
    );
  }
}
