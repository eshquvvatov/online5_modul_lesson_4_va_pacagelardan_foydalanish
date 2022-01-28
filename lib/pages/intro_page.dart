import 'package:flutter/material.dart';
import 'package:online5_modul_lesson_4/pages/home_page.dart';
import 'package:online5_modul_lesson_4/services/strings.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
static const String id="/intro_page";
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController=PageController(initialPage: 0);
  int selectedIndex=2;

  List images=[
    "assets/images/image_1.png",
    "assets/images/image_2.png",
    "assets/images/image_3.png",
  ];
  List text=[
    Strings.stepOneContent,
    Strings.stepTwoContent,
    Strings.stepThreeContent
  ];
  List title=[
    Strings.stepOneTitle,
    Strings.stepTwoTitle,
    Strings.stepThreeTitle
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        actions: [
          (selectedIndex !=2)?
          TextButton(onPressed: (){
            setState(() {
              selectedIndex=2;
            });
            _pageController.animateToPage(selectedIndex, duration:Duration(milliseconds: 1000),
                curve:Curves.easeOutCubic);
          },
              child:Text("Skip",style: TextStyle(fontSize: 18,color: Colors.green.shade900),)):
          TextButton(onPressed: (){
            Navigator.of(context).pushNamed(HomePage.id);
          },
              child:Text("Next",style: TextStyle(fontSize: 18,color: Colors.green.shade900),))
        ],
      ),
      body: Stack(
        alignment:AlignmentDirectional.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index){
              setState(() {
                selectedIndex=index;
              });
            },
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return  makePage(image: images[index],content:text[index],title:title[index]  );
            },

          ),
          indicator()

        ],
      ),
    );
  }

  Widget makePage({ required String image,required title,required content}){
    return Container(
      height:MediaQuery.of(context).size.height ,
      width:MediaQuery.of(context).size.width ,
      child: Column(
        children: [
          Expanded(flex:3,child: Container(
            alignment: Alignment.bottomCenter,
            child: Image(image: AssetImage(image),height: 250,width: 250,),

          )

          ),
          Expanded(flex:2,child: Column(
            children: [
              SizedBox(height: 10,),
              Text(title,style: TextStyle(fontSize: 30,color: Colors.green,fontWeight: FontWeight.bold),
                textAlign:TextAlign.center ,),
              SizedBox(height: 30,),
             Padding(padding: EdgeInsets.symmetric(horizontal: 45),
             child:Text(content,style: TextStyle(fontSize: 20,color: Colors.grey),
               textAlign:TextAlign.center ,),)
            ],
          ))
        ],
      ),
    );
  }
  Widget elementOfindicator(int indect){
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 6),
      duration: Duration(milliseconds: 500) ,
     width:(indect==selectedIndex)? 30:6,height: 6,
    decoration: BoxDecoration(color: Colors.green,
      borderRadius: BorderRadius.circular(3),
    ),
    );
  }
  Widget indicator(){
    return Container(
      padding:EdgeInsets.only(bottom: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          elementOfindicator(0),
          elementOfindicator(1),
          elementOfindicator(2),
        ],
      ),
    );
  }
}
