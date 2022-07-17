import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phoneauth/model/user.dart';

class SeeAllScreen extends StatelessWidget {
   SeeAllScreen( {Key? key ,this.usermodel}) : super(key: key);
  final AsyncValue<List<Users>>? usermodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("See All"),
        ),
        body:   usermodel!.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
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
              );
            },
            error: (err, s) {
              return Text("Error ");
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            )),);

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
