import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:papuf/widgets/app_button.dart';
import 'package:papuf/widgets/app_text.dart';
import 'package:papuf/widgets/text_appbar.dart';

import '../../color_hex.dart';

class ProfileTag {
  ProfileTag({this.id, this.tag});

  int id;
  String tag;
}

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.callback}) : super(key: key);

  final Function(ProfileTag) callback;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ProfileTag profileTagSelecionado;

  List<ProfileTag> profile = [
    ProfileTag(id: 1, tag: 'Professor(a)'),
    ProfileTag(id: 2, tag: 'Técnico(a)'),
    ProfileTag(id: 3, tag: 'Estudante')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // botão de voltar
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light, // status bar brightness
        elevation: 0,
        backgroundColor: hexToColor("#4163CD"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: Container(
        color: hexToColor("#4163CD"),
        width: MediaQuery.of(context)
            .size
            .width, // preenche o branco para todo o widht
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 50, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AppText(
                      "Nome",
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      mainColor: "#afbce4",
                      secondColor: "#ffffff",
                      iconForm: FontAwesomeIcons.userAlt,
                    ),
                    SizedBox(height: 15.0),
                    AppText(
                      "Email",
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      iconForm: FontAwesomeIcons.solidEnvelope,
                    ),
                    SizedBox(height: 15.0),
                    //////////////////////////////////////////////
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      padding: EdgeInsets.only(left: 15, right: 22, top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: hexToColor("#4b6bcf"),
                      ),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.thList,
                            color: Colors.white30,
                            size: 18,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          DropdownButton<int>(
                            value: (profileTagSelecionado == null)
                                ? profileTagSelecionado
                                : profileTagSelecionado.id,

                            hint: Text(
                              "Categoria de Acesso",
                              style: TextStyle(
                                color: hexToColor("#afbce4"),
                                fontSize: 16,
                              ),
                            ),
                            icon: RotatedBox(
                              quarterTurns: 1,
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white38,
                              ),
                            ),

                            iconSize: 28,
                            style: TextStyle(
                                color: profileTagSelecionado == null
                                    ? Colors.white38
                                    : Colors.white),
                            underline: Container(
                              color: Colors.transparent,
                            ),
                            onChanged: (int idSelecionado) {
                              setState(() {
                                profileTagSelecionado = profile.firstWhere(
                                    (profile) => profile.id == idSelecionado);
                              });
                              widget.callback(profileTagSelecionado);
                            },
                            items: profile.map<DropdownMenuItem<int>>(
                                (ProfileTag profile) {
                              return DropdownMenuItem<int>(
                                value: profile.id,
                                child: Text(profile.tag),
                              );
                            }).toList(),
                            dropdownColor:
                                hexToColor("#4b6bcf"), // cor de fundo da lista
                            borderRadius: BorderRadius.circular(10), // borda
                            elevation: 0, // tira a sombra
                            iconDisabledColor: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                    //////////////////////////////////////////////
                    SizedBox(height: 15.0),
                    AppText("RGA / RA",
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        iconForm: FontAwesomeIcons.solidAddressCard),
                    SizedBox(height: 15.0),
                    AppText("Senha",
                        keyboardType: TextInputType.text,
                        password: true,
                        controller: null,
                        validator: null,
                        focusNode: null,
                        iconForm: FontAwesomeIcons.lock),
                    SizedBox(height: 15.0),
                    AppText("Confirme sua senha",
                        keyboardType: TextInputType.text,
                        password: true,
                        textInputAction: TextInputAction.next,
                        iconForm: FontAwesomeIcons.lock),
                    SizedBox(height: 30.0),
                    AppButton(
                      "CADASTRAR",
                      onPressed: () {},
                      backGroundColor: "#4DE4B2",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
