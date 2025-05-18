import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = FutureProvider<List<PostModel>>((ref) async {
  final dio = Dio();

  final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
   final List<dynamic> data = response.data; 
  final posts = data.map((e) => PostModel.fromJson(e)).toList();
   return posts;
});

void main() {
  runApp(ProviderScope(child: const MaterialApp(home: MyWidget())));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, ref, child)  {
              final value =  ref.watch(provider);
              return value.when(
                data: (data) => Text(data[0].body),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
              );
            },
          ),
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) {
            return FloatingActionButton(
              onPressed: () {
                ref.read(provider);
              },
            );
          },
        ),
      ),
    );
  }
}

class PostModel {
  final String title;
  final String body;

  PostModel({required this.title, required this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(title: json['title'], body: json['body']);
  }
}
