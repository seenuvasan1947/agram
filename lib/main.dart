// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations, no_logic_in_create_state, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:anagram/anagram.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const First(),
    );
  }
}

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  final _word = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _word.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ANAGRAM APP'),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Guide()),
                  );
                },
                icon: const Icon(Icons.auto_stories_sharp)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Second()),
                  );
                },
                icon: const Icon(Icons.account_balance_rounded)),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const [
              const Text('Hai User Welcome To My App'),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: TextField(
                  controller:
                      _word, //here we need to update value of the variable so not need to use const in padding
                  //insted of that we put required place
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Enter Word'),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),

              ElevatedButton(
                child: const Text('ENTER'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        // builder: (context) => const Second())
                        builder: (context) => Finder(word: _word.text)),
                    //builder: (context) => Finder()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class Finder extends StatefulWidget {
  String word = '';
  //const Finder({Key? key, required String word}) : super(key: key);
  Finder({required this.word});
  @override
  State<Finder> createState() => _FinderState('$word');
}

class _FinderState extends State<Finder> {
  var result;
  //void agramresult(String word) {
  _FinderState(String word) {
    //setState(() {
    final anagram = Anagram();
    anagram.initialise();
    result = anagram.solve('$word'); //as String;
    //print(result);
    //result.clear();
    //}
    //);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('ANAGRAM WORDS '),
            centerTitle: true,
            backgroundColor: Colors.pink,
          ),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('The All Posible Anagram Words for Given Word is'),
                  Text('$result'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Go back!'),
                  ),
                ]),
          )),
    );
  }
}

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DONATION'),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent, //give title in centre
        ),
        //backgroundColor: Colors.pink,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('''


            hai user welcome to this app 
            This is a completly 
            FOSS(free and open source software )
            so if you like this app 
            and intrested to give any 
            Fund for development 
            
            For more information contact developer

            mobile No:6380243399
            
            Any way thank you for use my app
               '''),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        )),
      ),
    ));
  }
}

class Guide extends StatefulWidget {
  const Guide({Key? key}) : super(key: key);

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GUIDE'),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent, //give title in centre
        ),
        //backgroundColor: Colors.pink,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('''


            HAI USER WELCOME TO THIS APP 
            
            THIS APP IS USED FOR FIND ALL THE ANAGRAM 
            WORD FOR THE WORD WHICH WAS ENTER BY YOU

            STEP1)ENTER THE STRING INTO THE TEXT BOX
            STEP2)PRESS ENTER
            STEP3)ANTER SEE RESULT PRESS GO BACK BUTTON FOR RETURN HOME PAGE

              THANK YOU FOR USE MY APP
               '''),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        )),
      ),
    ));
  }
}
