import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'userDashboard.dart';
import 'style.dart';
import 'text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Smita',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
        // Define the default font family..
        //fontFamily: 'Monsterrat',
        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: MyHomePage(title: 'No Queue Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //FIELDS
  bool isButtonPressed = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _mobile;

  //METHODS
  String validateMobile(String value) {
    var potentialNumber = int.tryParse(value);
    if (potentialNumber == null) {
      return 'Enter a phone number';
    } else if ((value.length > 10)) {
      return 'Enter a valid phone number';
    } else if ((value.length < 8)) {
      return 'Enter a valid phone number';
    } else
      return null;

    //Pattern pattern = "9611009823";
    //Pattern pattern = "^((\+){1}91){1}[1-9]{1}[0-9]{9}\$";
    // RegExp regex = new RegExp(pattern);
    // if (!regex.hasMatch(value))
    //   return 'Phone number is not valid';
    // else
    //   return null;
  }

  //UI ELEMENTS
  final headingText = Text(
    loginMainTxt,
    textAlign: TextAlign.left,
    //textDirection: TextDirection.ltr,
    //textWidthBasis: TextWidthBasis.longestLine,
    style: labelTextStyle,
  );
  final loginText = Text(
    loginSubTxt,
    textAlign: TextAlign.left,
    style: subLabelTextStyle,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          margin: new EdgeInsets.all(15.0),
          child: new Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: formUI(context),
          ),
        ),
      ),
    );
  } //widget

  Widget formUI(BuildContext context) {
    final phNumField = TextFormField(
      obscureText: false,
      maxLines: 1,
      minLines: 1,
      style: inputTextStyle,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Enter 10 digit Mobile Number',
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red[400])),
        //border: InputBorder.none,
        //contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        //hintStyle: hintTextStyle,
        //hintText: "Phone Number",
        //border:OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)
      ),
      validator: validateMobile,
      onSaved: (value) => _mobile = value,
      //onSubmitted: _phoneNumberValidator,
    );
    final loginButon = Material(
      elevation: 10.0,
      //borderRadius: BorderRadius.circular(30.0),
      color: isButtonPressed
          ? Theme.of(context).primaryColor
          : Theme.of(context).accentColor,

      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.fromLTRB(10.0, 7.5, 10.0, 7.5),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            _formKey.currentState.save();
            // Scaffold.of(context)
            //     .showSnackBar(SnackBar(content: Text('Processing Data')));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserDashboard()));
          } else {
            setState(() {
              _autoValidate = true;
            });
          }
        },
        child: Text(
          "Login with OTP",
          textAlign: TextAlign.center,
          style: buttonTextStyle,
        ),
      ),
    );
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 155.0,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
          ),
        ),
        Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[headingText, loginText]),
        SizedBox(height: 30.0),
        phNumField,
        SizedBox(height: 10.0),
        loginButon
      ],
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
