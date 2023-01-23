part of 'see_all_page.dart';

abstract class _SeeAllPageProps extends State<SeeAllPage> {
  final ScrollController _searchListScrollController = ScrollController();
  // late final TextEditingController _searchTextController = TextEditingController();
  /* FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  void initState() {
    _addListeners();
    super.initState();
  }

  void _addListeners() {
    _refresh();
    _searchListScrollController.addListener(_tryLoadMore);
    _searchTextController
        .addListener(() => _onSearchTextChanged(_searchTextController.text));
  }

  void _onSearchTextChanged(String v) {
    context.read<SeeAllBloc>().add(SearchKeywordChangedEvent(v));
  }
  void _clearSearchText() {
    _searchTextController.clear();
    context.read<SeeAllBloc>().add(const SearchKeywordChangedEvent(''));
  }
  @override
  void dispose() {
    _searchListScrollController.dispose();
    _searchTextController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {}

  void _tryLoadMore() {
    if (!_searchListScrollController.hasClients) return;
    var state=  BlocProvider.of<SeeAllBloc>(context).state;
    bool  isLoading = state.status == StateStatus.loading;

    bool  isLoadingMore = state.status == StateStatus.loadingMore;

    bool  isBusy = isLoading || isLoadingMore;
    // when user scrolls to the bottom of the list, load more eshow list.
    if (_searchListScrollController.offset >= _searchListScrollController.position.maxScrollExtent - 80 &&
        _searchListScrollController.position.userScrollDirection == ScrollDirection.reverse &&
        !isBusy &&
        !state.isAtEndOfPage) {
      context.read<SeeAllBloc>().add(const LoadMoreSearchEvent());

      //LoadMoreSearchEvent
    }
  }
  void goToDetailService(SearchItem postService,UserEntity userEntity) {
    if(postService.username != null){
      BlocProvider.of<RouteCubit>(context).navigateRouteNamed(
          AutoRouteModel(
            path: AppRoutes.userFollowerPagePath,
            data: User.fromJson(postService.toJson()),
          ));
    }else if(postService.brand != null){
      BlocProvider.of<RouteCubit>(context).navigateRouteNamed(
          AutoRouteModel(
            path: AppRoutes.detailsProductPagePath,
            data: ItemProduct.fromJson(postService.toJson()),
          ));
    }else{
      BlocProvider.of<RouteCubit>(context).navigateRouteNamed(
          AutoRouteModel(path: AppRoutes.broadcastPagePath, data: {
            'isBroadcaster': (userEntity.role == "creator" &&
                userEntity.id == postService.user!.id),
            'itemSessionsLiveDetails': ItemSessionsLiveDetails.fromJson(postService.toJson()).toJson(),
            'user': userEntity
          }));
    }
  }


  bool _suffixIconBuilderPredicate(SeeAllState prev, SeeAllState current) {
    if (prev.status != StateStatus.loading && current.status == StateStatus.loading) {
      return true;
    }
    if (prev.status == StateStatus.loading && current.status != StateStatus.loading) {
      return true;
    }
    return false;
  }
 */

}
