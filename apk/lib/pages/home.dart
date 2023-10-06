import 'package:apk/util/bubble_stories.dart';
import 'package:apk/util/user_posts.dart';
import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  final List people = ['HumanOne', 'HumanTwo', 'HumanThree', 'HumanFour', 'HumanFive'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
            'Instagram', 
            style: TextStyle(color: Colors.black),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    //buat backend --
                  },
                  child: Icon(Icons.add)),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.favorite),
                ),//membuat jarak pada logo
                Icon(Icons.send),
              ],
            )
        ],),
      ),
      body: Column(
        children: [
          //STORY
          Container(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: people.length ,
              itemBuilder: (context,index) {
              return BubbleStories(
                
                text: people[index]);
            })
          ),

          //POSTINGAN
          
         Expanded(
           child: ListView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) {
             return UserPosts(
              name: people[index],
              );
           }),
         ),
        ],
      )
    );
  }
}