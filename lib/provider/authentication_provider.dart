import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationProvider extends ChangeNotifier {
  final String _baseUrl = "https://reqres.in/api/";
  final String _loginEndpoint = "login";

  // State management
  bool _isLoading = false;
  String? _token;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get token => _token;
  String? get errorMessage => _errorMessage;

  void  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
      setLoading(true);
    _errorMessage = null;


    try {
      final response = await http.post(
        Uri.parse("$_baseUrl$_loginEndpoint"),  
        body: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
   
        final data = jsonDecode(response.body);
        _token = data['token'];
        print("Login successful. Token: $_token");
      
        setLoading(false);
        notifyListeners();
      } else {
        
        final data = jsonDecode(response.body);
        _errorMessage = data['error'] ?? 'Login failed';
        print("Login failed: $_errorMessage");
        setLoading(false);
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = "An error occurred: $e";
      print("Error: $_errorMessage");
      setLoading(false);
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}