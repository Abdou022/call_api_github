import 'package:flutter/material.dart';
import 'package:test_call_api/models/productModel.dart';
import 'package:test_call_api/services/getApi.dart';

class ProductListScreen extends StatelessWidget {
  final GetApiCall apiCall = GetApiCall();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: apiCall.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), // Display loading indicator
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'), // Display error message
            );
          } else { 
            // Data has been loaded successfully, display it
            List<ProductModel>? products = snapshot.data;
            return ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].name),
                  
                );
              },
            );
          }
        },
      ),
    );
  }
}
