import 'package:flutter/material.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

class TwitterLoginView extends StatefulWidget {
  const TwitterLoginView(
      {super.key,
      this.title = 'Login',
      this.loginText = 'Login',
      required this.onLogin,
      this.onGoogleLogin,
      this.onAppleLogin});
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

  // bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ellie'),
        ),
        body: ListView(padding: const EdgeInsets.all(20), children: [
          Center(
            child: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
            ),
          ),
          Visibility(
              visible: widget.onLogin != null,
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(color: Color.fromRGBO(73, 160, 235, 1)),
                    controller: _usernameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: 'Phone, email or username',
                    ),
                    onChanged: (String string) {
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    style: const TextStyle(color: Color.fromRGBO(73, 160, 235, 1)),
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    onFieldSubmitted: (String? string) {
                      widget.onLogin!(
                          _usernameController.text, _passwordController.text);
                    },
                    decoration: const InputDecoration(hintText: 'Password'),
                    onChanged: (String string) {
                      setState(() {});
                    },
                  ),
                  const Divider(),
                ],
              )),
          const TextDivider(
            text: 'or',
          ),
          // Visibility(
          //   visible: widget.onGoogleLogin != null,
          //   child: SignInButton(
          //     Buttons.GoogleDark,
          //     onPressed: () {},
          //   ),
          // )
        ]),
        bottomNavigationBar: Visibility(
          visible: widget.onLogin != null,
          child: BottomAppBar(
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1, color: Color.fromRGBO(33, 35, 38, 1)))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    TextButton(
                        child: const Text(
                          'Forgot password?',
                          style:
                              TextStyle(color: Color.fromRGBO(66, 144, 211, 1)),
                        ),
                        onPressed: () {}),
                    const Spacer(),
                    _LoginButton(
                      enable: _usernameController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty,
                      text: widget.loginText,
                      onTap: () {
                        widget.onLogin!(
                            _usernameController.text, _passwordController.text);
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
      {this.enable = false, required this.text, this.onTap});
  final bool enable;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0))),
      onPressed: enable ? onTap : null,
      child: Text(text),
    );
  }
}
