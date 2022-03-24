import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework/theme/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'WorkSans',
        colorScheme: ColorScheme(
          primary: primaryColor,
          onPrimary: primaryColor.withOpacity(0.3),
          primaryVariant: primaryColor.withOpacity(0.5),
          secondary: Colors.black87,
          onSecondary: Colors.black54,
          secondaryVariant: Colors.black45,
          error: Colors.red[500]!,
          onError: Colors.red[300]!,
          background: backgroundColor,
          onBackground: backgroundColor,
          surface: Colors.white,
          onSurface: Colors.white,
          brightness: Brightness.dark,
        ),
        textTheme: materialTextTheme,
        textButtonTheme: TextButtonThemeData(style: flatButtonStyle),
        elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
        outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
      ),
      home: const SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late Size _size;

  late FocusNode _emailNode;
  late FocusNode _passwordNode;

  bool obscureText = true;

  @override
  void initState() {
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Responsive(
        mobile: mobileWidget(),
        tablet: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: signedInWidget(),
          ),
        ),
        desktop: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bg_login.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      top: 16,
                      left: 16,
                      child: Image(
                        image: AssetImage("assets/logo_ekyc.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        child: Text(
                          "WELCOME TO\nVNPT eKYC",
                          style: _size.width > 1400
                              ? Theme.of(context).textTheme.headline2
                              : Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: signedInWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signedInWidget() {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      headerWidget(),
                      Column(
                        children: [
                          textField(
                            label: 'Email',
                            hint: 'Nhập email',
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                            focusNode: _emailNode,
                            onSubmitted: (value) {
                              _emailNode.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(_passwordNode);
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 12),
                          textField(
                            label: 'Mật khẩu',
                            hint: 'Nhập mật khẩu',
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                            ),
                            obscureText: obscureText,
                            textInputAction: TextInputAction.done,
                            focusNode: _passwordNode,
                            onSubmitted: (value) {
                              _passwordNode.unfocus();
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Quên mật khẩu?",
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "ĐĂNG NHẬP",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Bạn chưa có tài khoản?",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(height: 8),
                          OutlinedButton(
                            onPressed: () {},
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "ĐĂNG KÝ",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                footerWidget()
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget mobileWidget() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              backgroundColor.withOpacity(0.95),
              BlendMode.srcOver,
            ),
            child: const Image(image: AssetImage("assets/bg_top.png")),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              backgroundColor.withOpacity(0.95),
              BlendMode.srcOver,
            ),
            child: const Image(image: AssetImage("assets/bg_bottom.png")),
          ),
        ),
        Positioned.fill(
          child: signedInWidget(),
        ),
      ],
    );
  }

  Widget headerWidget() {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          const Image(image: AssetImage("assets/ic_bg_top.png")),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "ĐĂNG NHẬP",
                textAlign: TextAlign.center,
                style: _size.width > 650
                    ? Theme.of(context).textTheme.headline4
                    : Theme.of(context).textTheme.headline6,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget footerWidget() {
    return Column(
      children: [
        Text(
          "Chọn ngôn ngữ",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/ic_lang_vn.svg",
              semanticsLabel: 'Language vn',
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              "assets/ic_lang_en.svg",
              semanticsLabel: 'Language en',
            )
          ],
        ),
        const SizedBox(height: 16),
        const Center(
          child: Image(
            image: AssetImage("assets/bg_vnpt.png"),
          ),
        ),
      ],
    );
  }

  /// Simple export custom [TextField] widget
  /// params:
  ///   label: label for [TextField],
  ///   hint: hint for [TextField],
  ///   prefixIcon, suffixIcon: from [Widget] widget (prefix icon, suffix icon)
  ///   usePasswordInput: simply if true obscureText is enable otherwise disable
  ///   onSubmitted: callback [ValueChanged] when text submitted (support for [FocusNode] unFocus and next focus)
  ///   focusNode: [FocusNode]
  Widget textField(
      {String? label,
      String? hint,
      bool obscureText = false,
      Widget? prefixIcon,
      Widget? suffixIcon,
      FocusNode? focusNode,
      ValueChanged<String>? onSubmitted,
      TextInputAction? textInputAction}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(label, style: Theme.of(context).textTheme.bodyText1)
            : const SizedBox.shrink(),
        TextField(
          style: Theme.of(context).textTheme.bodyText1,
          cursorColor: Colors.white,
          obscureText: obscureText,
          enableSuggestions: obscureText,
          autocorrect: obscureText,
          focusNode: focusNode,
          onSubmitted: onSubmitted,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyText1,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
