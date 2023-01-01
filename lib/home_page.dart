import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:video_player_app/videoinfo.dart';
import 'colors.dart'as color;
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = json.decode(value);
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: EdgeInsets.only(top: 50,left: 20,right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text("Training",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: color.AppColor.homePageTitle,
                ),),
                Expanded(child: Container()),
                Icon(Icons.arrow_back_ios,color: color.AppColor.homePageIcons,size: 20,),
                SizedBox(width: 10,),
                Icon(Icons.calendar_today,color: color.AppColor.homePageIcons,size: 20,),
                SizedBox(width: 15,),
                Icon(Icons.arrow_forward_ios_sharp,color: color.AppColor.homePageIcons,size: 20,),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text("Your Program",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color.AppColor.homePageSubtitle,
                ),),
                Expanded(child: Container()),
                Text("Details ",style: TextStyle(
                  fontSize: 18,
                  color: color.AppColor.homePageDetail,
                ),),
                InkWell(
                  onTap: (){
                    Get.to(()=>VideoInfo());
                  },
                    child: Icon(Icons.arrow_forward,color: color.AppColor.homePageIcons,size: 18,)),

              ],
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.67),
                    color.AppColor.gradientSecond.withOpacity(0.78),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight
                ),
                borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(10),
                  bottomLeft:Radius.circular(10),
                  bottomRight:Radius.circular(10),
                  topRight:Radius.circular(80),

                  ),
                  boxShadow:[
                    BoxShadow(
                      offset: Offset(5,10),
                      blurRadius: 20,
                      color: color.AppColor.gradientSecond.withOpacity(0.4)
                    )
                  ]
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Next workout",style: TextStyle(
                    fontSize: 12,
                    color: color.AppColor.homePageContainerTextSmall,
                  ),),
                  SizedBox(height: 5,),
                  Text("Legs Toning",style: TextStyle(
                    fontSize: 22,
                    color: color.AppColor.homePageContainerTextBig,
                  ),),
                  SizedBox(height: 5,),
                  Text("and Glutes Workout",style: TextStyle(
                    fontSize: 22,
                    color: color.AppColor.homePageContainerTextBig,
                  ),),
                  SizedBox(height: 29,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timer,color: color.AppColor.homePageContainerTextBig,size: 12,),
                          Text("  60 min",style: TextStyle(
                            fontSize: 12,
                            color: color.AppColor.homePageContainerTextBig,
                          ),),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                          child: Icon(Icons.play_circle_fill,color: Colors.white,size: 55,),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: color.AppColor.gradientFirst.withOpacity(0.7),
                            blurRadius: 20,
                            offset: Offset(4, 8),
                          )
                        ]
                      ),)
                    ],
                  ),

                ],
              ),

              ),
            SizedBox(height: 5,),
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width:  MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 20),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage("assets/card.jpg"),
                      fit: BoxFit.fill),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: Offset(8, 10),
                          color: color.AppColor.gradientSecond.withOpacity(0.4),

                        ),
                      ]
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 200 ,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage("assets/figure.png"),
                            ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: EdgeInsets.only(left: 130,top: 33),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You are doing great",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: color.AppColor.homePageDetail,
                        ),),
                        SizedBox(height: 20,),
                        Text("keep it up",style: TextStyle(
                          fontSize: 14,
                          color: color.AppColor.homePagePlanColor,
                        ),),
                        Text("stick to your plan",style: TextStyle(
                          fontSize: 14,
                          color: color.AppColor.homePagePlanColor,
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text(
                  "Area of Foucs",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                )
              ],
            ),
            Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: (info.length.toDouble()/2).toInt(),
                  itemBuilder: (_,i){
                    int a = 2*i;//0 2
                    int b = 2*i +1;//1 3
                    return Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width-60)/2,
                          height: 150,
                          margin: EdgeInsets.only(left: 20,right: 5,bottom: 20),
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(image: AssetImage(info[a]["img"]),),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5, 5),
                                color: color.AppColor.gradientSecond.withOpacity(0.3),
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-5, -5),
                                color: color.AppColor.gradientSecond.withOpacity(0.3),
                              )
                            ]
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                               info[a]["title"],style: TextStyle(
                                fontSize: 20,
                                color: color.AppColor.homePageDetail,
                              ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width-60)/2,
                          height: 150,
                          margin: EdgeInsets.only(left: 20,right: 5,bottom: 20),
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(image: AssetImage(info[b]["img"]),),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5, 5),
                                  color: color.AppColor.gradientSecond.withOpacity(0.3),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5, -5),
                                  color: color.AppColor.gradientSecond.withOpacity(0.3),
                                )
                              ]
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[b]["title"],style: TextStyle(
                                fontSize: 20,
                                color: color.AppColor.homePageDetail,
                              ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              ),
            )),
            ],),

        ),
      );
  }
}
