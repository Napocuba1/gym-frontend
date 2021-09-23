import 'package:flutter/material.dart';
import 'package:gym/config/ui_icons.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: size.height*0.01),
      child: Column(
        children: [
          accountNames(size, orientation),
          // myOrders(size),
          profileSettings(size, orientation),
          accountSettings(size)
        ],
      ),
    );
  }

  Widget accountNames(Size size, Orientation orientation){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.025),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Text('Mery Melendez Torrico',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text('merymelendezt.mm@gmail.com',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: orientation==Orientation.portrait?
                  size.width*0.16:
                  size.width*0.1,
                height: orientation==Orientation.portrait?
                  size.width*0.16:
                  size.width*0.1,
                child: SizedBox(
                  width: size.width*0.15,
                  height: size.width*0.15,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(300),
                    onTap: () {
                      Navigator.of(context).pushNamed('/Tabs', arguments: 1);
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('img/jar-loading.gif'),
                    ),
                  )
                ),
              ),
              Container(
                width: orientation==Orientation.portrait?
                size.width*0.2:
                size.width*0.1,
                height: orientation==Orientation.portrait?
                size.width*0.2:
                size.width*0.1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Material(
                        color: Theme.of(context).primaryColor,
                        child: InkWell(
                          splashColor: Theme.of(context).primaryColor.withOpacity(0.9),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.camera, color: Theme.of(context).accentColor, size: 20),
                          ),
                          // onTap: _takePhoto,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width*0.01),
                    ClipOval(
                      child: Material(
                        color: Theme.of(context).primaryColor,
                        child: InkWell(
                          splashColor: Theme.of(context).primaryColor.withOpacity(0.9),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.photo_library, color: Theme.of(context).accentColor, size: 20),
                          ),
                          // onTap: _selectPhoto,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget profileSettings(Size size, Orientation orientation){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.02),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), offset: Offset(0, 3), blurRadius: 10)
        ],
      ),
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          ListTile(
            leading: const Icon(UiIcons.user_1),
            title: Text('Mis Datos', style: Theme.of(context).textTheme.bodyText1),
            trailing: ButtonTheme(
              padding: const EdgeInsets.all(0),
              minWidth: size.width*0.13,
              height: size.height*0.033,
              child: TextButton(
                child: Text('Editar', style: Theme.of(context).textTheme.bodyText2),
                onPressed: (){},
              ),
            //   child: ProfileSettingsDialog(
            //     user: this._user,
            //     onChanged: () {
            //       setState(() {});
            //     },
            //   ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.04, vertical: size.height*0.01),
            child: Row(
              children: [
                Text('Nombre completo', style: Theme.of(context).textTheme.bodyText2),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Mery Esther Melendez Torrico ', style: TextStyle(color: Theme.of(context).focusColor)))
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.04, vertical: size.height*0.01),
            child: Row(
              children: [
                Text('Correo electronico', style: Theme.of(context).textTheme.bodyText2),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('merymel@gmail.com', style: TextStyle(color: Theme.of(context).focusColor))
                  )
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.04, vertical: size.height*0.01),
            child: Row(
              children: [
                Text('Telefono', style: Theme.of(context).textTheme.bodyText2),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('70121215', style: TextStyle(color: Theme.of(context).focusColor))
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget accountSettings(Size size){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.02),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), offset: Offset(0, 3), blurRadius: 10)
        ],
      ),
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          ListTile(
            leading: const Icon(UiIcons.settings_1),
            title: Text('Configuración de la cuenta', style: Theme.of(context).textTheme.bodyText1),
          ),
          // ListTile(
          //   onTap: () {},
          //   dense: true,
          //   title: Row(
          //     children: <Widget>[
          //       Icon(
          //         UiIcons.placeholder,
          //         size: 22,
          //         color: Theme.of(context).focusColor,
          //       ),
          //       SizedBox(width: size.width*0.026),
          //       Text(S.of(context).shippingAdresses, style: Theme.of(context).textTheme.bodyText2),  
          //     ],
          //   ),
          // ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/Help');
            },
            dense: true,
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.logout,
                  size: 22,
                  color: Theme.of(context).focusColor,
                ),
                SizedBox(width: size.width*0.026),
                Text('Cerrar Sesión', style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}