
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/api/json_placeholder_client.dart';
import 'package:test_task/feature/datasource/_dto/post.dart';
import 'package:test_task/feature/datasource/cache/posts_details_cache.dart';
import 'package:test_task/feature/datasource/repositories/posts_repository.dart';
import 'package:test_task/feature/domain/entities/post_detailed_entity.dart';
import 'package:test_task/feature/domain/i_datasource/i_datasource.dart';
import 'package:test_task/feature/domain/i_repositories/I_posts_repository.dart';

void main() {
  group('PostsRepository', () {
    late IApiClient apiClient;
    late IPostsRepository repository;

    setUp(() {
      apiClient = JsonPlaceholderApiClient();
      repository = PostsRepository(
        cache: PostDetailsCache.empty(),
        remoteDataSource: apiClient,
      );
    });


    group('testApiAndRepository', () {

      test('getPosts', () async {
        // final exception = Exception('oops');

        final result = await repository.getPosts();

        // Assert
        expect(result, isA<List<Post>>());
        expect(result.response.posts.isNotEmpty, true);
      });

      test('getDetailedPost returns detailed post', () async {
        // Act
        final result = await repository.getDetails(1);
        final result2 = await repository.getDetails(2);
        final result3 = await repository.getDetails(3);

        // Assert
        expect(result, isA<PostDetailedEntity>());
        //expect(result.id, equals(1));
      });

      // test('calls getWeather with correct latitude/longitude', () async {
      //   final location = MockLocation();
      //   when(() => location.latitude).thenReturn(latitude);
      //   when(() => location.longitude).thenReturn(longitude);
      //   when(() => weatherApiClient.locationSearch(any())).thenAnswer(
      //         (_) async => location,
      //   );
      //   try {
      //     await weatherRepository.getWeather(city);
      //   } catch (_) {}
      //   verify(
      //         () => weatherApiClient.getWeather(
      //       latitude: latitude,
      //       longitude: longitude,
      //     ),
      //   ).called(1);
      // });
      //
      // test('throws when getWeather fails', () async {
      //   final exception = Exception('oops');
      //   final location = MockLocation();
      //   when(() => location.latitude).thenReturn(latitude);
      //   when(() => location.longitude).thenReturn(longitude);
      //   when(() => weatherApiClient.locationSearch(any())).thenAnswer(
      //         (_) async => location,
      //   );
      //   when(
      //         () => weatherApiClient.getWeather(
      //       latitude: any(named: 'latitude'),
      //       longitude: any(named: 'longitude'),
      //     ),
      //   ).thenThrow(exception);
      //   expect(
      //         () async => weatherRepository.getWeather(city),
      //     throwsA(exception),
      //   );
      // });
      //
      // test('returns correct weather on success (clear)', () async {
      //   final location = MockLocation();
      //   final weather = MockWeather();
      //   when(() => location.name).thenReturn(city);
      //   when(() => location.latitude).thenReturn(latitude);
      //   when(() => location.longitude).thenReturn(longitude);
      //   when(() => weather.temperature).thenReturn(42.42);
      //   when(() => weather.weatherCode).thenReturn(0);
      //   when(() => weatherApiClient.locationSearch(any())).thenAnswer(
      //         (_) async => location,
      //   );
      //   when(
      //         () => weatherApiClient.getWeather(
      //       latitude: any(named: 'latitude'),
      //       longitude: any(named: 'longitude'),
      //     ),
      //   ).thenAnswer((_) async => weather);
      //   final actual = await weatherRepository.getWeather(city);
      //   expect(
      //     actual,
      //     Weather(
      //       temperature: 42.42,
      //       location: city,
      //       condition: WeatherCondition.clear,
      //     ),
      //   );
      // });
      //
      // test('returns correct weather on success (cloudy)', () async {
      //   final location = MockLocation();
      //   final weather = MockWeather();
      //   when(() => location.name).thenReturn(city);
      //   when(() => location.latitude).thenReturn(latitude);
      //   when(() => location.longitude).thenReturn(longitude);
      //   when(() => weather.temperature).thenReturn(42.42);
      //   when(() => weather.weatherCode).thenReturn(1);
      //   when(() => weatherApiClient.locationSearch(any())).thenAnswer(
      //         (_) async => location,
      //   );
      //   when(
      //         () => weatherApiClient.getWeather(
      //       latitude: any(named: 'latitude'),
      //       longitude: any(named: 'longitude'),
      //     ),
      //   ).thenAnswer((_) async => weather);
      //   final actual = await weatherRepository.getWeather(city);
      //   expect(
      //     actual,
      //     Weather(
      //       temperature: 42.42,
      //       location: city,
      //       condition: WeatherCondition.cloudy,
      //     ),
      //   );
      // });
      //
      // test('returns correct weather on success (rainy)', () async {
      //   final location = MockLocation();
      //   final weather = MockWeather();
      //   when(() => location.name).thenReturn(city);
      //   when(() => location.latitude).thenReturn(latitude);
      //   when(() => location.longitude).thenReturn(longitude);
      //   when(() => weather.temperature).thenReturn(42.42);
      //   when(() => weather.weatherCode).thenReturn(51);
      //   when(() => weatherApiClient.locationSearch(any())).thenAnswer(
      //         (_) async => location,
      //   );
      //   when(
      //         () => weatherApiClient.getWeather(
      //       latitude: any(named: 'latitude'),
      //       longitude: any(named: 'longitude'),
      //     ),
      //   ).thenAnswer((_) async => weather);
      //   final actual = await weatherRepository.getWeather(city);
      //   expect(
      //     actual,
      //     Weather(
      //       temperature: 42.42,
      //       location: city,
      //       condition: WeatherCondition.rainy,
      //     ),
      //   );
      // });
      //
      // test('returns correct weather on success (snowy)', () async {
      //   final location = MockLocation();
      //   final weather = MockWeather();
      //   when(() => location.name).thenReturn(city);
      //   when(() => location.latitude).thenReturn(latitude);
      //   when(() => location.longitude).thenReturn(longitude);
      //   when(() => weather.temperature).thenReturn(42.42);
      //   when(() => weather.weatherCode).thenReturn(71);
      //   when(() => weatherApiClient.locationSearch(any())).thenAnswer(
      //         (_) async => location,
      //   );
      //   when(
      //         () => weatherApiClient.getWeather(
      //       latitude: any(named: 'latitude'),
      //       longitude: any(named: 'longitude'),
      //     ),
      //   ).thenAnswer((_) async => weather);
      //   final actual = await weatherRepository.getWeather(city);
      //   expect(
      //     actual,
      //     Weather(
      //       temperature: 42.42,
      //       location: city,
      //       condition: WeatherCondition.snowy,
      //     ),
      //   );
      // });
      //
      // test('returns correct weather on success (unknown)', () async {
      //   final location = MockLocation();
      //   final weather = MockWeather();
      //   when(() => location.name).thenReturn(city);
      //   when(() => location.latitude).thenReturn(latitude);
      //   when(() => location.longitude).thenReturn(longitude);
      //   when(() => weather.temperature).thenReturn(42.42);
      //   when(() => weather.weatherCode).thenReturn(-1);
      //   when(() => weatherApiClient.locationSearch(any())).thenAnswer(
      //         (_) async => location,
      //   );
      //   when(
      //         () => weatherApiClient.getWeather(
      //       latitude: any(named: 'latitude'),
      //       longitude: any(named: 'longitude'),
      //     ),
      //   ).thenAnswer((_) async => weather);
      //   final actual = await weatherRepository.getWeather(city);
      //   expect(
      //     actual,
      //     Weather(
      //       temperature: 42.42,
      //       location: city,
      //       condition: WeatherCondition.unknown,
      //     ),
      //   );
      // });
    });
  });
}