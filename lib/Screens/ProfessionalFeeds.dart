import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'FeedsTab.dart';

class ProfessionalFeed extends StatefulWidget {
  @override
  _ProfessionalFeedState createState() => _ProfessionalFeedState();
}

class _ProfessionalFeedState extends State<ProfessionalFeed>  with SingleTickerProviderStateMixin{
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState(){
    super.initState();
    _tabController= TabController(length: 2, vsync: this);
    _scrollController= ScrollController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:  buildAppBar(),
        body: TabBarView(
          children: [
            FeedTab(),
            Center(
                child: Container(
                  color: Colors.white,
                  child: Text(
                    "Agents",
                  ),
                ))
          ],
        ),
      ),
    );
  }
  AppBar buildAppBar() {


    return AppBar(
        leading: Transform.translate(
          offset: Offset(10, 0),
          child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.blue),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        toolbarHeight: 200,
        centerTitle: true,
        title: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),

          ],
        ),
             bottom: PreferredSize(
               preferredSize: Size.fromHeight(80),
               child: Align(
                 alignment: Alignment.topCenter,
                 child: Column(
                   children: [
                     // search bar
                     Container(
                       margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                       width: double.infinity,
                       child: Row(
                         children: [
                           Expanded(
                               child: Container(
                                 padding: EdgeInsets.symmetric(horizontal: 15),
                                 decoration: BoxDecoration(
                                     color: Color(0xfff2f2f2),
                                     borderRadius: BorderRadius.circular(15)),
                                 child: TextField(
                                   cursorColor: Colors.blue,
                                   decoration: InputDecoration(
                                     icon: Icon(
                                       Icons.search,
                                       size: 22,
                                       color: Colors.black54,
                                     ),
                                     border: InputBorder.none,
                                     hintText: "Search",
                                     hintStyle: GoogleFonts.montserrat(
                                         color: Color(0xff989898),
                                         fontSize: 18,
                                         fontWeight: FontWeight.w400),
                                   ),
                                 ),
                               ))
                         ],
                       ),
                     ),
                     Divider(
                     ),
                     TabBar(
                         
                         unselectedLabelColor: Colors.grey,
                         labelColor: Color(0xff212121),
                         tabs: [
                           Tab(
                               icon: FaIcon(FontAwesomeIcons.users)
                           ),
                           Tab(
                               icon: FaIcon(FontAwesomeIcons.globe)
                           ),

                         ]),
                   ],
                 ),
               ),
             ),);
  }
}
