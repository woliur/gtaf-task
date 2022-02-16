import 'package:flutter/material.dart';
import 'package:gtaf_assignment/github_project/presenter/presenter.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Greentech App Foundation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ValueNotifier<bool> _isLoading = ValueNotifier(true);
  late Presenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = Presenter(context);
    _goToListPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        body: ValueListenableBuilder(
          valueListenable: _isLoading,
          builder: (context, value, child) => Center(
              child: value == true ? _loadingView() : Center(child: Text("Error"),)
          ),

        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _loadingView(){
    return const CircularProgressIndicator();
  }

  void _goToListPage() async {
    _presenter.getCommitList(context, onSuccess: (data) {
      _isLoading.value = false;
      _presenter.navigateUserProfile();
    }, onFailure: (message) {
      _isLoading.value = false;
      print(message);
    },);
    // _isLoading.value = false;
    // await Future.delayed(const Duration(seconds: 1));
    // _presenter.navigateUserProfile();
  }

  // Widget _logo(){
  //   return Image.asset(name);
  // }
}
