import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

class TwitterLoginView extends StatefulWidget {
  TwitterLoginView(
      {Key? key,
      this.title = 'Login',
      this.loginText = 'Login',
      required this.onLogin,
      this.onGoogleLogin,
      this.onAppleLogin})
      : super(key: key);
  final String title;
  final String loginText;
  final Function(String, String)? onLogin;
  final Function()? onGoogleLogin;
  final Function()? onAppleLogin;

  @override
  _TwitterLoginViewState createState() => _TwitterLoginViewState();
}

class _TwitterLoginViewState extends State<TwitterLoginView> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ellie'),
        ),
        body: ListView(padding: EdgeInsets.all(20), children: [
          Center(
            child: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
            ),
          ),
          Visibility(
              visible: widget.onLogin != null,
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Color.fromRGBO(73, 160, 235, 1)),
                    controller: _usernameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Phone, email or username',
                    ),
                    onChanged: (String string) {
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Color.fromRGBO(73, 160, 235, 1)),
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    onFieldSubmitted: (String? string) {
                      widget.onLogin!(
                          _usernameController.text, _passwordController.text);
                    },
                    decoration: InputDecoration(hintText: 'Password'),
                    onChanged: (String string) {
                      setState(() {});
                    },
                  ),
                  Divider(),
                ],
              )),
          TextDivider(text: 'or',),
          Visibility(
            visible: widget.onGoogleLogin != null,
            child: SignInButton(
              Buttons.GoogleDark,
              onPressed: () {},
            ),
          )
        ]),
        bottomNavigationBar: Visibility(
          visible: widget.onLogin != null,
          child: BottomAppBar(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1, color: Color.fromRGBO(33, 35, 38, 1)))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    TextButton(
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Color.fromRGBO(66, 144, 211, 1)),
                        ),
                        onPressed: () {}),
                    Spacer(),
                    _LoginButton(
                      enable: _usernameController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty,
                      text: widget.loginText,
                      onTap: () {
                        widget.onLogin!(_usernameController.text,
                            _passwordController.text);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton(
      {Key? key, this.enable = false, required this.text, this.onTap})
      : super(key: key);
  final bool enable;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0))),
      child: Text(text),
      onPressed: enable ? onTap : null,
    );
  }
}
