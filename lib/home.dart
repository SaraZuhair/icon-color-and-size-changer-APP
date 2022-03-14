import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var red = 1;
  var green = 1;
  var blue = 1;
  late Color iconcolor = Color.fromRGBO(1, 1, 1, 1.0);

  bool change = false;
  bool changes = false;
  var size = 400.0;

  void maxicon() {
    if (changes == true) {
      setState(() {
        size = size + 200;
      });
    }
  }

  void minicon() {
    if (changes == true) {
      setState(() {
        size = size - 200;

        if (size <= 400) {
          size = 400;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 30,
            ),
            child: GestureDetector(
              onTap: minicon,
              child: const Icon(
                Icons.minimize_outlined,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 30,
            ),
            child: GestureDetector(
              onTap: maxicon,
              child: const Icon(
                Icons.add,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.deepPurpleAccent,
        title: const Center(
          child: Text("Change Icon Color"),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: iconcolor,
                size: size,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("change color?"),
                  Checkbox(
                    value: change,
                    onChanged: (value) {
                      change = value!;
                      
                      setState(() {
                        if(change==true){
                        change = value;
                      }
                      });
                      
                    },
                  ),
                  const Text("change size?"),
                  Checkbox(
                    value: changes,
                    onChanged: (value) {
                      changes = value!;

                      setState(() {
                        changes = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Slider(
                  activeColor: Colors.red,
                  value: red.toDouble(),
                  min: 1.0,
                  max: 255.0,
                  divisions: 10,
                  label: red.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      if (change == true) {
                        red = value.toInt();
                        iconcolor = Color.fromRGBO(red, green, blue, 1.0);
                      } else {
                        red = value.toInt();
                      }
                    });
                  }),
              Slider(
                activeColor: Colors.green,
                value: green.toDouble(),
                min: 1.0,
                max: 255.0,
                divisions: 10,
                label: green.round().toString(),
                onChanged: (value) {
                  setState(() {
                    if(change==true){
                    green = value.toInt();
                    iconcolor = Color.fromRGBO(red, green, blue, 1.0);
                  }
                  else{
                    green=value.toInt();
                  }
                  
                  }
                  
                  );
                },
              ),
              Slider(
                activeColor: Colors.blue,
                value: blue.toDouble(),
                min: 1.0,
                max: 255.0,
                divisions: 10,
                label: blue.round().toString(),
                onChanged: (value) {
                  setState(() {
                    if(change==true){
                    blue = value.toInt();
                    iconcolor = Color.fromRGBO(red, green, blue, 1.0);
                  }
                  else{
                    blue=value.toInt();
                  }
                  }
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
