import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/album.dart';
import 'package:http/http.dart' as http;
// import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'album_fetch_test.mocks.dart';

@GenerateMocks([http.Client])
main() {
  group("check the fetch album in the two cases of success and failure", () {
    setUp(() {
      MockClient mockClient = MockClient();
    });

    

    test("return an Album if the http call completes succfully", () async {
      MockClient mockClient = MockClient();

      when(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer((realInvocation) async {
        return http.Response(
          '{"userId":1,"id":2,"title":"Hello every body"}',
          200,
        );
      });
      expect(
        await fetchAlbum(mockClient),
        isA<Album>()
            .having((album) => album.id, 'the id Should be 2', 2)
            .having((album) => album.userId, 'the user id should be 1', 1)
            .having(
              (album) => album.title,
              'The title should be ...',
              "Hello every body",
            ),
      );
    });

    test('check the the fetch album in case of errors', () {
      MockClient mockClient = MockClient();
      when(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer((realInvocation) async {
        return http.Response(
          "{'message':'this endpoint don't fond','status_code':404}",
          404,
        );
      });

      expect(fetchAlbum(mockClient), throwsException);
    });

    test('make sure it called once', () {
      MockClient mockClient = MockClient();

      when(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer((realInvocation) async {
        return http.Response(
          '{"userId":1,"id":2,"title":"Hello every body"}',
          200,
        );
      });

      fetchAlbum(mockClient);

      verify(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).called(1);
    });
  });
}
