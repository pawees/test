import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/feature/domain/entities/post_detailed_entity.dart';

import '../../../domain/i_repositories/I_posts_repository.dart';
import '../statuses.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this._postsRepository) : super(PostsState(posts: [])) {
    fetchAllPosts();
  }

  final IPostsRepository _postsRepository;

  Future<void> fetchAllPosts() async {

    await Future.delayed(Duration(seconds: 1));

    emit(state.copyWith(status: PostsStatus.loading, posts: []));

    try {
      final posts = await _postsRepository.getPosts();

      emit(
        state.copyWith(
          status: PostsStatus.success, posts: posts,
          //posts: posts,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: PostsStatus.failure, posts: []));
    }
  }
}
