import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
TextEditingController moneyController = TextEditingController();

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  int count = 1;
  num billAmt = 0.0;
  num tipAmt = 0.0;
  num totalAmt = 0.0;
  num perPersonAmt = 0.0;
  num tipPer = 0;

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F3F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: getTitlePart1(),
              ),
              Expanded(
                  flex: 5,
                  child: getTitlePart2()
              ),
              Expanded(
                flex: 2,
                child: getTitlePart3(),
              ),
              Expanded(
                flex: 2,
                child: getTitlePart4(),
              ),
              Expanded(
                flex: 2,
                child: getTitlePart5(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  /// Tip Calculator Part - 1
  Widget getTitlePart1(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png" , width: 100, height: 80,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(TextSpan(
              text: "Mr ",
              style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),
              children: [
                TextSpan(
                  text: "TIP",
                  style: TextStyle(fontSize: 26 , fontWeight: FontWeight.w900),
                ),
              ],

            ),
            ),
            Text("Calculator" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w400),),
          ],
        )
      ],
    );
  }

  /// Tip Calculator Part - 2
  Widget getTitlePart2(){
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                children: [
                  Text("Total p/person" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w400),),
                  SizedBox(height: 10,),
                  Text.rich(TextSpan(
                      children: [
                        TextSpan(
                          text: "\$",
                          style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w900),
                        ),
                        TextSpan(
                          text: "${perPersonAmt == 0 ? "000" : perPersonAmt.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 65 , fontWeight: FontWeight.w900),
                        ),
                      ]
                  )),
                  Divider(),SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total bill" , style: TextStyle(fontSize: 17),),
                          Text.rich(TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$",
                                  style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w900 , color: Color(0xff01C9BE)),
                                ),
                                TextSpan(
                                  text: "${totalAmt == 0 ? "000" : totalAmt.toStringAsFixed(2)}",
                                  style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w900 , color: Color(0xff01C9BE)),
                                ),
                              ]
                          )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total tip" , style: TextStyle(fontSize: 17),),
                          Text.rich(TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$",
                                  style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w900 , color: Color(0xff01C9BE)),
                                ),
                                TextSpan(
                                  text: "${tipAmt == 0 ? "000" : tipAmt.toStringAsFixed(2)}",
                                  style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w900 , color: Color(0xff01C9BE)),
                                ),
                              ]
                          )),
                        ],
                      ),
                    ],
                  )
                ]
            ),
          ),
        )
    );
  }

  /// Tip Calculator Part - 3
  Widget getTitlePart3(){
    return Row(
      children: [
        Expanded(
          child:Text.rich(TextSpan(
              text: "Enter \n",
              style: TextStyle(fontSize: 17 , fontWeight: FontWeight.w900),
              children: [
                TextSpan(
                  text: "your bill",
                  style: TextStyle(fontSize: 17 ,fontWeight: FontWeight.normal),
                ),
              ]
          )), ),
        Expanded(
            flex: 3,
            child: TextField(
              style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w900),
              controller: moneyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(6),
                ),
                prefixIcon: Icon(Icons.attach_money , size: 29, color: Colors.black,),
              ),
            )),
      ],
    );
  }

  /// Tip Calculator Part - 4
  Widget getTitlePart4(){
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child:Text.rich(TextSpan(
                  text: "Choose \n",
                  style: TextStyle(fontSize: 17 , fontWeight: FontWeight.w900),
                  children: [
                    TextSpan(
                      text: "your tip",
                      style: TextStyle(fontSize: 17 ,fontWeight: FontWeight.normal),
                    ),
                  ]
              )), ),
            Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: ElevatedButton(onPressed: (){
                      tipPer = 10;
                      CalculateBill();
                    }, style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      foregroundColor: Color(0xffffffff),
                      backgroundColor: Color(0xff01C9BE),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                    ) ,child: Text.rich(TextSpan(children: [TextSpan(text: "10 " , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold)),TextSpan(text: "%")]))),),
                    SizedBox(width: 10,),
                    Expanded(child: ElevatedButton(onPressed: (){
                      tipPer = 15;
                      CalculateBill();
                    }, style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      foregroundColor: Color(0xffffffff),
                      backgroundColor: Color(0xff01C9BE),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                    ) ,child: Text.rich(TextSpan(children: [TextSpan(text: "15 " , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold)),TextSpan(text: "%")]))),),
                    SizedBox(width: 10,),
                    Expanded(child: ElevatedButton(onPressed: (){
                      tipPer = 20;
                      CalculateBill();
                    }, style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      foregroundColor: Color(0xffffffff),
                      backgroundColor: Color(0xff01C9BE),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                    ) ,child: Text.rich(TextSpan(children: [TextSpan(text: "20 " , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold)),TextSpan(text: "%")]))),),
                  ],
                )),
          ],
        ),
        Expanded(
          child: Container(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20),
              foregroundColor: Color(0xffffffff),
              backgroundColor: Color(0xff01C9BE),
              minimumSize: Size(260, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            ) ,child: Text("Custom tip" , style: TextStyle(fontSize: 18),)),
          ),
        )
      ],
    );
  }

  /// Tip Calculator Part - 5
  Widget getTitlePart5(){
    return Row(
      children: [
        Expanded(
          child:Text.rich(TextSpan(
              text: "Split \n",
              style: TextStyle(fontSize: 17 , fontWeight: FontWeight.w900),
              children: [
                TextSpan(
                  text: "the total",
                  style: TextStyle(fontSize: 17 ,fontWeight: FontWeight.normal),
                ),
              ]
          )), ),
        Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton(onPressed: (){
                    if(count > 1){
                      count --;
                      CalculateBill();
                    }
                  }, style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    foregroundColor: Color(0xffffffff),
                    backgroundColor: Color(0xff01C9BE),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(11) , bottomLeft: Radius.circular(11) )),
                  ) ,child: Text("-")),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      width: 100,
                      child: Text("$count" , style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(onPressed: (){
                    count++;
                    CalculateBill();
                  }, style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    foregroundColor: Color(0xffffffff),
                    backgroundColor: Color(0xff01C9BE),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(11) , bottomRight: Radius.circular(11) )),
                  ) ,child: Text("+")),
                ),

              ],
            )),
      ],
    );
  }

  void CalculateBill(){
    if(moneyController.text != ""){
      billAmt = double.parse(moneyController.text.toString());
      tipAmt = totalAmt * (tipPer /100);
      totalAmt  = tipAmt + billAmt;
      perPersonAmt = totalAmt / count;
      setState(() {

      });
    }else{
      count = 1;
    }
  }

}

