import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/post_detailed_entity.dart';
import '../../../domain/i_repositories/I_posts_repository.dart';
import '../statuses.dart';


part 'post_detailed_state.dart';

class PostDetailedCubit extends Cubit<PostDetailedState> {
  PostDetailedCubit(this._postsRepository) : super(const PostDetailedState());
  final IPostsRepository _postsRepository;


  Future<void> fetchPostDetails(int id) async {
  ///TODO find state othe bloc and returned
  ///    if (!state.status.isSuccess) return;
  ///     if (state.weather == Weather.empty) return;

  try {
    final details = await _postsRepository.getDetails(id);
    emit(
      state.copyWith(
        status: PostsStatus.success,
        details: details,
      ),
    );
  } on Exception {
    emit(state.copyWith(status: PostsStatus.failure));
  }
}
}


