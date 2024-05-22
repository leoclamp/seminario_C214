import 'package:flutter/material.dart';
import 'package:seminario_c214/buttons.dart';
import 'package:seminario_c214/calculadora.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

Calculadora calculadora = Calculadora();

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    'DER',
    '/',
    'x',
    '7',
    '8',
    '9',
    '*',
    '-',
    '4',
    '5',
    '6',
    '+',
    '^',
    '1',
    '2',
    '3',
    '0',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userQuestion,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userAnswer,
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemBuilder: (BuildContext context, int index) {
                  
                  //botao de limpar
                  if (index == 0) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion = '';
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.green[400],
                      textColor: Colors.white,
                    );
                  }
            
                  //botao de delete
                  else if (index == 1) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.red[400],
                      textColor: Colors.white,
                    );
                  }
            
                  //botao de derivada(DER)
                  else if (index == 2) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userAnswer = calculadora.derivada(userQuestion);
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                    );
                  }
            
                  //botao de igual
                  else if (index == buttons.length - 1) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userAnswer = calculadora.operacoes(userQuestion).toString();
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                    );
                  }
            
                  //resto dos botoes
                  else {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttontext: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple[50],
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' ||
        x == '^' ||
        x == '*' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == 'DER') {
      return true;
    }
    return false;
  }
}

