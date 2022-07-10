import 'dart:io';

import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/Blog.dart';
import 'package:news/models/Reservation.dart';
import 'package:news/models/Room.dart';
import 'package:news/responsive.dart';
import 'package:http/http.dart' as http;
import 'package:radio_group_v2/radio_group_v2.dart';
import 'dart:convert';
import '../../../constants.dart';
import 'package:intl/intl.dart';

class BlogPostCard extends StatefulWidget {
  const BlogPostCard({
    Key? key,
  }) : super(key: key);

  @override
  State<BlogPostCard> createState() => _BlogPostCardState();
}

final List<String> genderItems = [
  'Male',
  'Female',
];

final List<String> catProfs = [
  'Cadres,professions intellectuelles supérieures',
  'Professions intermédiaires',
  'Employés et ouvriers',
  'Retraités',
  'Etudiants',
  'Autres',
  'Non réponse',
];

bool isCompleted = false;
String? selectedValue;
List<RadioGroupController> _ageController =
    List.generate(3, (i) => RadioGroupController());
List<RadioGroupController> _sexeController =
    List.generate(3, (i) => RadioGroupController());

class _BlogPostCardState extends State<BlogPostCard> {


  List<TextEditingController> _nom =
      List.generate(3, (i) => TextEditingController());


  List<TextEditingController> _numreservation =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _datearr =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _datedep =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _mineur =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _sexe =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _prenom =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _adresse =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _datnaiss =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _ville =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _lieunaiss =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _lieu_nationaiss =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _nationalit =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _catprof =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _motifvoy =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _natdoc =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _typdoc =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _numdoc =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _cdprof =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _gst_img =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _front_remove =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _back_remove =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _nchambre =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _nper =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _nbrper =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _nlgn =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _nlgn2 =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _pos =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _typech =
      List.generate(3, (i) => TextEditingController());
  List<TextEditingController> _natio =
      List.generate(3, (i) => TextEditingController());
  List<SingleValueDropDownController> _catProfController =
      List.generate(3, (i) => SingleValueDropDownController());

  int currentStep = 0;
  int nbRoom = 0;
  var uri =
      new Uri.https("62ab6183bd0e5d29af0f02ae.mockapi.io", "/api/check/data");
  List? mapResponse;
  List? listOfRoom;

  Future fetchData() async {
    http.Response response;
    response = await http.get(uri);
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listOfRoom = mapResponse![0]["rooms"];
        for (var i = 0; i < 3; ++i) {
          _nom[i].text = listOfRoom![0][i]["nom"];
          _prenom[i].text = listOfRoom![0][i]["prenom"];
          _adresse[i].text = listOfRoom![0][i]["adresse"];
          _datnaiss[i].text = listOfRoom![0][i]["datnaiss"];
          _lieunaiss[i].text = listOfRoom![0][i]["lieunaiss"];
          _natio[i].text = listOfRoom![0][i]["natio"];
          _nationalit[i].text = listOfRoom![0][i]["nationalit"];
          _ville[i].text = listOfRoom![0][i]["ville"];
          _motifvoy[i].text = listOfRoom![0][i]["motifvoy"];
          _natdoc[i].text = listOfRoom![0][i]["natdoc"];
          _typdoc[i].text = listOfRoom![0][i]["typdoc"];
          _numdoc[i].text = listOfRoom![0][i]["numdoc"];
          _cdprof[i].text = listOfRoom![0][i]["cdprof"];
          _gst_img[i].text = listOfRoom![0][i]["gst_img"];
          _front_remove[i].text = listOfRoom![0][i]["front_remove"];
          _back_remove[i].text = listOfRoom![0][i]["back_remove"];
          _nchambre[i].text = listOfRoom![0][i]["nchambre"];
          _nper[i].text = listOfRoom![0][i]["nper"];
          _nbrper[i].text = listOfRoom![0][i]["nbrper"];
          _nlgn[i].text = listOfRoom![0][i]["nlgn"];
          _nlgn2[i].text = listOfRoom![0][i]["nlgn2"];
          _pos[i].text = listOfRoom![0][i]["pos"];
          _typech[i].text = listOfRoom![0][i]["typech"];
          _sexe[i].text = listOfRoom![0][i]["sexe"];
          _sexeController[i].value = listOfRoom![0][i]["sexe"];
          _catProfController[i] = listOfRoom![0][i]["catprof"];
          print("Categorie Prof" + _catprof[i].text);
        }
        nbRoom = mapResponse![0]['rooms'].length;
        //print(_catProfController[1]);
        // print(_catProfController[0]);
        print(mapResponse);
      });
    }
  }

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
  };
  Future<http.Response> saveData(List<Room> rooms) async {
    http.Response res = await http.put(
      Uri.parse('62ab6183bd0e5d29af0f02ae.mockapi.io/api/check/data/1'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode({
        'numresa': 2026,
        'datearr': 1998,
        'datedep': 1997,
        'img_count': 0,
        "images": {},
        "id": "1",
        "rooms": [
          for (var i = 0; i < 3; ++i)
            {
              'mineur': rooms[i].mineur,
              'sexe':rooms[i].sexe,
              'nom':rooms[i].nom,
              'prenom': rooms[i].prenom,
              'adresse': rooms[i].adresse,
              'datnaiss': rooms[i].datnaiss,
              'lieunaiss': rooms[i].lieunaiss,
              'natio': rooms[i].natio,
              'nationalit': rooms[i].nationalit,
              'ville': rooms[i].ville,
              'catprof': rooms[i].catprof,
              'motifvoy': rooms[i].motifvoy,
              'natdoc': rooms[i].natdoc,
              //'typdoc': rooms[i].typdoc,
              'numdoc': rooms[i].numdoc,
              //'cdprof': rooms[i].cdprof,
              //'gst_img': rooms[i].gst_img,
              //'front_remove': rooms[i].front_remove,
              //'back_remove': rooms[i].back_remove,
              //'nchambre': rooms[i].nchambre,
              //'nper': rooms[i].nper,
              //'nbrper': rooms[i].nbrper,
              //'nlgn': rooms[i].nlgn,
              //'nlgn2': rooms[i].nlgn2,
              'pos': rooms[i].pos,
              //'typech': rooms[i].typech
            }
        ]
      }),
    );
    print(res);
    return res;
  }

  bool isCompleted = false;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Container(
        color: Colors.white,
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            child: _buildStepper(StepperType.horizontal)),
      ),
    );
  }

  CupertinoStepper _buildStepper(StepperType type) {
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 3;
    return CupertinoStepper(
      physics: ScrollPhysics(),
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: () {
        print(currentStep);
        final isLastStep = currentStep == getSteps().length;
        if (currentStep > 1) {
          print("completed");

        } else {
          setState(() => ++currentStep);
        }
      },
      steps: getSteps(),
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: 300,
        maxHeight: 300,
        child: Container(color: CupertinoColors.systemGrey),
      ),
    );
  }

  String radioButtonSexe = '';
  String radioButtonAge = '';
  int valSexe = 1;
  int valAdultOrMineur = 1;
  List<Room>? roomsValues;
  List<Step> getSteps() => [
        for (var i = 0; i < 3; ++i)
          Step(
              isActive: currentStep >= i,
              title: Text(
                "Guest ${i + 1}",
                style: GoogleFonts.secularOne(
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                ),
              ),
              content: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Age',
                            style: GoogleFonts.secularOne(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                            ),
                          ),
                          RadioGroup(
                            controller: _ageController[i],
                            values: ["ADULT", "MINEUR"],
                            onChanged: (value) {
                              roomsValues![i].mineur = _mineur[i]!.text!;
                              print("Minneur : "+roomsValues![i].mineur! );
                            },
                            indexOfDefault: 0,
                            orientation: RadioGroupOrientation.Horizontal,
                            decoration: RadioGroupDecoration(
                              spacing: 8.0,
                              labelStyle: GoogleFonts.secularOne(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                              ),
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Sexe',
                            style: GoogleFonts.secularOne(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                            ),
                          ),
                          RadioGroup(
                            controller: _sexeController[i],
                            values: ["HOMME", "FEMININ"],
                            onChanged: (value) {
                              roomsValues![i].sexe = _sexe[i]!.text!;
                              print("Sexe : "+roomsValues![i].sexe! );
                            },
                            indexOfDefault: 0,
                            orientation: RadioGroupOrientation.Horizontal,
                            decoration: RadioGroupDecoration(
                              spacing: 8.0,
                              labelStyle: GoogleFonts.secularOne(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                              ),
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  //TODO : Nom Controller
                  TextFormField(
                    controller: _nom[i],
                    onChanged: (String value) {
                      print("Nom index 1: "+value[i] );
                      print("Nom index 2: "+value[i]);
                      print("Nom index 3: "+_nom[3].text );
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.blue),
                      hintText: "Nom (Name)",
                      hintStyle: GoogleFonts.secularOne(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  //TODO : Prénom Controller
                  TextFormField(
                    controller: _prenom[i],
                    onChanged: (String value) {
                      roomsValues![i].prenom = _prenom[i]!.text!;
                      print("Prenom : "+roomsValues![i].prenom! );
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.blue),
                      hintText: "Prénoms (First name)",
                      hintStyle: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  //TODO : Domicile Habituel Adresse
                  TextFormField(
                    controller: _adresse[i],
                    onChanged: (String value) {
                      roomsValues![i].adresse = _adresse[i]!.text!;
                      print("Adresse : "+roomsValues![i].adresse! );
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.local_library, color: Colors.blue),
                      hintText: "Domicile habituel(Permanent address)",
                      hintStyle: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  //TODO : Date
                  TextFormField(
                    controller: _datnaiss[i],
                    onChanged: (String value) {
                      roomsValues![i].datnaiss = _datnaiss[i]!.text!;
                      print("Date Naissance : "+roomsValues![i].datnaiss! );
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon:
                          Icon(Icons.calendar_month_sharp, color: Colors.blue),
                      hintText: "Date de naissance (dd/MM/yyyy)",
                      hintStyle: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _datnaiss[i].text =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _lieunaiss[i],
                    onChanged: (String value) {
                      roomsValues![i].lieunaiss = _lieunaiss[i]!.text!;
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.location_city, color: Colors.blue),
                      hintText: "Lieu de naissance",
                      hintStyle: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _natio[i],
                    onChanged: (String value) {
                      roomsValues![i].natio = _natio[i]!.text!;
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.location_city, color: Colors.blue),
                      hintText: "natio ",
                      hintStyle: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.add_card, color: Colors.blue),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    isExpanded: true,
                    hint: Text(
                      'Nationalité',
                      style: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                    },
                    onChanged: (value) {
                      roomsValues![i].natio = _natio[i]!.text!;
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  // TODO : Ville
                  TextFormField(
                    controller: _ville[i],
                    onChanged: (String value) {
                      roomsValues![i].ville = _ville[i]!.text!;
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.location_city, color: Colors.blue),
                      hintText: "Ville (City)",
                      hintStyle: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DropDownTextField(
                      onChanged: (value) {
                        roomsValues![i].catprof= _catprof[i]!.text!;
                      },
                      singleController: _catProfController[i],
                      textFieldDecoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon:
                        Icon(Icons.local_library_sharp, color: Colors.blue),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textStyle: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                      dropDownList: [
                        DropDownValueModel(
                            name:
                            "Cadres,professions intellectuelles supérieures",
                            value: 0),
                        DropDownValueModel(
                            name: "Professions intermédiaires", value: 1),
                        DropDownValueModel(
                            name: "Employés et ouvriers", value: 2),
                        DropDownValueModel(name: "Retraités", value: 3),
                        DropDownValueModel(name: "Etudiants", value: 4),
                        DropDownValueModel(name: "Autres", value: 5),
                        DropDownValueModel(name: "Non réponse", value: 6),
                      ]),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon:
                      Icon(Icons.account_balance, color: Colors.blue),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    isExpanded: true,
                    hint: Text(
                      'Motif de voyage (Reason for travel)',
                      style: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    dropdownDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,
                            style: const TextStyle(fontSize: 14))))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select motif voyage.';
                      }
                    },
                    onChanged: (value) {
                      roomsValues![i].motifvoy = _motifvoy[i]!.text!;
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  /*  DropdownButtonFormField2(
                    value: _  catProfs[0],
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.category, color: Colors.blue),
                    ),
                    isExpanded: true,
                    hint: Text(
                      'Catégorie professionnelle',
                      style: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    items: catProfs
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select catégorie professionels.';
                      }
                    },
                    onChanged: (value) {
                      _catprof[i].text = value.toString() ;
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                  ),*/
                  SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField2(
                    onChanged: (value) {
                      roomsValues![i].natdoc = _natdoc[i]!.text!;
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.document_scanner_outlined,
                          color: Colors.blue),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    isExpanded: true,
                    hint: Text(
                      'Nature de document',
                      style: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select Nature Document.';
                      }
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                  ),

                  SizedBox(
                    height: 8,
                  ),

                  SizedBox(
                    height: 8,
                  ),
                  // TODO : NUM DOC
                  TextFormField(
                    controller: _numdoc[i],
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.confirmation_number_outlined,
                          color: Colors.blue),
                      hintText: "Numero de document",
                      hintStyle: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      roomsValues![i].numdoc = _numdoc[i]!.text!;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  // TODO : PROFESSION
                  TextFormField(
                    controller: _pos[i],
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.blue),
                      hintText: "Profession",
                      hintStyle: GoogleFonts.secularOne(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      roomsValues![i].pos = value;
                      print(roomsValues![i].pos);
                      print(roomsValues![0].pos);
                      print(roomsValues![1].pos);
                      print(roomsValues![2].pos);
                    },
                  ),

                ],
              )),
      ];
}
