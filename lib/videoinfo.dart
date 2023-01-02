import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/home_page.dart';
import 'colors.dart'as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  List info = [];
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: _playArea==false?BoxDecoration(
            gradient: LinearGradient(
                colors:[
                color.AppColor.gradientFirst.withOpacity(0.8),
                color.AppColor.gradientSecond,
                ],
              begin: FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            ),
          ):BoxDecoration(
            color: color.AppColor.gradientSecond,
          ),
          child: Column(
            children: [
              _playArea==false?Container(
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
              ):
                  Container(
                    child:Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 20) ,
                          height: 50,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Icon(Icons.arrow_back_ios,color: color.AppColor.secondPageIconColor,size: 15,),
                              ),
                              Expanded(child: Container()),
                              Icon(Icons.info_outline,color: color.AppColor.secondPageIconColor,size: 15,)
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
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
                      ),
                      Expanded(child: _listView()),
                    ],
                  ),
                ),),

            ],
          ),
        ));
  }

  Widget _controlView(BuildContext context){
    final noMute = (_controller?.value?.volume??.0)>0;
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      color: color.AppColor.gradientSecond,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 9),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0,0.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(50, 0, 0, 0)
                    )
                  ]
                ),
                child: noMute?Icon(Icons.volume_up,color: Colors.white,):Icon(Icons.volume_off,color:Colors.white,),
              ),
            ),
            onTap: (){
              if(noMute){
                _controller?.setVolume(0);
              }else{
                _controller?.setVolume(1.0);
              }
              setState(() {
              });

            },
          ),
          TextButton(
              onPressed:()async{
                final index = _isPlayingIndex-1;
                if(index>=0&&info.length>=0){
                  _onTapVideo(index);
                }else{
                  Get.snackbar("Video", "No more video to play",snackPosition:SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,colorText: Colors.white);
                }
          },
              child: Icon(Icons.fast_rewind,size: 30,color: Colors.white,)
          ),
          TextButton(
              onPressed:()async{
                if(_isPlaying){
                  setState(() {
                    _isPlaying=false;
                  });
                  _controller?.pause();
                }else{
                  setState(() {
                    _isPlaying=true;
                  });
                  _controller?.play();
                }
              },
              child: Icon(_isPlaying?Icons.pause:Icons.play_arrow,size: 30,color: Colors.white,)
          ),
          TextButton(
              onPressed:()async{
                final index = _isPlayingIndex+1;
                if(index<=info.length-1){
                  _onTapVideo(index);
                }else{
                  Get.snackbar("Video", "You have complted all videos.Congarats!!",snackPosition:SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,colorText: Colors.white);
                }
              },
              child: Icon(Icons.fast_forward,size: 30,color: Colors.white,)
          ),
        ],
      ),
    );
  }

  _listView(){
    return ListView.builder(
        itemCount: info.length,
        itemBuilder: (_,int index){
          return GestureDetector(
            onTap: (){
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if(_playArea==false){
                  _playArea=true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 135,
      width: 200,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage(info[index]["thumbnail"]),
                        fit: BoxFit.cover)
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(info[index]["title"],style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: color.AppColor.circuitsColor,
                  ),),
                  SizedBox(height: 10,),
                  Text(info[index]["time"],style: TextStyle(
                      fontSize: 12,
                      color: color.AppColor.setsColor
                  ),),
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("15s rest ",style: TextStyle(
                    fontSize: 13,
                    color: color.AppColor.loopColor,
                  ),),
                ),
              ),
              Row(
                children: [
                  for(int i=0;i<80;i++)
                    i.isEven?Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: color.AppColor.loopColor
                      ),
                    ):Container(
                      width: 3,
                      height: 1,
                      color: Colors.white,
                    )
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
  var _onUpdateControllerTime;
  void _onControllerUpdate() async{
    final controller = _controller;
    if(_disposed){
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().microsecondsSinceEpoch;
    if(_onUpdateControllerTime>now){
      return;
    }
    _onUpdateControllerTime= now+500;
    if(controller==null){
      debugPrint("controller is null");
      return;
    }
    if(!controller.value.isInitialized){
      debugPrint("controller is not initalized");
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }

  _onTapVideo(int index) async {
    final controller = VideoPlayerController.network(info[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if(old!=null){
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {
    });
    controller..initialize().then((_){
      old?.dispose();
      _isPlayingIndex = index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {
      }); //to make sure redraw happen even when its empty
    });
  }

  Widget _playView(BuildContext context){
    final controller = _controller;
    if(controller!=null&&controller.value.isInitialized){
      return AspectRatio(
        aspectRatio: 16/9,
        child: VideoPlayer(controller),
      );
    }else{
      return AspectRatio(
          aspectRatio: 16/9,
          child: Center(child: Text("Preparing...")));
    }

  }


}
