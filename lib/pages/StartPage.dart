// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../providers/global_provider.dart';
import '../pages/_AllPages.dart';

class StartPage extends StatefulWidget {
  const StartPage({ super.key });

  @override
  State createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  _StartPageState() {
    Utils.log('<<< ( StartPage.dart ) init >>>', 2, true );
  }

  // (this page) variables
  static const String _fileName = 'StartPage.dart';
  
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
        context.read<Global>().incrementPop();
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
                    //child: Text( 'Pops: ${ Config.pops }' ),
                    child: Text( 'Pops: ${ context.watch<Global>().getPops() }' ),
                    //context.watch<Global>().getKittyCatalogPageHtml(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFdddddd),
                  child: Center(
                    child: Text( 'Clicks: ${ context.watch<Global>().getClicks() }' ),
                  ),
                ),
              ),              
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFeeeeee),
                  child: Center(
                    child: Text( 'Fruit: ${ context.watch<Global>().getFruit() }' ),
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
                        Utils.log('( $_fileName ) (event) clicked "go to MiddlePage()"');
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => MiddlePage())
                        );                
                      },
                      // start of button appearance settings 
                      child: Text( 'Go to MiddlePage()' ),
              
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
              context.read<Global>().incrementClick();
            },
          ),
        ),
      ),
    );
  }
}