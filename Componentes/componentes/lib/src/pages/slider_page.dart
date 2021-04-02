import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('Sliders'),
         ),
         body: Container(
           padding: EdgeInsets.only(top: 50.0),
           child: Column(
             children: <Widget>[
               _crearSlider(),
               _crearCheckBox(),
               _crearSwitch(),
               Expanded(
                 child: _crearImagen(),
               )
             ],
           )
         ),
       ),
    );
  }

  _crearSlider() {

    return Slider(
      activeColor: Colors.indigo,
      label: 'Valor actual: ${_valorSlider.toInt()}',
      value: _valorSlider,
      min: 10,
      max: MediaQuery.of(context).size.width,
      onChanged: ( _bloquearCheck ) ? null :      
      (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
    );

  }

  _crearCheckBox(){
    return CheckboxListTile(
      value: _bloquearCheck,
      title: Text('Bloquear Slider'),
      onChanged: (valor){
        _bloquearCheck = valor;
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearSwitch(){
    return SwitchListTile(
      value: _bloquearCheck,
      title: Text('Bloquear Slider'),
      onChanged: (valor){
        _bloquearCheck = valor;
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  _crearImagen() {

    return FadeInImage(
      image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/thumb/5/5d/Wolverine_%28James_%27Logan%27_Howlett%29.png/250px-Wolverine_%28James_%27Logan%27_Howlett%29.png'),
      placeholder: AssetImage('assets/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 200),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}