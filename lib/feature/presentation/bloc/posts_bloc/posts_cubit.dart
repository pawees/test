import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/posts_entity.dart';
import '../../../domain/i_repositories/I_posts_repository.dart';
import '../statuses.dart';

part 'posts_state.dart';


class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this._postsRepository) : super(PostsState());

  final IPostsRepository _postsRepository;

  Future<void> fetchAllPosts() async {
    ///try to add rxDart trics

    emit(state.copyWith(status: PostsStatus.loading));

    try {
      final posts =
        await _postsRepository.getPosts();

      emit(
        state.copyWith(
          status: PostsStatus.success,
          //posts: posts,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: PostsStatus.failure));
    }
  }
}