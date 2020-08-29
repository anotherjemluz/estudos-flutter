import 'package:flutter/material.dart';

class ProductFormScreen extends StatefulWidget {
  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  // define o foco do formulário
  final _descFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();

  final _imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imageFocusNode.addListener(upgradeImageUrl);
  }

  void upgradeImageUrl() {
    setState(() {
      
    });
  }

  //
  @override
  void dispose() {
    super.dispose();
    _descFocusNode.dispose();
    _priceFocusNode.dispose();

    _imageFocusNode.removeListener(upgradeImageUrl);
    _imageFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produto'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        child: Form(
          child: ListView(
            children: <Widget>[
              // PREVIEW DA IMAGEM
              Container(
                  height: 200,
                  width: 100,
                  margin:
                      EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: _imageController.text.isEmpty
                      ? Center(
                          child: Text(
                            "Image preview",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        )
                      : FittedBox(
                          child: Image.network(
                            _imageController.text,
                            fit: BoxFit.cover,
                          ),
                        )),

              // TITULO
              TextFormField(
                decoration: InputDecoration(labelText: 'Titulo'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
              ),

              // PREÇO
              TextFormField(
                decoration: InputDecoration(labelText: 'Preço'),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descFocusNode);
                },
              ),

              // DESCRICAO
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                focusNode: _descFocusNode,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),

              // IMAGEM
              TextFormField(
                decoration: InputDecoration(labelText: 'Url da imagem'),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                focusNode: _imageFocusNode,
                controller: _imageController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
