import 'package:ecommerce_app/domain/entities/address.dart';

abstract class AddressRepository {
  Future<List<AddressModel?>> getShippingAddress();
  Future<List<AddressModel?>> getBillingAddress();


  Future<bool> postShippingAddress(AddressModel address);
  Future<bool> putShippingAddress(AddressModel address);
  Future<bool> deleteShippingAddress(int addressId );


  Future<bool> postBillingAddress(AddressModel address);
  Future<bool> putBillingAddress(AddressModel address);
  Future<bool> deleteBillingAddress(int addressId );
}