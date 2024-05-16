import 'package:the_coffee_house_leanning/call_api_service/model/stores/stores_entity.dart';
import 'package:the_coffee_house_leanning/repository/model/store/store.dart';

class AddStore {
  List<Store> addStore(StoresEntity storesEntity) {
    List<StoresStores> listStoresStores = storesEntity.stores;
    List<Store> listStore = [];

    listStoresStores.forEach((element) {
      listStore.add(Store(
          element.id,
          element.puCity,
          element.name,
          element.openTime,
          element.images,
          element.phone,
          [
            {"lat": element.location.lat},
            {"long": element.location.long}
          ],
          element.fullAddress,
          element.serviceTypes,
          element.tableServe,
          element.textOrderTable));
    });

    return listStore;
  }
}
