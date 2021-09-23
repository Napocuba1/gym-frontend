import 'package:flutter/material.dart';
import 'package:gym/config/ui_icons.dart';
import 'package:gym/src/pages/account.dart';
import 'package:gym/src/pages/reservation.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key, required int this.currentTab}) : super(key: key);
  String currentTitle = 'Gimnasio';
  Widget currentPage = Account();
  int selectedTab = 1;
  int currentTab = 1;

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

@override
  initState() {
    _selectTab(widget.currentTab);
    super.initState();
  }

  @override
  void didUpdateWidget(Tabs oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      widget.selectedTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentTitle = 'Perfil';
          widget.currentPage = Account();
          break;
        case 1:
          widget.currentTitle = 'Reservas';
          widget.currentPage = Reservation();
          // widget.currentPage = AccountWidget();
          break;
        case 2:
          widget.currentTitle = 'Planes';
          // widget.currentPage = Home();
          break;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: onBackPressed,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Align(
              alignment: Alignment.center,
              child: Text(widget.currentTitle, style: Theme.of(context).textTheme.headline3),
            ),
          ),
          body: widget.currentPage,
          bottomNavigationBar: bottomNavigatorBarItem(size, orientation),
        ),
      ),
    );
  }

  Widget bottomNavigatorBarItem(Size size, Orientation orientation){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      iconSize: 22,
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedIconTheme: const IconThemeData(size: 25),
      unselectedItemColor: Theme.of(context).hintColor.withOpacity(1),
      currentIndex: widget.selectedTab,
      onTap: (int i) => _selectTab(i),
      items: [
        // BottomNavigationBarItem(icon: Icon(Typiconsfont.ticket, size: orientation == Orientation.portrait && size.height <1000? 24: orientation == Orientation.landscape && size.width <1000? 24: 35), label: ''),
        // BottomNavigationBarItem(icon: Icon(Typiconsfont.store, size: orientation == Orientation.portrait && size.height <1000? 24: orientation == Orientation.landscape && size.width <1000? 24: 35), label: ''),
        // BottomNavigationBarItem(icon: Icon(UiIcons.alarm_clock, size: orientation == Orientation.portrait && size.height <1000? 24: orientation == Orientation.landscape && size.width <1000? 24: 35), label: ''),
        BottomNavigationBarItem(icon: Icon(UiIcons.user_1, size: orientation == Orientation.portrait && size.height <1000? 24: orientation == Orientation.landscape && size.width <1000? 24: 35), label: ''),
        BottomNavigationBarItem(
          label: '',
          activeIcon: Container(
            width: orientation == Orientation.portrait && size.height <1000? 45: orientation == Orientation.landscape && size.width <1000? 45: 60,
            height: orientation == Orientation.portrait && size.height <1000? 45: orientation == Orientation.landscape && size.width <1000? 45: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(color: Theme.of(context).colorScheme.secondary.withOpacity(0.4), blurRadius: 40, offset: Offset(0, 15)),
                BoxShadow(color: Theme.of(context).colorScheme.secondary.withOpacity(0.4), blurRadius: 13, offset: Offset(0, 3))
              ],
            ),
            child: Icon(UiIcons.home, color: Theme.of(context).primaryColor, size: orientation == Orientation.portrait && size.height <1000? 24: orientation == Orientation.landscape && size.width <1000? 24: 35),
          ),
          icon: Container(
            width: orientation == Orientation.portrait && size.height <1000? 45: orientation == Orientation.landscape && size.width <1000? 45: 60,
            height: orientation == Orientation.portrait && size.height <1000? 45: orientation == Orientation.landscape && size.width <1000? 45: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.4), blurRadius: 40, offset: Offset(0, 15)),
                BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.4), blurRadius: 13, offset: Offset(0, 3))
              ],
            ),
            child: Icon(UiIcons.home, color: Theme.of(context).hintColor, size: orientation == Orientation.portrait && size.height <1000? 24: orientation == Orientation.landscape && size.width <1000? 24: 35),
          ),
          
        ),
        BottomNavigationBarItem(icon: Icon(Icons.fact_check_outlined, size: orientation == Orientation.portrait && size.height <1000? 24: orientation == Orientation.landscape && size.width <1000? 24: 35), label: ''),
      ],
    );
  }

  Future<bool> onBackPressed() async{
    final size = MediaQuery.of(context).size;
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Desea salir del Gimnasio Pepito?'),
        content: Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar', style: Theme.of(context).textTheme.headline6!.merge(TextStyle(color: Theme.of(context).colorScheme.secondary))),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: size.height*0.015, horizontal: size.width*0.06),
                primary: Theme.of(context).primaryColor,
                shape: const StadiumBorder(),
              ),
            ),
            SizedBox(width: size.width*0.05),
            ElevatedButton(
              onPressed: () async{
                // prefs.session =false;
                // _storage.deleteAll();
                // Navigator.of(context).pushNamedAndRemoveUntil('/SignIn', (Route<dynamic> route)=>false);
              },
              child: Text('Aceptar', style: Theme.of(context).textTheme.headline6!.merge(TextStyle(color: Theme.of(context).primaryColor))),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: size.height*0.015, horizontal: size.width*0.06),
                primary: Theme.of(context).colorScheme.secondary,
                shape: const StadiumBorder(),
              )
            )
          ],
        ),
      ),
    ) ??
    false;
  }
}