import 'package:flutter/material.dart';
import 'package:social_app/shared/style/broken_icons.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            margin: EdgeInsets.all(8.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(
                  image: NetworkImage(
                      "https://image.freepik.com/free-photo/impressed-surprised-man-points-away-blank-space_273609-40694.jpg"),
                  fit: BoxFit.cover,
                  height: 200.0,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Communicate With Friends',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),

         ListView.separated(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           itemBuilder: (context, index) => _buildPostItem(context),
         itemCount: 10,
           separatorBuilder: (BuildContext context, int index) => SizedBox(height: 8.0,),
         )
        ],
      ),
    );
  }
 Widget _buildPostItem(context) => Card(
   clipBehavior: Clip.antiAliasWithSaveLayer,
   elevation: 5.0,
   margin: EdgeInsets.symmetric(horizontal: 8.0),
   child: Padding(
     padding: const EdgeInsets.all(10.0),
     child: Column(
       children: [
         Row(
           children: [
             CircleAvatar(
               radius: 25.0,
               backgroundImage: NetworkImage(
                   "https://image.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg"),
             ),
             SizedBox(
               width: 15.0,
             ),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Text(
                         'Abdelazez Saad',
                         style: TextStyle(
                           fontSize: 18.0,
                           fontWeight: FontWeight.w600,
                           height: 1.4,
                         ),
                       ),
                       SizedBox(
                         width: 5,
                       ),
                       Icon(
                         Icons.check_circle,
                         color: Colors.blue,
                         size: 16.0,
                       )
                     ],
                   ),
                   Text(
                     'January 21, 2021 at 11:00 pm',
                     style:
                     Theme.of(context).textTheme.caption.copyWith(
                       fontWeight: FontWeight.w600,
                       height: 1.4,
                     ),
                   )
                 ],
               ),
             ),
             SizedBox(
               width: 15.0,
             ),
             IconButton(
               icon: Icon(Icons.more_horiz_outlined),
               onPressed: () {},
               iconSize: 16.0,
             ),
           ],
         ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 15.0),
           child: Container(
             width: double.infinity,
             height: 1,
             color: Colors.grey[300],
           ),
         ),
         Text(
           "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,",
           style: TextStyle(
             height: 1.3,
             fontSize: 16.0,
             fontWeight: FontWeight.w600,
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(top: 5.0, bottom: 10),
           child: Container(
             width: double.infinity,
             child: Wrap(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(right: 6),
                   child: Container(
                     height: 25.0,
                     child: MaterialButton(
                       minWidth: 1.0,
                       height: 25.0,
                       padding: EdgeInsets.zero,
                       onPressed: () {},
                       child: Text(
                         "#software",
                         style: Theme.of(context)
                             .textTheme
                             .caption
                             .copyWith(
                           color: Colors.blue[800],
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
         Container(
           width: double.infinity,
           height: 140.0,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(4.0),
             image: DecorationImage(
               image: NetworkImage(
                   "https://image.freepik.com/free-photo/surprised-shocked-afro-american-woman-uses-mobile-phone-reads-news-online-stares-bugged-eyes-wondered-man-poses-near-chair-with-cactus-pot-hands-interracial-couple-indoor-pink-wall_273609-45450.jpg"),
               fit: BoxFit.cover,
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 5.0),
           child: Row(
             children: [
               Expanded(
                 child: InkWell(
                   child: Padding(
                     padding:
                     const EdgeInsets.symmetric(vertical: 5.0),
                     child: Row(
                       children: [
                         Icon(
                           IconBroken.Heart,
                           size: 16.0,
                           color: Colors.red,
                         ),
                         SizedBox(
                           width: 5.0,
                         ),
                         Text(
                           "120",
                           style: Theme.of(context).textTheme.caption,
                         ),
                       ],
                     ),
                   ),
                   onTap: () {},
                 ),
               ),
               Expanded(
                 child: InkWell(
                   child: Padding(
                     padding:
                     const EdgeInsets.symmetric(vertical: 5.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Icon(
                           IconBroken.Chat,
                           size: 16.0,
                           color: Colors.amber,
                         ),
                         SizedBox(
                           width: 5.0,
                         ),
                         Text(
                           "120 comment",
                           style: Theme.of(context).textTheme.caption,
                         ),
                       ],
                     ),
                   ),
                   onTap: () {},
                 ),
               ),
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(bottom: 5.0),
           child: Container(
             width: double.infinity,
             height: 1,
             color: Colors.grey[200],
           ),
         ),
         Row(
           children: [
             Expanded(
               child:InkWell(
                 child: Row(
                   children: [
                     CircleAvatar(
                       radius: 15.0,
                       backgroundImage: NetworkImage(
                           "https://image.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg"),
                     ),
                     SizedBox(
                       width: 15.0,
                     ),
                     Text(
                       'Write a comment ... ',
                       style: Theme.of(context).textTheme.caption.copyWith(
                         fontWeight: FontWeight.w600,
                         height: 1.4,
                       ),
                     ),
                   ],
                 ),
                 onTap: (){},
               ),
             ),
             InkWell(
               child: Padding(
                 padding:
                 const EdgeInsets.symmetric(vertical: 5.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Icon(
                       IconBroken.Heart,
                       size: 16.0,
                       color: Colors.red,
                     ),
                     SizedBox(
                       width: 5.0,
                     ),
                     Text(
                       "Like",
                       style: Theme.of(context).textTheme.caption,
                     ),
                   ],
                 ),
               ),
               onTap: () {},
             ),
           ],
         ),

       ],
     ),
   ),
 );

}