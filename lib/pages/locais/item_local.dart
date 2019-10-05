import 'package:doe_sangue_pb/domain/local_de_doacao.dart';
import 'package:doe_sangue_pb/utils/colors.dart';
import 'package:doe_sangue_pb/utils/widgets.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class ItemLocal extends StatefulWidget {
  final LocalDeDoacao localDeDoacao;

  const ItemLocal({Key key, this.localDeDoacao}) : super(key: key);

  @override
  _ItemLocalState createState() => _ItemLocalState();
}

class _ItemLocalState extends State<ItemLocal> {
  bool _expanded = false;

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _toggle();
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
                    widget.localDeDoacao.nome,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  TextBlack("${widget.localDeDoacao.logradouro}. ${widget.localDeDoacao.bairro}"),
                  TextBlack("${widget.localDeDoacao.cidade} - ${widget.localDeDoacao.uf}"),
                  TextBlack(widget.localDeDoacao.telefone),
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
    final url = "tel:0${widget.localDeDoacao.telefoneSemSimbolos()}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showSnackbar(context, "Não foi possível abrir o discador");
    }
  }

  void _openMap(BuildContext context) async {
    final url = "geo:0,0?q=${widget.localDeDoacao.latitude},${widget.localDeDoacao.longitude}(${widget.localDeDoacao.nome})";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showSnackbar(context, "Não foi possível abrir o mapa");
    }
  }

  void _showSnackbar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      )
    );
  }
}
