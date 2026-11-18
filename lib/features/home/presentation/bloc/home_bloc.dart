import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localfix/features/auth/domain/usecases/getcurrentuser_usecase.dart';
import 'package:localfix/features/auth/domain/usecases/isloggedin_usecase.dart';
import 'package:localfix/features/home/domain/usecases/active_service_category_usecase.dart';
import 'package:localfix/features/home/domain/usecases/search_category_usecase.dart';
import 'package:localfix/features/home/presentation/bloc/home_event.dart';
import 'package:localfix/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final ActiveServiceCategoryUsecase activeServiceCategoryUsecase;
  final SearchcategoryUsecase searchcategoryUsecase;
  final IsloggedinUsecase isloggedinUsecase;
  final GetcurrentuserUsecase getcurrentuserUsecase;
  HomeBloc({
    required this.activeServiceCategoryUsecase,
    required this.searchcategoryUsecase,
    required this.isloggedinUsecase,
    required this.getcurrentuserUsecase,
  }):super(HomeInitial()){
    on<HomeStarted>(_homeStarted);
    on<SearchCleared>(_searchCleared);
    on<SearchPressed>(_searchPressed);
  }

    Future<void> _homeStarted(HomeStarted event,Emitter<HomeState> emit) async{
      try{
      final islogedin = isloggedinUsecase(); 
      if(!islogedin){
        emit(HomeLoading());
        emit(HomeError("Cannot load the home page"));
        return;
      }
      emit(HomeLoading());
      final result = await getcurrentuserUsecase();
      if(result == null){
        emit(HomeError(
          'Your user profile was not found. Sign out, then sign in again, or create a new account.',
        ));
        return;
      }
      final user = result.name;
      final category = await activeServiceCategoryUsecase();
      emit(HomeLoaded(userName: user, categories: category));
      } on FirebaseException catch (e) {
        if (e.code == 'permission-denied') {
          emit(HomeError(
            'Firestore denied this request. Publish the Firestore rules, then sign out and sign in again.',
          ));
          return;
        }
        emit(HomeError('Could not load the home page: ${e.message ?? e.code}'));
      } catch (e) {
        emit(HomeError('Could not load the home page: $e'));
      }
    }

  void _searchCleared(SearchCleared event,Emitter<HomeState> emit){
    if(state is HomeLoaded){
      final currentState = state as HomeLoaded;

      emit(currentState.copyWith(
        searchResults: [],
        isSearching: false,
        clearSearchError: true,
      ));
    }
  }

  
  void _searchPressed(SearchPressed event,Emitter<HomeState> emit) async{
    if(state is! HomeLoaded) return;

    if(event.query.trim().isEmpty) return;

    emit((state as HomeLoaded).copyWith(
      isSearching: true,
      clearSearchError: true
    ));
    try{
      final results = await searchcategoryUsecase(event.query);

      if(emit.isDone) return;

      final latestState = state;
      if(latestState is HomeLoaded){
        emit(latestState.copyWith(
          searchResults: results,
          isSearching: false,
          clearSearchError: true,
        ));
      }
    }catch(e){
      if(emit.isDone) return;

      final latestState = state;

      if(latestState is HomeLoaded){
        emit(latestState.copyWith(
          isSearching: false,
          searchError: e.toString(),
        ));
      }
    }
  }
}
