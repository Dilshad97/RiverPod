import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phoneauth/controller/user_controller.dart';
import 'package:phoneauth/screen/seel_all_screen.dart';

class UserHoookScreen extends ConsumerWidget {
  const UserHoookScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    //       ),
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Screen"),
        ),
        body: _data.when(
            data: (data) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.list_outlined),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SeeAllScreen(usermodel: _data),
                                  ));
                            },
                            child: Text("See All"))
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: data.length.clamp(0, 3),
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 8,
                        child: Column(
                          children: [
                            _content(
                                value: data[index].id.toString(),
                                contentName: "ID"),
                            _content(
                                value: data[index].userId.toString(),
                                contentName: "UserId"),
                            _content(
                                value: data[index].title, contentName: "Title"),
                            _content(
                                value: data[index].body, contentName: "Body"),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
            error: (err, s) {
              return Text("Error ");
            },
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ))
        // Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Icon(Icons.list_outlined),
        //           TextButton(
        //               onPressed: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                       builder: (context) =>
        //                           SeeAllScreen(usermodel: usermodel),
        //                     ));
        //               },
        //               child: Text("See All"))
        //         ],
        //       ),
        //     ),
        //     Flexible(
        //       child: ListView.builder(
        //         itemCount: usermodel!.length.clamp(0, 3),
        //         padding: const EdgeInsets.all(10),
        //         shrinkWrap: true,
        //         itemBuilder: (context, index) {
        //           return Card(
        //             elevation: 8,
        //             child: Column(
        //               children: [
        //                 _content(
        //                     value: usermodel![index].id.toString(),
        //                     contentName: "ID"),
        //                 _content(
        //                     value: usermodel![index].userId.toString(),
        //                     contentName: "UserId"),
        //                 _content(
        //                     value: usermodel![index].title,
        //                     contentName: "Title"),
        //                 _content(
        //                     value: usermodel![index].body, contentName: "Body"),
        //               ],
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //   ],
        // )
        );
  }

  Widget _content({String? value, String? contentName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 50, child: Text(contentName!)),
          const Text(":"),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.only(left: 5),
              child: Text(value!),
            ),
          )
        ],
      ),
    );
  }
}
