import 'package:flutter/material.dart';
import 'package:flutter_state/bloc/counter.dart';
import 'package:flutter_state/bloc/sample_bloc.dart';
import 'package:flutter_state/model/sample_model.dart';
import 'package:progress_indicators/progress_indicators.dart';

class MyHomePage extends StatelessWidget {
  CounterBloc _counterBloc = new CounterBloc(initialCount: 0);
  final sampleBloc = SampleBloc();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: Text("Flutter Demo Home Page")),
      ),
      // body: new Center(
      //   child: new Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       new StreamBuilder(
      //           stream: _counterBloc.counterObservable,
      //           builder: (context,snapshot){
      //             return new Text('${snapshot.data}', style: Theme.of(context).textTheme.headline4);
      //           })
      //     ],
      //   ),
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
          stream: sampleBloc.dataFromAPIStream,
          builder: (context, AsyncSnapshot<APIResponseModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: JumpingText(
                  'Press Button To Get Data!!!!',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
            SampleModel sampleApiData = snapshot.data.response;
            return ListView.builder(
                itemCount: sampleApiData.listOfSample.length,
                itemBuilder: (context, int index) {
                  return Column(
                    children: [
                      Text(sampleApiData.listOfSample[index].title),
                      Divider(),
                    ],
                  );
                });
          },
        ),
      ),
      // floatingActionButton: new Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: <Widget>[
      //       new Padding(
      //           padding: EdgeInsets.only(bottom: 10),
      //           child: new FloatingActionButton(
      //             onPressed: _counterBloc.increment,
      //             tooltip: 'Increment',
      //             child: new Icon(Icons.add),
      //           )
      //       ),
      //       new FloatingActionButton(
      //         onPressed: _counterBloc.decrement,
      //         tooltip: 'Decrement',
      //         child: new Icon(Icons.remove),
      //       ),
      //     ])
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await sampleBloc.getData();
        },
        child: Icon(Icons.download_rounded),
      ),
    );
  }
}
