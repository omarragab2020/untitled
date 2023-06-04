import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/models/product_model.dart';
import 'package:untitled/app/services/firebase_handler.dart';
import 'package:uuid/uuid.dart';

import '../../utils/helpers.dart';
import '../data/models/category_model.dart';
import '../data/models/shop_model.dart';

class FirebaseDB {
  static Future<void> initDB() async {
    ShopModel shopModel = ShopModel(
        name: 'Metro',
        rate: 3.8,
        rateNum: 200,
        image: 'https://www.dynadot.com/domain/logo/shop-logo1483672083.png',
        address: 'Galaa Street');
    await FirebaseHandler.saveShop(shopModel);

    ///region single category
    CategoryModel categoryModel = CategoryModel(
        shopID: shopModel.id,
        name: 'Beans, Peas & Corn',
        type: 'vegetable',
        image:
            'https://kibsecomimgstore.blob.core.windows.net/products/display/corswkexxkgsa1_265222.jpg');
    await FirebaseHandler.saveCategory(categoryModel);
    mPrint('categoryModel = $categoryModel');

    ProductModel productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'حزمة فراغ',
      nameEn: '400g - Vaccum pack',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_CORCOESXX12PS1_20230315101844.jpg',
      descriptionEn: '400g - Vaccum pack',
      descriptionAr: 'حزمة فراغ',
      discount: 9,
      price: 10.5,
      rate: 3.5,
      rateNum: 1,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'ذرة حلوة مشوية',
      nameEn: 'Grilled Sweet corns',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_CORGRESXX12PS1_20230131110402.jpg',
      descriptionEn: 'Grilled Sweet corns',
      descriptionAr: 'ذرة حلوة مشوية',
      discount: 18,
      price: 25,
      rate: 1.5,
      rateNum: 1,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'ذرة حلو',
      nameEn: 'Sweet Corn',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/corswkexxkgsa1_265222.jpg',
      descriptionEn: 'Sweet Corn',
      descriptionAr: 'ذرة حلو',
      discount: 48,
      price: 50,
      rate: 3.8,
      rateNum: 2,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'البازلاء الثلوج',
      nameEn: 'Snowpeas',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/PEASNKEXXPKTA1.jpg',
      descriptionEn: 'Snowpeas',
      descriptionAr: 'البازلاء الثلوج',
      discount: 8.5,
      price: 10,
      rate: 4.0,
      rateNum: 2,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    ///endregion single category

    ///region single category
    categoryModel = CategoryModel(
        shopID: shopModel.id,
        name: 'Pomegranates',
        type: 'fruits',
        image:
            'https://kibsecomimgstore.blob.core.windows.net/products/display/ANARDINXX03KS1.jpg');
    await FirebaseHandler.saveCategory(categoryModel);

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Royal Gala Apples',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/apprgitxx8pkao_485266.jpg',
      descriptionEn: 'Apples & Pears',
      discount: 8.5,
      price: 10,
      rate: 3.0,
      rateNum: 2,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Rockit Apples',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/approitro3pcs1_748336.jpeg',
      descriptionEn: 'Rockit Apples',
      discount: 19.95,
      price: 22,
      rate: 2.0,
      rateNum: 1,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Green Apples',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_APPGSZAXX18KS1_20230427200847.jpg',
      descriptionEn: 'Rockit Apples',
      discount: 45,
      price: 50,
      rate: 2.0,
      rateNum: 3,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Gala Apples',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/apprdzaxx18ks1_818415.jpg',
      descriptionEn: 'Rockit Apples',
      discount: 9.50,
      price: 10,
      rate: 3.8,
      rateNum: 3,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);

    ///endregion single category

    ///region single category
    categoryModel = CategoryModel(
        shopID: shopModel.id,
        name: 'Sweet Melons',
        type: 'fruits',
        image:
            'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_MELSWOMXXXXXL1_20220603164155.jpg');
    await FirebaseHandler.saveCategory(categoryModel);

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'jackfruit',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/jacxxthxx250a1_912940.jpg',
      descriptionEn: 'jackfruit',
      discount: 9.50,
      price: 12,
      rate: 4.5,
      rateNum: 3,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Golden Berries',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/BERGBCOXX12PA1.jpg',
      descriptionEn: 'Golden Berries',
      discount: 14,
      price: 15,
      rate: 3,
      rateNum: 1,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Bananas',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/banxxphji13ks1_125293.jpg',
      descriptionEn: 'Bananas',
      discount: 11,
      price: 12,
      rate: 4.9,
      rateNum: 2,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Red Papaya',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_PAPYELKXX6KGA1_20211009124909.jpg',
      descriptionEn: 'Red Papaya',
      discount: 21.50,
      price: 22,
      rate: 4.9,
      rateNum: 2,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);

    ///endregion single category
  }

  /// Second Shop

  static Future<void> initDB2() async {
    ShopModel shopModel = ShopModel(
        name: 'Asafra',
        rate: 2.5,
        rateNum: 2,
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGEKpoBwnkz4xD7fTNeNG3lyRm7nvJA1ORjh6Nj0GC8HryYr5jbSa130tSg4emIj9JCz0&usqp=CAU',
        address: 'Thanaweya Street');
    await FirebaseHandler.saveShop(shopModel);

    ///region single category
    CategoryModel categoryModel = CategoryModel(
        shopID: shopModel.id,
        name: 'Beans, Peas & Corn',
        type: 'vegetable',
        image:
            'https://kibsecomimgstore.blob.core.windows.net/products/display/corswkexxkgsa1_265222.jpg');
    await FirebaseHandler.saveCategory(categoryModel);
    mPrint('categoryModel = $categoryModel');

    ProductModel productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'حزمة فراغ',
      nameEn: '400g - Vaccum pack',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_CORCOESXX12PS1_20230315101844.jpg',
      descriptionEn: '400g - Vaccum pack',
      descriptionAr: 'حزمة فراغ',
      discount: 9,
      price: 10.5,
      rate: 3.5,
      rateNum: 1,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'ذرة حلوة مشوية',
      nameEn: 'Grilled Sweet corns',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_CORGRESXX12PS1_20230131110402.jpg',
      descriptionEn: 'Grilled Sweet corns',
      descriptionAr: 'ذرة حلوة مشوية',
      discount: 18,
      price: 25,
      rate: 1.5,
      rateNum: 1,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'ذرة حلو',
      nameEn: 'Sweet Corn',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/corswkexxkgsa1_265222.jpg',
      descriptionEn: 'Sweet Corn',
      descriptionAr: 'ذرة حلو',
      discount: 48,
      price: 50,
      rate: 3.8,
      rateNum: 2,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'البازلاء الثلوج',
      nameEn: 'Snowpeas',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/PEASNKEXXPKTA1.jpg',
      descriptionEn: 'Snowpeas',
      descriptionAr: 'البازلاء الثلوج',
      discount: 8.5,
      price: 10,
      rate: 4.0,
      rateNum: 2,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    ///endregion single category

    ///region single category
    categoryModel = CategoryModel(
        shopID: shopModel.id,
        name: 'Pomegranates',
        type: 'fruits',
        image:
            'https://kibsecomimgstore.blob.core.windows.net/products/display/ANARDINXX03KS1.jpg');
    await FirebaseHandler.saveCategory(categoryModel);

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Royal Gala Apples',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/apprgitxx8pkao_485266.jpg',
      descriptionEn: 'Apples & Pears',
      discount: 8.5,
      price: 10,
      rate: 3.0,
      rateNum: 2,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Rockit Apples',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/approitro3pcs1_748336.jpeg',
      descriptionEn: 'Rockit Apples',
      discount: 19.95,
      price: 22,
      rate: 2.0,
      rateNum: 1,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Green Apples',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_APPGSZAXX18KS1_20230427200847.jpg',
      descriptionEn: 'Rockit Apples',
      discount: 45,
      price: 50,
      rate: 2.0,
      rateNum: 3,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Gala Apples',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/apprdzaxx18ks1_818415.jpg',
      descriptionEn: 'Rockit Apples',
      discount: 9.50,
      price: 10,
      rate: 3.8,
      rateNum: 3,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);

    ///endregion single category

    ///region single category
    categoryModel = CategoryModel(
        shopID: shopModel.id,
        name: 'Sweet Melons',
        type: 'fruits',
        image:
            'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_MELSWOMXXXXXL1_20220603164155.jpg');
    await FirebaseHandler.saveCategory(categoryModel);

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'jackfruit',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/jacxxthxx250a1_912940.jpg',
      descriptionEn: 'jackfruit',
      discount: 9.50,
      price: 12,
      rate: 4.5,
      rateNum: 3,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Golden Berries',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/BERGBCOXX12PA1.jpg',
      descriptionEn: 'Golden Berries',
      discount: 14,
      price: 15,
      rate: 3,
      rateNum: 1,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Bananas',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/banxxphji13ks1_125293.jpg',
      descriptionEn: 'Bananas',
      discount: 11,
      price: 12,
      rate: 4.9,
      rateNum: 2,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Red Papaya',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_PAPYELKXX6KGA1_20211009124909.jpg',
      descriptionEn: 'Red Papaya',
      discount: 21.50,
      price: 22,
      rate: 4.9,
      rateNum: 2,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);

    ///endregion single category
    ///region single category
    categoryModel = CategoryModel(
        shopID: shopModel.id,
        name: 'Cherry Tomatoes',
        type: 'vegetable',
        image:
            'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_TOMCYMAXXXXXA1_20211108115017.jpg');
    await FirebaseHandler.saveCategory(categoryModel);

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Cherry Tomato Mix',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_TOMMIAEXX2XXL1_20211220140504.jpg  ',
      descriptionEn: 'Cherry Tomato Mix',
      discount: 170,
      price: 165,
      rate: 2.0,
      rateNum: 1,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Cherry Tomatoes',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/TOMCBNLXX3KGA1.jpg',
      descriptionEn: 'Cherry Tomato Mix',
      discount: 23,
      price: 20,
      rate: 4.0,
      rateNum: 1,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Tomatoes',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_TOMBUNLXX500A1_20220902074134.jpg',
      descriptionEn: 'Cherry Tomato Mix',
      discount: 13.5,
      price: 12,
      rate: 4.9,
      rateNum: 1,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Vine Tomatoes',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_CHEVITRXXPACAO_20230520131558.jpg',
      descriptionEn: 'Cherry Tomato Mix',
      discount: 13.5,
      price: 12,
      rate: 4.9,
      rateNum: 1,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);

    ///endregion single category
  }

  /// Third Shop

  static Future<void> initDB3() async {
    ShopModel shopModel = ShopModel(
        name: 'Wekalet Elmansura',
        rate: 4.5,
        rateNum: 100,
        image: 'https://www.tsawq.net/images/market/wekalet.elmansoura.jpg',
        address: 'Street');
    await FirebaseHandler.saveShop(shopModel);

    ///region single category
    CategoryModel categoryModel = CategoryModel(
        shopID: shopModel.id,
        name: 'Eggplants & Marrows',
        type: 'vegetable',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJxH6_BKiDrQCUzoBljxRO-jT1Mp0TB3LEOe_6_NjK7TAF9TSMbGS5QBkP-iq8zQSpb58&usqp=CAU');
    await FirebaseHandler.saveCategory(categoryModel);
    mPrint('categoryModel = $categoryModel');

    ProductModel productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'حزمة فراغ',
      nameEn: 'Yellow Zucchinis',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/ZUCYENLXX5KGA1.jpg',
      descriptionEn: 'Yellow Zucchinis',
      descriptionAr: 'حزمة فراغ',
      discount: 13,
      price: 10.5,
      rate: 1.0,
      rateNum: 1,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'ذرة حلوة مشوية',
      nameEn: 'Green Zucchinis',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_BERRAAEDR125L1_20211222171809.jpg',
      descriptionEn: 'Grilled Sweet corns',
      descriptionAr: 'ذرة حلوة مشوية',
      discount: 30,
      price: 25,
      rate: 3.2,
      rateNum: 1,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'ذرة حلو',
      nameEn: 'Marrows',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_MARGRAEXXPOTL1_20211226152806.jpg',
      descriptionEn: 'Sweet Corn',
      descriptionAr: 'ذرة حلو',
      discount: 51,
      price: 50,
      rate: 3.5,
      rateNum: 2,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'البازلاء الثلوج',
      nameEn: 'Broccoli Mix Stirfry',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/brogrkexx200a1_270095.jpg',
      descriptionEn: 'Broccoli Mix Stirfry',
      descriptionAr: 'البازلاء الثلوج',
      discount: 12,
      price: 10,
      rate: 4.5,
      rateNum: 2,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'البازلاء الثلوج',
      nameEn: 'Butternut Cubes',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/PUMBCAEBP500L1.jpg',
      descriptionEn: 'Butternut Cubes',
      descriptionAr: 'البازلاء الثلوج',
      discount: 41,
      price: 39,
      rate: 4.7,
      rateNum: 2,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'البازلاء الثلوج',
      nameEn: 'Gem Squashes',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/brogrkexx200a1_270095.jpg',
      descriptionEn: 'Gem Squashes',
      descriptionAr: 'البازلاء الثلوج',
      discount: 18,
      price: 16,
      rate: 3.7,
      rateNum: 2,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameAr: 'البازلاء الثلوج',
      nameEn: 'Ratte Potatoes',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_POTRANLXX5KGA1_20221208104410.jpg',
      descriptionEn: 'Ratte Potatoes',
      descriptionAr: 'البازلاء الثلوج',
      discount: 80,
      price: 75,
      rate: 4.5,
      rateNum: 2,
      typeAr: 'خضار',
      typeEn: 'vegetable',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    mPrint('productModel = $productModel');

    ///endregion single category

    ///region single category
    categoryModel = CategoryModel(
        shopID: shopModel.id,
        name: 'Fruits',
        type: 'fruits',
        image:
            'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_MELDSKEXX1XXA1_20210502044206.jpg');
    await FirebaseHandler.saveCategory(categoryModel);

    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Watermelons',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/melwagcxxkgsl1_164982.jpg',
      descriptionEn: 'Apples & Pears',
      discount: 55,
      price: 50,
      rate: 1.5,
      rateNum: 2,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Orange Candy Melon',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_MELOCAUXX13KA1_20230410105740.jpg',
      descriptionEn: 'Orange Candy Melon',
      discount: 19.95,
      price: 22,
      rate: 3.2,
      rateNum: 1,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Sugar Crisp Grapes',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/HPL_GRACRAUXX09KL1_20230411141047.jpg',
      descriptionEn: 'Sugar Crisp Grapes',
      discount: 45,
      price: 50,
      rate: 2.9,
      rateNum: 3,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);
    productModel = ProductModel(
      categoryID: categoryModel.id,
      shopID: shopModel.id,
      nameEn: 'Palmer Mangoes',
      image:
          'https://kibsecomimgstore.blob.core.windows.net/products/display/mgoxxbrrt6kga1_953290.jpg',
      descriptionEn: 'Palmer Mangoes',
      discount: 9.50,
      price: 10,
      rate: 3.8,
      rateNum: 3,
      typeAr: 'فواكه',
      typeEn: 'fruits',
    );
    await FirebaseHandler.saveProduct(shopModel.id!, productModel);

    ///endregion single category
  }
}
