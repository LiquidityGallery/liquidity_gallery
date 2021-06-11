import 'package:flutter/material.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

class TwitterLoginView extends StatelessWidget {
  TwitterLoginView(
      {Key? key, this.title = 'Login', this.text = 'Login', required this.onLogin})
      : super(key: key);
  final String title;
  final String text;
  final Function(String, String) onLogin;

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: twitterLightOutTheme,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Ellie'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Phone, email or username',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted: (String? string) {
                    onLogin(_username.text, _password.text);
                  },
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                Divider()
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
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
                          style:
                          TextStyle(color: Color.fromRGBO(66, 144, 211, 1)),
                        ),
                        onPressed: () {}),
                    Spacer(),
                    _LoginButton(
                      enable: false,
                      text: text,
                      onTap: () {
                        onLogin(_username.text, _password.text);
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
      child: Text(text),
      onPressed: enable ? onTap : null,
    );
  }
}
