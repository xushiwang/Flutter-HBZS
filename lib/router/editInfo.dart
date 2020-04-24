import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditInfo extends StatefulWidget {
  EditInfo({Key key}) : super(key: key);

  @override
  _EditInfoState createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  String _name;
  String _phoneNumber;
  String _email;
  String _password;
  String _validateName;

  @override
  Widget build(BuildContext context) {
    var _passwordFieldKey;
    return SizedBox(
        height: 300,
        child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxisScrolled) {
                return <Widget>[
                  SliverAppBar(
                      backgroundColor: Colors.white,
                      iconTheme: IconThemeData(color: Colors.black),
                      expandedHeight: 200.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(
                          "个人信息",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        background: Image.network(
                            "https://img2.woyaogexing.com/2019/12/28/ebc0f9f2e4bd498283d51d96f878f391!400x400.jpeg",
                            fit: BoxFit.cover),
                      ),
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(Icons.done),
                          color: Colors.black,
                          onPressed: () {
                            print("保存个人信息");
                          },
                        )
                      ])
                ];
              },
              body: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(children: <Widget>[
                    SizedBox(height: 24.0),
                    // "Name" form.
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.person),
                        hintText: '给自己起个喜欢的名字吧',
                        labelText: '昵称',
                      ),
                      onSaved: (String value) {
                        this._name = value;
                        print('name=$_name');
                      },
                    ),
                    SizedBox(height: 24.0),
                    // "Phone number" form.
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.phone),
                        hintText: '让朋友快速联系到你',
                        labelText: '手机号',
                        prefixText: '+86',
                      ),
                      keyboardType: TextInputType.phone,
                      onSaved: (String value) {
                        this._phoneNumber = value;
                        print('phoneNumber=$_phoneNumber');
                      },
                      // TextInputFormatters are applied in sequence.
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                    ),
                    SizedBox(height: 24.0),
                    // "Email" form.
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.email),
                        hintText: '邮箱',
                        labelText: '电子邮箱',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String value) {
                        this._email = value;
                        print('email=$_email');
                      },
                    ),
                    SizedBox(height: 24.0),
                    // "Life story" form.
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '点击编辑个性签名',
                        helperText: '',
                        labelText: '个性签名',
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 24.0),
                    // "Salary" form.
                    TextFormField(
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ta的学号',
                          suffixText: 'Ta的课表',
                          suffixStyle: TextStyle(color: Colors.green)),
                      maxLines: 1,
                    ),
                    SizedBox(height: 24.0),
                    // "Password" form.
                    PasswordField(
                      fieldKey: _passwordFieldKey,
                      helperText: '',
                      labelText: '',
                      onFieldSubmitted: (String value) {
                        setState(() {
                          this._password = value;
                        });
                      },
                    ),
                    SizedBox(height: 24.0),
                    // "Re-type password" form.
                    TextFormField(
                      enableInteractiveSelection: false,
                      enabled:
                          this._password != null && this._password.isNotEmpty,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        labelText: '再次输入密码',
                      ),
                      maxLength: 20,
                      obscureText: true,
                    ),
                  ]))),
        ));
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 20,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
