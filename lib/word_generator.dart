import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './appColors.dart';

class WordGenerator extends StatefulWidget {
  WordGenerator({Key key, this.title}) : super(key: key);
  final String title;

  @override
  WordGeneratorState createState() => WordGeneratorState();
}


class WordGeneratorState extends State<WordGenerator> {
  bool _listWidgetVisibility = false;
  List<WordPair> words = List<WordPair>.empty();

  List<WordPair> getListViewItems() {
    List<WordPair> words = generateWordPairs(safeOnly: true).take(30).toList();
    words.sort((a, b) => a.asLowerCase.compareTo(b.asLowerCase));
    return words;
  }

  void updateList() {
    setState(() {
       words = getListViewItems();
       _listWidgetVisibility = true;
    });
  }

  Widget _buildLogo() => Align(
    alignment: Alignment.topCenter,
    child: Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Image.asset("images/logo.png",), 
     ),
  );

  Widget _buildButtonWidget() => Align(
    child: Container(
      height: 50.0,
      alignment: Alignment.center,
      child: ElevatedButton(
          autofocus: true,
          style: ElevatedButton.styleFrom(
              primary: AppColors.buttonBackground,
              elevation: 4,
          ),
          child: Text('Generate'),
              onPressed: updateList,
      ), 
    ),
  );

  
  Widget _buildExpandedList() => Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.boxBackground,
            style: BorderStyle.solid,
            width: 4,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.boxBackground,
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: AppColors.boxBackground,
            offset: Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: ListView.separated(
              itemCount: words.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) => Text(words[index].toString(), textAlign: TextAlign.center,)
        ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
     
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
            SizedBox(  
                height: 50,
            ),
            _buildLogo(),
            SizedBox(  
                height: 20,
            ),
            _buildButtonWidget(), 
            SizedBox(  
                height: 50,
            ),
            Visibility(child: _buildExpandedList(), visible: _listWidgetVisibility,),
        ],
      ),
    );
  }
}
