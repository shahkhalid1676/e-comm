import 'package:googleapis_auth/auth_io.dart';

class GetServerKey {
  Future<String> getServerKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson({
        "type": "service_account",
        "project_id": "e-comm-76688",
        "private_key_id": "b03e74e74e96fac1a69823e80bf01bfdc1e1161d",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCvGmKmmunCyAxq\nsB/P7OvLoIxDeRpJMUHkoLBuXPNZymKs8y/hFT7xS3BioCg19SLghyMR94At1ITu\n1m1RRxQNAwWGkLT3sWYce2AHMwgOolHnafBUnjamzfvrUYubpbhqwU8m4jUCuwWO\n64ysuxQskHVT2nulbZ+WyOM0iPLGzcJbuukO5e6JLuopUqnUJvrcdlTzvXB3Qtfl\ntqcylH7VI9hlhwDFTUzdwa+zm2VDwMar5Z+AFq3MsiPidnLuX7kP4V/q8Fuh1IFV\nPuK7m/ag9HxainormA2jpBbZhwvd8cKe8B5Ria6xzIy4GO3eS3jskrDTXnSLKdPm\n5wH3EVwXAgMBAAECggEABwZtTsyISbhHnJV/BpM1d/CeWqv70f6X64RG5SagMh9c\ni3PLnUws6kwMhj3GtI4miBDj509MD9/8NVjaVJh1cCWJjeHgYM+ijndPXaU+fYJ6\n/BMpVpEXwDl4vJ2DlwsJtb7BCN5VIiGUEi0rx6z5x4/uz8kZjNmJEujxtKSJ7k/h\n0MPsVj0DI5kAWsj4o4GeDHeWXM5v2GG8xmVt6dtzy+YvlPfcdim7R3oMnAgqrz7I\nXzb3KvjR2/e+63Nul9XI2KDW4C4caqLBIL+nFROowEgr/lzpD8FNsZ3MLiVEdQKw\nKTBe/oAdtWxtcELTfHaoi2J24iUvql/BltgiNsccgQKBgQD3AoXP+gXLWF5cNn9v\n0Sx7O/0W7fTd19AE8SDO3jmEa6bK3HojUGyNf2H5PGB7Eft0S/UvWmwFXgqNihW5\nMNXBuOzUljXYW845vbyNeHJxQ/3zEU+gMv+FanskQj2+M19vAdfROenzNVDLamup\nFmMGJ6z4eeRnuNCDYd6Xml/ZgwKBgQC1eeHHFgrX1lF3xUKJSJnDUYPfFnO9Du/8\nOW7/3QzMACSynZ2aJNOgGEXe5V6cGgBL0blLFyDXODwTsoB2LUZlD2Q8TX4W7t4w\nZyQaH9g1AwocpEYSYHqpsQftyxKG0uXx34J5Vw++lPDU1r0ATnMgAZ5b/W3uOkJX\nJZRBch0y3QKBgQCKtQ3zhlEuqUcDvU6+udWitkMfVyzETuZvgACOalgeNl2JWVn0\n7rqmkruvu+np8mUkH2tl1f8G3JJMfRhJ0FSY3oGPt3IxNwyNfDCfuN17IVU/4561\nNS4r+2l/KPuHDU4wBfbtdPodKvld4Trnzrx4vlrxhXFvlWbyAEmBFJ1yhQKBgD7n\nobB93oJUgubOVLL7nHkMv3ZL9RB6pgs66VP9jpsEDbRwWBn/W+/pmgaaYUIg7Sta\n5iy2NqcDkieNv2O3a+hJ/oe8oNFYOWJzzhrUIQC3LgEhnDxwfvRlLgdqVeCwKA7A\nWByxZf686AIO8XKyvstAZGEkpr9mKGrG1u4cnSxtAoGAOLeEzAD9+Vdfr9SWG+O1\nZkuwdrqjDMl86KgAM7/+VAshTjL7n5FbqevBnWGSq1XUnyK3VdDzSdDagKlqlz4U\nwRQOWupC14gaEYDnctLc1kq1SgOh/9sLJ8bhkUGtBGAjffCQcYcs+VONCZ96QDkQ\n3jXMKuviAjYzVe3+lrMAf60=\n-----END PRIVATE KEY-----\n",
        "client_email": "firebase-adminsdk-od8ds@e-comm-76688.iam.gserviceaccount.com",
        "client_id": "118205299877939306145",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-od8ds%40e-comm-76688.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com"
      }),
      scopes,
    );
    final accessServerKey = client.credentials.accessToken.data;
    return accessServerKey;
  }
}