import 'package:flutter/material.dart';
import 'package:saral_urja/constants/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var response = Response.fromJson(jsonData);
  String? provinceValue;
  String? districtValue;
  List<String>? provinceList;
  List<List<Districts>>? districtList;
  int index = 0;
  int districtId = 0;

  getData() {
    provinceValue = response.data![0].name;
    provinceList = (response.data!.map((e) => e.name!).toList());
    districtList = response.data!.map((e) => e.districts!).toList();
    districtValue = districtList![index].map((e) => e.name!).toList()[0];
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Try'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: provinceValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    index = provinceList!.indexOf(newValue!);
                    getData();
                    provinceValue = newValue;
                  });
                },
                items:
                    provinceList!.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 16,
              ),
              DropdownButton<String>(
                value: districtValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    //index = provinceList!.indexOf(newValue!);
                    districtValue = newValue!;
                    int disIndex = districtList![index]
                        .map((e) => e.name!)
                        .toList()
                        .indexOf(newValue);
                    districtId = districtList![index][disIndex].id!;
                  });
                },
                items: (districtList![index].map((e) => e.name!).toList())
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text('District Id $districtId'),
            ],
          ),
        ));
  }
}
