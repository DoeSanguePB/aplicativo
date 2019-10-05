import 'package:doe_sangue_pb/domain/local_de_doacao.dart';
import 'package:doe_sangue_pb/pages/locais/item_local.dart';
import 'package:flutter/material.dart';

class LocaisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Locais de Doação"),
      ),
      body: _buildList(context, locaisDeDoacao),
    );
  }

  Widget _buildList(BuildContext context, List<LocalDeDoacao> locais) {
    return ListView.separated(
        itemBuilder: (context, index) => ItemLocal(localDeDoacao: locais[index]),
        separatorBuilder: (context, index) => _divider,
        itemCount: locais.length);
  }

  Widget _divider = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Divider(
      color: Colors.grey,
      height: 8.0,
    ),
  );
}
