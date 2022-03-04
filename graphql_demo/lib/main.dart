import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'home_page/home_page.dart';

Future<void> main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink('https://gautam-sheta.hasura.app/v1/graphql', defaultHeaders: {
      'content-type': 'application/json',
      'x-hasura-admin-secret':
          'InqHtY98Gk5qKTx8HiVXaz9QVJjlwO41gl3WSbkY2bBQc9FYKMNCiwGxEJVPdSHu'
    });

    final AuthLink authLink = AuthLink(
      getToken: () async =>
          'Bearer InqHtY98Gk5qKTx8HiVXaz9QVJjlwO41gl3WSbkY2bBQc9FYKMNCiwGxEJVPdSHu',
    );

    final Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
