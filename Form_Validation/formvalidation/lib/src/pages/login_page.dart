import 'package:flutter/material.dart';
import 'bloc/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Stack(
        children: <Widget>[_crearFondo(context), _loginForm(context)],
      )),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoMorado = Container(
        height: size.height * .4,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(63, 63, 156, 1.0),
          Color.fromRGBO(90, 70, 178, 1.0)
        ])));

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, left: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(children: <Widget>[
            Icon(
              Icons.person_pin_circle,
              color: Colors.white,
              size: 100.0,
            ),
            SizedBox(
              height: 10.0,
              width: double.infinity,
            ),
            Text(
              'Erik Villegas',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            )
          ]),
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        SafeArea(child: Container(height: 180)),
        Container(
          width: size.width * 0.85,
          margin: EdgeInsets.symmetric(vertical: 30.0),
          padding: EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0)
            ],
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Text('Ingreso', style: TextStyle(fontSize: 20)),
              SizedBox(height: 60.0),
              _crearEmail(bloc),
              SizedBox(height: 30.0),
              _crearPassword(bloc),
              SizedBox(height: 30.0),
              _crearBotton()
            ],
          ),
        ),
        Text('¿Olvido la contraseña?'),
        SizedBox(height: 100.0)
      ]),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
                    hintText: 'ejemplo@ejemplo.com',
                    labelText: 'Correo Electrónico',
                    counterText: snapshot.data),
                onChanged: bloc.changeEmail,
              ));
        });
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
                  labelText: 'Contraseña'),
              onChanged: bloc.changePassword,
            ));
      },
    );
  }

  Widget _crearBotton() {
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0),
          child: Text('Ingresar'),
        ),
        // style: ButtonStyle(
        //     backgroundColor:
        //         MaterialStateProperty.all<Color>(Colors.deepPurple)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: () => {});
  }
}
