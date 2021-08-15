import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login/model/profile.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '',name: '',agency: '',phone: '',date: '');
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สร้างบัญชีผู้ใช้"),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
            child: SingleChildScrollView(
          child: Column(
            children: [
              Text("E-mail", style: TextStyle(fontSize: 20)),
              TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: "กรุณาป้อนอีเมล"),
                  EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")

                ]),
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? email){
                  profile.email = email!;
                },
              ),
              SizedBox(
                height: 50,
              ),
              Text("Password", style: TextStyle(fontSize: 20)),
              TextFormField(
                validator: RequiredValidator(errorText: "กรุณาป้อนรหัสผ่าน"),
                obscureText: true,
                onSaved: (String? password){
                  profile.password = password!;
                },
              ),
              SizedBox(
                height: 50,
              ),
              Text("กรอกชื่อ-นามสกุล", style: TextStyle(fontSize: 20)),
              TextFormField(
                validator: RequiredValidator(errorText: "กรุณาป้อนชื่อ-นามสกุล"),
                onSaved: (String? name){
                  profile.name = name!;
                },
              ),
              SizedBox(
                height: 50,
              ),
              Text("กรอกหน่วยงาน", style: TextStyle(fontSize: 20)),
              TextFormField(
                validator: RequiredValidator(errorText: "กรุณาป้อนหน่วยงาน"),
                onSaved: (String? agency){
                  profile.agency = agency!;
                },
              ),
              SizedBox(
                height: 50,
              ),
              Text("กรอกเบอร์โทร", style: TextStyle(fontSize: 20)),
              TextFormField(
                validator: RequiredValidator(errorText: "กรุณาป้อนเบอร์โทร"),
                onSaved: (String? phone){
                  profile.phone = phone!;
                },
              ),
              SizedBox(
                height: 50,
              ),
              Text("กรอกวันเกิด", style: TextStyle(fontSize: 20)),
              TextFormField(
                validator: RequiredValidator(errorText: "กรุณาป้อนวันเกิด"),
                onSaved: (String? date){
                  profile.date = date!;
                },
              ),
              
              SizedBox(
                
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("ลงทะเบียน", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                    print("email = ${profile.email} password = ${profile.password} name = ${profile.name} agency = ${profile.agency} phone = ${profile.phone} date = ${profile.date}");
                    formKey.currentState!.reset();
                    }
                  },
                ),
              )
            ],
          ),
        )),
      )),
    );
  }
}