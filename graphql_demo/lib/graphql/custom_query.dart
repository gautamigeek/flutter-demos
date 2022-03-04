import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// duration in seconds
///
Query customQuery({
  required String graphQlQuery,
  required Widget Function(
    Map<String, dynamic>? responseData,
    VoidCallback? refetch,
    FetchMore? fetchMore,
  )
      child,
  int? duration,
  Widget? isLoading,
  Widget? hasException,
}) {
  return Query(
    options: QueryOptions(
      document:
          gql(graphQlQuery), // this is the query string you just created
      pollInterval: duration == null ? null : Duration(seconds: duration),
    ),
    builder: (
      QueryResult result, {
      VoidCallback? refetch,
      FetchMore? fetchMore,
    }) {
      if (result.isLoading) {
        return isLoading ??
            const Center(
              child: CircularProgressIndicator(),
            );
      } else if (result.hasException) {
        return hasException ??
            Center(
              child: Text(
                result.exception?.graphqlErrors.first.message ?? "",
              ),
            );
      } else {
        Map<String, dynamic>? repositories = result.data;
        if (repositories == null) {
          return const Text('No repositories');
        }
        return child(result.data, refetch, fetchMore);
      }
    },
  );
}
