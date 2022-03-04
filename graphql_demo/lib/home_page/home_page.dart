import 'package:flutter/material.dart';
import 'package:graphql_demo/graphql/custom_query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String readRepositories = """
      query MyQuery {
      Flutter_Student {
        id
        class
        created_at
        standerd
        subject
        updated_at
      }
    }
    """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customQuery(
        graphQlQuery: readRepositories,
        child: (
          Map<String, dynamic>? responseData,
          VoidCallback? refetch,
          FetchMore? fetchMore,
        ) {
          print(responseData);
          return Center(
            child: InkWell(
              onTap: refetch,
              child: Text(
                responseData.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
