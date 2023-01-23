import 'package:flutter/material.dart';

class PersonInfo extends StatelessWidget {
  const PersonInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "SolaimanLipi"),
      home: const FormPage(title: 'নাগরিকের ব্যক্তিগত তথ্যাবলি'),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SignUpForm()),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  String _name = '';
  String _email = '';
  int _age = -1;
  String _maritalStatus = 'single';
  int _selectedGender = 0;
  int _selectedVillage = 0;
  String _password = '';
  bool _termsChecked = true;

  List<DropdownMenuItem<int>> genderList = [];
  List<DropdownMenuItem<int>> villageList = [];

  void loadGenderList() {
    genderList = [];
    genderList.add(const DropdownMenuItem(
      child: Text('পুরুষ'),
      value: 0,
    ));
    genderList.add(const DropdownMenuItem(
      child: Text('নারী'),
      value: 1,
    ));
    genderList.add(const DropdownMenuItem(
      child: Text('অন্যান্য'),
      value: 2,
    ));
  }

  void loadVillagList() {
    villageList = [];
    villageList.add(const DropdownMenuItem(
      child: Text('খিরিবাড়ী'),
      value: 0,
    ));
    villageList.add(const DropdownMenuItem(
      child: Text('শিবপুর'),
      value: 1,
    ));
    villageList.add(const DropdownMenuItem(
      child: Text('সরদারহাট'),
      value: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadGenderList();
    loadVillagList();
    // Build a Form widget using the _formKey we created above
    return Form(
        key: _formKey,
        child: ListView(
          children: getFormWidget(),
        ));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = [];

    formWidget.add(DropdownButton(
      hint: const Text('গ্রাম নির্বাচন করুন'),
      items: villageList,
      value: _selectedVillage,
      onChanged: (value) {
        setState(() {
          _selectedGender = int.parse(value.toString());
        });
      },
      isExpanded: true,
    ));

    formWidget.add(TextFormField(
      decoration:
          const InputDecoration(labelText: 'নাম লিখুন', hintText: 'নাম'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'নাম আবশ্যক';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _name = value.toString();
        });
      },
    ));
    formWidget.add(TextFormField(
      decoration: const InputDecoration(
          labelText: 'পিতা/স্বামীর নাম লিখুন', hintText: 'পিতা/স্বামী'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'পিতা/স্বামীর নাম আবশ্যক';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _name = value.toString();
        });
      },
    ));
    formWidget.add(TextFormField(
      decoration: const InputDecoration(
          labelText: 'জন্ম নিবন্ধন/NID নং',
          hintText: 'জন্ম নিবন্ধন/NID নং লিখুন'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'জন্ম নিবন্ধন/NID নং আবশ্যক';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _name = value.toString();
        });
      },
    ));
    formWidget.add(TextFormField(
      decoration: const InputDecoration(
          labelText: 'জন্ম তারিখ', hintText: 'দিন-মাস-বছর'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'জন্ম তারিখ আবশ্যক';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _name = value.toString();
        });
      },
    ));
    formWidget.add(TextFormField(
      decoration: const InputDecoration(
          labelText: 'মোবাইল নাম্বর', hintText: 'মোবাইল নাম্বার'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'মোবাইল নাম্বার আবশ্যক';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _name = value.toString();
        });
      },
    ));

    formWidget.add(DropdownButton(
      hint: const Text('Select Gender'),
      items: genderList,
      value: _selectedGender,
      onChanged: (value) {
        setState(() {
          _selectedGender = int.parse(value.toString());
        });
      },
      isExpanded: true,
    ));
    formWidget.add(Text("পেশা নির্বাচন করুন"));
    formWidget.add(Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('কৃষক'),
          value: 'কৃষক',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('বেকার'),
          value: 'বেকার',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('গৃহিণী'),
          value: 'গৃহিণী',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('সরকারী চাকরিজীবী'),
          value: 'সরকারী চাকরিজীবী',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('বেসরকারী চাকরিজীবী'),
          value: 'বেসরকারী চাকরিজীবী',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
      ],
    ));

    void onPressedSubmit() {
      if (_formKey.currentState!.validate() && _termsChecked) {
        _formKey.currentState?.save();

        print("Name " + _name);
        print("Email " + _email);
        print("Age " + _age.toString());
        switch (_selectedGender) {
          case 0:
            print("Gender Male");
            break;
          case 1:
            print("Gender Female");
            break;
          case 3:
            print("Gender Others");
            break;
        }
        print("Marital Status " + _maritalStatus);
        print("Password " + _password);
        print("Termschecked " + _termsChecked.toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Form Submitted')));
      }
    }

    formWidget.add(ElevatedButton(
        child: const Text('সাবমিট'), onPressed: onPressedSubmit));

    return formWidget;
  }
}
