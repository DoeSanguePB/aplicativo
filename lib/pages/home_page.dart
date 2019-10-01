import 'package:doe_sangue_pb/pages/campanhas/campanhas_page.dart';
import 'package:doe_sangue_pb/pages/chat/chat_page.dart';
import 'package:doe_sangue_pb/pages/locais/locais_page.dart';
import 'package:doe_sangue_pb/pages/mais_opcoes/mais_opcoes_page.dart';
import 'package:doe_sangue_pb/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<String> _titles = [
    'Campanhas',
    'Chat',
    'Locais',
    'Mais opções'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: _buildBody(_selectedIndex),),
        _buildBottomBar()
      ],
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0: return CampanhasPage();
      case 1: return ChatPage();
      case 2: return LocaisPage();
      case 3: return MaisOpcoesPage();
      default:
        return Container(color: backgroundWhite,);
    }
  }

  Widget _buildBottomBar() {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: primaryColor),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), title: Text(_titles[0])),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), title: Text(_titles[1])),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), title: Text(_titles[2])),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz), title: Text(_titles[3])),
        ],
        currentIndex: _selectedIndex,
        fixedColor: backgroundWhite,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
