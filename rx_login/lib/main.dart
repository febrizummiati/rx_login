import 'package:flutter/material.dart';
import 'package:rxlogin/bloc/login_bloc.dart';
import 'package:rxlogin/bloc/register_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      initialRoute: '/login',
      routes: {
        '/login' : (context) => LoginPage(),
        RegisterPage.routeName : (context) => RegisterPage(),
        HomePage.routeName : (context) => HomePage(),
      },
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Halaman Login'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover),
              SizedBox(height: 30,),
              StreamBuilder<String>(
                stream: loginBloc.username,
                builder: (context, snapshot){
                  return TextField(
                    onChanged: loginBloc.onChangeUsername,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                      errorText: snapshot.error,
                    ),
                  );
                },
              ),
              SizedBox(height: 30,),
              StreamBuilder<String>(
                stream: loginBloc.password,
                builder: (context, snapshot){
                  return TextField(
                    onChanged: loginBloc.onChangePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                      errorText: snapshot.error,
                    ),
                  );
                },
              ),
              SizedBox(height: 30,),
              StreamBuilder<bool> (
                  stream: loginBloc.isValid,
                  builder:(context, snapshot) {
                    return MaterialButton(
                      onPressed: (){
                        Navigator.pushNamed(context, HomePage.routeName);
                      },
                      child: Text('Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),),
                      color: Colors.teal,
                    );
                  }
              ),
              SizedBox(height: 30,),
              Text('Belum punya akun?, Registrasi dibawah!', style: TextStyle(fontSize: 15),),
              SizedBox(height: 20,),
              MaterialButton(
                onPressed: (){
                  Navigator.pushNamed(context, RegisterPage.routeName);
                },
                child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 20),),
                color: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  static const String routeName = "/registerPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Halaman Register'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(height: 30,),
              StreamBuilder<String>(
                stream: registerBloc.nim,
                builder: (context, snapshot){
                  return TextField(
                    onChanged: registerBloc.onChangeNim,
                    decoration: InputDecoration(
                      hintText: 'NIM',
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                      errorText: snapshot.error,
                    ),
                  );
                },
              ),
              SizedBox(height: 30,),
              StreamBuilder<String>(
                stream: registerBloc.email,
                builder: (context, snapshot){
                  return TextField(
                    onChanged: registerBloc.onChangeEmail,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                      errorText: snapshot.error,
                    ),
                  );
                },
              ),
              SizedBox(height: 30,),
              StreamBuilder<String>(
                stream: registerBloc.password,
                builder: (context, snapshot){
                  return TextField(
                    onChanged: registerBloc.onChangePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                      errorText: snapshot.error,
                    ),
                  );
                },
              ),

              SizedBox(height: 30,),
              StreamBuilder<bool> (
                  stream: registerBloc.isValid,
                  builder:(context, snapshot) {
                    return MaterialButton(
                      onPressed: (){
                        Navigator.pushNamed(context, HomePage.routeName);
                      },
                      child: Text('Register',
                        style: TextStyle(color: Colors.white, fontSize: 20),),
                      color: Colors.teal,
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  static const String routeName = "/homePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Home'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset('assets/ane.jpg',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover),
                ),

                SizedBox(height: 30,),
                Text('Ahlan Wa Sahlan',
                  style: TextStyle(fontSize: 28,),
                ),
                SizedBox(height: 30,),
                Text('Assalamualaikum, Uda. Nama saya Febri Zummiati (1701081002). Saya merupakan mahasiswi di Politeknik Negeri Padang jurusan Teknologi Informasi program studi Teknik Komputer kelas 3B.',
                  style: TextStyle(fontSize: 16,),
                ),
              ]
          ),
        ),
      ),
    );
  }
}



