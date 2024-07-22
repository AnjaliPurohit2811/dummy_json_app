import 'dart:convert';
import 'package:get/get.dart';
import '../helper/api_service.dart';
import '../model/cart_model.dart';

class CartController extends GetxController {
  CartModel? cartModel;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs; // Added error message for better debugging

  final ApiService apiService;

  CartController(this.apiService);

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      String? json = await apiService.apiCalling();
      if (json != null) {
        cartModel = CartModel.fromJson(jsonDecode(json));
        print('Data fetched successfully');
      } else {
        print('No data returned from API');
        errorMessage.value = 'No data returned from API';
      }
    } catch (e) {
      print('Error fetching data: $e');
      errorMessage.value = 'Error fetching data: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
