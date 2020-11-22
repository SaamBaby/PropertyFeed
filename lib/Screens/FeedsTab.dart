import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      color: Color(0xfffafafa),
      child: SingleChildScrollView(
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
            Column(
              children: List.generate(posts.length, (index) {
                 return PostCard(post_title: posts[index]['caption'],
                   profileImg: posts[index]['profileImg'],
                   postImg: posts[index]['postImg'],
                   name:posts[index]['name'],
                   profession: posts[index]['profession'],
                   LikeCount: posts[index]['LikeCount'],
                   isLoved:  posts[index]['isLoved'],
                   timeAgo: posts[index]['timeAgo'],);
              }),
            )





          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
 final String post_title;
 final String profileImg;
 final String name;
 final String postImg;
 final String profession;
 final String LikeCount;
 final String timeAgo;
 final bool isLoved;



 const PostCard({
    Key key, this.post_title,this.profileImg, this.name, this.postImg, this.profession, this.LikeCount, this.timeAgo, this.isLoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(radius: 23,
                      backgroundImage:NetworkImage(profileImg??"https://i.pinimg.com/564x/e1/77/47/e17747c78dd89a1d9522c5da154128b2.jpg"),),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name??"John Mu",style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),),
                          SizedBox(height: 3,),
                          Text(profession ??"Real Estate Agent ",style: GoogleFonts.montserrat(
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
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(postImg??posts[0]['postImg']),fit: BoxFit.cover
              ),
            )
          ),
          SizedBox(width: 10,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Text( post_title ?? "scouts guide to the zombie apocalypse",style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 18,
                    height: 1.5,
                    fontWeight: FontWeight.w400),),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
//                    Text("$LikeCount Likes",style: GoogleFonts.montserrat(
//                        color: Colors.black,
//                        fontSize: 18,
//                        fontWeight: FontWeight.w600),),
                    RichText(
                      text: TextSpan(
                          text: (LikeCount).toString() ??"1235"  ,
                          style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(text: '  Likes',
                                style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)
//                                recognizer: TapGestureRecognizer()
//                                  ..onTap = () {
//                                    // navigate to desired screen
//                                  }
                            )
                          ]
                      ),
                    ),
                    Container(
                      child:  Row(
                        children: <Widget>[
                          isLoved ? SvgPicture.asset("assets/images/loved_icon.svg",width: 27,) : SvgPicture.asset("assets/images/love_icon.svg",width: 27,),
                          SizedBox(width: 20,),
                          SvgPicture.asset("assets/images/comment_icon.svg",
                            width: 27,
                          color: Colors.black,),
                          SizedBox(width: 20,),
                          SvgPicture.asset("assets/images/message_icon.svg",width: 27,
                            color: Colors.black,),

                          SizedBox(width: 20,),

                          SvgPicture.asset("assets/images/bookmark.svg",width: 27,),
                          SizedBox(width: 20,),

                          SvgPicture.asset("assets/images/repeat.svg",width: 27,),

                        ],
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15,),
            color: Color(0xfffafafa),
            child: Padding(

              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),

              child:Column(


                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      children: [
                        CircleAvatar(radius: 20,
                          backgroundImage:NetworkImage(profileImg??"https://i.pinimg.com/564x/e1/77/47/e17747c78dd89a1d9522c5da154128b2.jpg"),),
                        SizedBox(width: 10,),
                        Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Color(0xfff2f2f2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextField(
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(

                                  border: InputBorder.none,
                                  hintText: "Add a comment.....",
                                  hintStyle: GoogleFonts.montserrat(
                                      color: Colors.black.withOpacity(.5),
                                      fontSize: 16,
                                      fontStyle:  FontStyle.italic,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ))

                      ]

                  ),
                  SizedBox(height: 20,),
                  Text(timeAgo??"5 hours ago",style: GoogleFonts.montserrat(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 16,
                      fontStyle:  FontStyle.italic,
                      fontWeight: FontWeight.w400),),
                ],


              ),



            ),
          ),
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

    