import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professsionalfeed/constant/post_json.dart';
import 'package:professsionalfeed/constant/story_json.dart';

class FeedTab extends StatefulWidget {
  @override
  _FeedTabState createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff2f2f2),
      child: Column(
        
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(stories.length, (index){

                  return Padding(
                    padding: EdgeInsets.all(2),
                    child: StoryFeed(img: stories[index]['img'],name: stories[index]['name'],isLive: stories[index]['isLive']??false),
                  );
                })
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            CircleAvatar(radius: 23,
                            backgroundImage:NetworkImage("https://images.unsplash.com/photo-1605885178292-1eb68e3fe93f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80"),),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("John Mu",style: GoogleFonts.montserrat(
                                    color: Color(0xff696969),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),),
                                SizedBox(height: 3,),
                                Text("Real Estate Agent ",style: GoogleFonts.montserrat(
                                    color: Color(0xff272727),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),)
                              ],
                            ),

                          ]
                        ),
                      ),
                      Icon(Icons.more_horiz,
                      size: 30,),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(posts[0]['postImg']),fit: BoxFit.cover
                    ),
                  )
                ),
                SizedBox(width: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("123 Likes",style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),),
                      Container(
                        child: Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.black.withOpacity(.8),
                                size: 25.0,

                              ),
                              SizedBox(width: 25,),
                              Icon(
                                Icons.insert_comment,
                                color: Colors.black.withOpacity(.8),
                                size: 25.0,

                              ),
                              SizedBox(width: 30,),
                              Icon(
                                Icons.send,
                                color: Colors.black.withOpacity(.8),
                                size: 25.0,

                              ),
                              SizedBox(width: 10,),
                              Icon(
                                Icons.bookmark_border,
                                color: Colors.black.withOpacity(.8),
                                size: 25.0,

                              ),

                              SizedBox(width: 20,),
                              Icon(
                                Icons.shuffle,
                                color: Colors.black.withOpacity(.8),
                                size: 25.0,

                              ),



                            ]
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}

class StoryFeed extends StatelessWidget {
  final String name;
  final String img;
   final bool isLive;
  const StoryFeed({
    Key key, this.name, this.img,this.isLive
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.blue,
                width: 2
            ),
            shape: BoxShape.circle,

          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Stack(
              children: [
                Container(
                  width: 60,
                  height:60,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          width: 1.5
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(img,),
                          fit:BoxFit.cover
                      )
                  ),
                ),
                Visibility(
                  visible: isLive?true:false,
                  child: Positioned(
                      bottom: 0,

                      child: Container(
                    width: 58.5 ,
                      height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xff45403E), Color(0xffF54B64
                            )])
                    ),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Row(
                            
                            children: [
                              FaIcon(FontAwesomeIcons.video,size: 15,color: Color(0xff45403E).withOpacity(.2),
                              ),
                              SizedBox(width: 6,),
                              Text("LIVE",style: TextStyle(
                                  color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        )
                  )),
                )
              ],
            ),

          ),
        ),
        SizedBox(height: 5,),
        SizedBox(
          width: 80,
          child: Text(name,style: GoogleFonts.montserrat(
              color: Color(0xff272727),
              fontSize: 14,
              fontWeight: FontWeight.w400),
          overflow: TextOverflow.ellipsis,),
        )
      ],
    );
  }
}

    