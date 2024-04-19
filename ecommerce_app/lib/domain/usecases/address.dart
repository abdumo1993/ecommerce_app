
import 'package:ecommerce_app/domain/entities/address.dart';
import 'package:ecommerce_app/domain/repositories/address.dart';

class AddressUseCase{
  final AddressRepository repo;

  AddressUseCase({required this.repo});
  
  Future<List<AddressModel?>> getShippingAddress() async {
    try {
      return await repo.getShippingAddress();
    } catch (e) {
      rethrow;
    }
  }

   Future<bool> postShippingAddress(AddressModel address) async {
    try {
      return await repo.postShippingAddress(address);
    } catch (e) {
      rethrow;
    }
  }
  Future<bool> putShippingAddress(AddressModel address) async {
    try {
      return await repo.putShippingAddress(address);
    } catch (e) {
      rethrow;
    }
  }
  Future<bool> deleteShippingAddress(int addressId) async {
    try {
      return await repo.deleteShippingAddress(addressId);
    } catch (e) {
      rethrow;
    }
  }


  Future<List<AddressModel?>> getBillingAddress() async {
    try {
      return await repo.getBillingAddress();
    } catch (e) {
      rethrow;
    }
  }

   Future<bool> postBillingAddress(AddressModel address) async {
    try {
      return await repo.postBillingAddress(address);
    } catch (e) {
      rethrow;
    }
  }
  Future<bool> putBillingAddress(AddressModel address) async {
    try {
      return await repo.putBillingAddress(address);
    } catch (e) {
      rethrow;
    }
  }
  Future<bool> deleteBillingAddress(int addressId) async {
    try {
      return await repo.deleteBillingAddress(addressId);
    } catch (e) {
      rethrow;
    }
  }
}