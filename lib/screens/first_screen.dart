import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/network/endpoints.dart';
import 'package:test_app/network/model/product_model.dart';

import '../network/dio_client.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late bool _loading;
  late ProductModel productModel;

  String? error;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    setState(() {
      _loading = true;
    });

    try {
      var response = await Endpoints().getProducts();
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonData = response.data;

        // Assuming jsonData is a Map<String, dynamic>
        productModel = ProductModel.fromJson(jsonData);


      } else {
        error = 'Some Error Occur (Response code Api: getProducts() 1';
      }
    } catch (e) {
      error = 'Some Error Occur (Response code Api: getProducts() ${e.toString()}';
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Calling Example'),
      ),
      body: _loading
          ? _loadingWidget()
          : error == null
              ? _data_widget()
              : _error_widget(),
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _data_widget() {
    return SizedBox(
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(child: Text(productModel.id.toString())),
          Card(child: Text(productModel.title.toString())),
          Card(child: Text(productModel.price.toString())),
          Card(child: Text(productModel.description.toString())),
          Card(child: Text(productModel.category.toString())),
          Card(child: Text(productModel.rating.toString())),
        ],
      ),
    );
  }

  Widget _error_widget() {
    return Center(child: Text(error.toString()),);
  }
}
