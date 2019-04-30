import 'package:github_search/models/SearchResult.dart';
import 'package:github_search/services/data/github_service.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  GitHubService _service = GitHubService();

  final _searchController = BehaviorSubject<String>();
  Observable<String> get searchFlux => _searchController.stream;
  Sink<String> get searchEvent => _searchController.sink;

  Observable<SearchResult> apiResultFlux;

  SearchBloc() {
    apiResultFlux = searchFlux
        .distinct()
        .where((value) => value.length > 2)
        .debounce(Duration(microseconds: 500))
        .asyncMap(_service.search)
        .switchMap((value) => Observable.just(value));
  }

  void dispose() {
    _searchController.close();
  }
}
