import 'package:encrypt/encrypt.dart';
import 'dart:convert';

class EncryptionService {
  static final _key = Key.fromUtf8('gdBmE6kAfU4ADqqZ6NmjQfQpTjY6uL4t');
  static final _iv = IV.fromUtf8('TUDaucTaXc3IxHJcpwBNLXv2MX7SgjBL');

  static final _encrypter = Encrypter(AES(_key));

  static String encrypt(String plain) {
    final encrypted = _encrypter.encrypt(plain, iv: _iv);
    return encrypted.base16;
  }

  static String decrypt(String cipher) {
    return _encrypter.decrypt(Encrypted.fromBase16(cipher), iv: _iv);
  }
}
