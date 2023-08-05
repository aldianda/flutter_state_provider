import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_apps/widget/defaultbutton.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> CounterProvider())
    ],
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterScreen(),
    );
  }
}

class CounterProvider extends ChangeNotifier{
  int _count = 0;
  int get getCountValue => _count;

  //for Increment Counter
  void incrementCounter(){
    _count++;
    notifyListeners();
  }
  void decrementCounter(){
    _count--;
    notifyListeners();
  }
  void resetCounter(){
    _count = 0;
    notifyListeners();
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) :super(key: key);
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<CounterProvider>(
              builder: (context, value, child){
              return Text(
                value.getCountValue.toString(),
              style: const TextStyle(fontSize: 30));
            }),
            DefaultButton(
              name: 'plus',
              color: Colors.green,
              txtColor: Colors.white,
              onPress: () {
              context.read<CounterProvider>().incrementCounter();
            }),
            DefaultButton(
              name: 'min',
              color: Colors.orange,
              txtColor: Colors.white,
              onPress: () {
              context.read<CounterProvider>().decrementCounter();
            }),
            DefaultButton(
              name: 'reset',
              color: Colors.red,
              txtColor: Colors.white,
              onPress: () {
              context.read<CounterProvider>().resetCounter();
            })
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
