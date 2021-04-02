import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://depor.com/resizer/wIWk8pcoGZVeAg5PSjnoelElqH4=/980x528/smart/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/GBRZ6TEOCBASHLQPQFVTJGC66Y.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.futuro.cl/wp-content/uploads/2019/02/wolverine-hugh-jackman-comics-web-590x340.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('EV'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://vignette.wikia.nocookie.net/gotg-disney/images/8/80/PeterQuill.jpg/revision/latest?cb=20170527175537'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}