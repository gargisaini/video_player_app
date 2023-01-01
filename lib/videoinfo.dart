import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:video_player_app/home_page.dart';
import 'colors.dart'as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {

  List info = [];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value) {
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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                color.AppColor.gradientFirst.withOpacity(0.8),
                color.AppColor.gradientSecond,
                ],
              begin: FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50,),
                margin: EdgeInsets.only(left: 20,right: 20),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap:(){
                            Get.to(()=>HomePage());
                          },
                            child: Icon(Icons.arrow_back_ios,color: color.AppColor.secondPageIconColor,size: 18,)),
                        Expanded(child: Container()),
                        Icon(Icons.info_outline,color: color.AppColor.secondPageIconColor,size: 18,)
                      ],
                    ),
                    SizedBox(height: 30,),
                    Text("Legs Toning",style: TextStyle(
                      fontSize: 22,
                      color: color.AppColor.secondPageTitleColor,
                    ),),
                    SizedBox(height: 5,),
                    Text("and Glutes Workout",style: TextStyle(
                      fontSize: 22,
                      color: color.AppColor.secondPageTitleColor,
                    ),),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        Container(
                          width: 75,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors:[
                              color.AppColor.secondPageContainerGradient1stColor,
                              color.AppColor.secondPageContainerGradient2ndColor,
                            ],begin: Alignment.bottomLeft,
                            end: Alignment.topRight),

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.timer_outlined,size: 14,color: color.AppColor.secondPageIconColor),
                                  Text(" 68 min",style: TextStyle(
                                    fontSize: 14,color: color.AppColor.secondPageTitleColor,
                                  ),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 190,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors:[
                              color.AppColor.secondPageContainerGradient1stColor,
                              color.AppColor.secondPageContainerGradient2ndColor,
                            ],begin: Alignment.bottomLeft,
                                end: Alignment.topRight),

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.handyman_outlined,size: 14,color: color.AppColor.secondPageIconColor),
                                  Text(" Resistent band, Kettlebell",style: TextStyle(
                                    fontSize: 14,color: color.AppColor.secondPageTitleColor,
                                  ),)
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),


                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(70),),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text("Circuit 1: Legs Tonning",style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: color.AppColor.circuitsColor,
                          ),),
                          Expanded(child: Container()),
                          Row(
                            children: [
                              Icon(Icons.loop_outlined,size: 25,color: color.AppColor.secondPageTopIconColor,),
                              Text(" 3 sets",style: TextStyle(
                                fontSize: 14,
                                color: color.AppColor.setsColor,
                              ),),
                              SizedBox(width: 20,),
                            ],
                          ),


                        ],
                      )
                    ],
                  ),
                ),),
              
            ],
          ),
        ));
  }
}
