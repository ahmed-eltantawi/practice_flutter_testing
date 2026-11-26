import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/album.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
main() {
  test("return an Album if the http call completes succfully", () {
    MockClient mockClient = MockClient((request) async {
      return await http.Response(
        "{'userId':1,'id':2,'title':'Hello every body how are you'}",
        200,
      );
    });

    expect(fetchAlbum(mockClient), isA<Album>());
  });
}
