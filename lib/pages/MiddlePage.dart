// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../classes/Utils.dart';
import '../pages/_AllPages.dart';

class MiddlePage extends StatefulWidget {
  const MiddlePage({ super.key });

  @override
  State createState() => _MiddlePageState();
}

class _MiddlePageState extends State<MiddlePage> {

  _MiddlePageState() {
    Utils.log('<<< ( MiddlePage.dart ) init >>>', 2, true );
  }

  // (this page) variables
  static const String _fileName = 'MiddlePage.dart';
  
  // (this page) init and dispose
  @override
  void initState() {
    super.initState();
    Utils.log('( $_fileName ) initState()');
    WidgetsBinding.instance.addPostFrameCallback((_) => _addPostFrameCallbackTriggered(context));
  }

  @override
  void dispose() {
    Utils.log('( $_fileName ) dispose()');
    super.dispose();
  }

  // (this page) methods
  void _buildTriggered() {
    Utils.log('( $_fileName ) _buildTriggered()');
  }
  
  void _addPostFrameCallbackTriggered( context ) {
    Utils.log('( $_fileName ) _addPostFrameCallbackTriggered()');
  }

  // (this page) build
  @override
  Widget build(BuildContext context) {

    _buildTriggered();

    return WillPopScope(
      onWillPop: () async {
        Utils.log('( $_fileName ) WillPopScope() triggered');
        return true;    // true allows back button (false denies)
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text( _fileName ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFeeeeee),
                  child: Center(
                    child: Text( 'Pops: ' ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFdddddd),
                  child: Center(
                    child: Text( 'Clicks: ' ),
                  ),
                ),
              ),              
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFeeeeee),
                  child: Center(
                    child: Text( 'Fruit: ' ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Utils.log('( $_fileName ) (event) clicked "go to EndPage()"');
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => EndPage())
                        );                
                      },
                      // start of button appearance settings 
                      child: Text( 'Go to EndPage()' ),
              
                    ),
                  ),
                ),
              ),                            
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Utils.log('( $_fileName ) (event) clicked FloatingActionButton');
            },
          ),
        ),
      ),
    );
  }
}