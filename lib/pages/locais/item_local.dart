import 'package:doe_sangue_pb/domain/local_de_doacao.dart';
import 'package:doe_sangue_pb/utils/colors.dart';
import 'package:doe_sangue_pb/utils/maps_utils.dart';
import 'package:doe_sangue_pb/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'package:url_launcher/url_launcher.dart';

class ItemLocal extends StatelessWidget {
  final LocalDeDoacao localDeDoacao;

  const ItemLocal({Key key, this.localDeDoacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openBottomSheet(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    localDeDoacao.nome,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  TextBlack("${localDeDoacao.logradouro}. ${localDeDoacao.bairro}"),
                  TextBlack("${localDeDoacao.cidade} - ${localDeDoacao.uf}"),
                  TextBlack(localDeDoacao.telefone),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.call),
                  color: primaryColor,
                  onPressed: () {
                    _openDialer(context);
                  },
                ),
                Text(
                  "Ligar",
                  style: TextStyle(color: primaryColor, fontSize: 12.0),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.map),
                  color: primaryColor,
                  onPressed: () {
                    _openMap(context);
                  },
                ),
                Text(
                  "Mapa",
                  style: TextStyle(color: primaryColor, fontSize: 12.0),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _openDialer(BuildContext context) async {
    final url = "tel:0${localDeDoacao.telefoneSemSimbolos()}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showSnackbar(context, "Não foi possível abrir o discador");
    }
  }

  void _openMap(BuildContext context) {
    openMaps(localDeDoacao.latitude, localDeDoacao.longitude, localDeDoacao.nome, () {
      _showSnackbar(context, "Não foi possível abrir o mapa");
    });
  }

  void _openDirections(BuildContext context) {
    openDirections(localDeDoacao.latitude, localDeDoacao.longitude, () {
      _showSnackbar(context, "Não foi possível abrir o GPS");
    });
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: const Radius.circular(16.0), topRight: const Radius.circular(16.0)),
        ),
        builder: (ctx) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  localDeDoacao.nome,
                  style: Theme.of(context).textTheme.headline.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.place,
                  color: Colors.black,
                ),
                title: Text("${localDeDoacao.logradouro}. ${localDeDoacao.bairro}"),
                subtitle: Text("${localDeDoacao.cidade} - ${localDeDoacao.uf}"),
                onTap: () {
                  _openMap(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                title: Text(localDeDoacao.telefone),
                onTap: () {
                  _openDialer(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Share.share(localDeDoacao.shareText());
                      },
                      child: Text("COMPARTILHAR"),
                      textColor: primaryColor,
                    ),
                    FlatButton(
                      onPressed: () {
                        _openDirections(context);
                      },
                      child: Text("COMO CHEGAR"),
                      textColor: primaryColor,
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  void _showSnackbar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
