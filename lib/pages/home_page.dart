import 'dart:convert';

import 'package:config/models/product_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import '../models/container_model.dart';
import '../widgets/autumn_widget.dart';
import '../widgets/spring_widget.dart';
import '../widgets/summer_widget.dart';
import '../widgets/winter_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String theme = "";
  bool isLoading = false;
  ContainerModel containerModel = ContainerModel();
  List<ProductModel> productModel = [];
  Map<String, Widget> background = {
    "winter": const WinterWidget(),
    "spring": const SpringWidget(),
    "summer": const SummerWidget(),
    "autumn": const AutumnWidget()
  };
  Map<String, Color> backgroundColors = {
    "winter": Colors.white,
    "spring": Colors.amberAccent,
    "summer": Colors.transparent,
    "autumn": Colors.deepOrange
  };
  final config = FirebaseRemoteConfig.instance;

  Future<void> fetchData() async {
    isLoading = true;
    setState(() {});
    config.setDefaults({
      "background": "summer",
      "container": jsonEncode({
        "height": 300.0,
        "width": 150.0,
        "borderRadius": 15.0,
        "flexPhoto": 5,
        "flexText": 5,
        "text": "Victus"
      }),
      "products": jsonEncode(
          [
            {
              "name": "Dell XPS 13",
              "price": 999.99,
              "RAM": "16GB",
              "storage": "512GB SSD",
              "videoCard": "Intel Iris Xe"
            },
            {
              "name": "Apple MacBook Pro 14",
              "price": 1999.99,
              "RAM": "16GB",
              "storage": "1TB SSD",
              "videoCard": "Apple M1 Pro"
            },
            {
              "name": "HP Spectre x360",
              "price": 1299.99,
              "RAM": "16GB",
              "storage": "1TB SSD",
              "videoCard": "Intel Iris Xe"
            },
            {
              "name": "Lenovo ThinkPad X1 Carbon",
              "price": 1499.99,
              "RAM": "16GB",
              "storage": "512GB SSD",
              "videoCard": "Intel Iris Xe"
            },
            {
              "name": "Asus ROG Zephyrus G14",
              "price": 1449.99,
              "RAM": "16GB",
              "storage": "1TB SSD",
              "videoCard": "NVIDIA GeForce RTX 3060"
            },
            {
              "name": "Microsoft Surface Laptop 4",
              "price": 1299.99,
              "RAM": "16GB",
              "storage": "512GB SSD",
              "videoCard": "Intel Iris Xe"
            },
            {
              "name": "Acer Predator Helios 300",
              "price": 1199.99,
              "RAM": "16GB",
              "storage": "512GB SSD",
              "videoCard": "NVIDIA GeForce RTX 3060"
            },
            {
              "name": "Razer Blade 15",
              "price": 2599.99,
              "RAM": "32GB",
              "storage": "1TB SSD",
              "videoCard": "NVIDIA GeForce RTX 3070"
            },
            {
              "name": "Gigabyte Aero 15",
              "price": 1999.99,
              "RAM": "16GB",
              "storage": "1TB SSD",
              "videoCard": "NVIDIA GeForce RTX 3060"
            },
            {
              "name": "MSI GS66 Stealth",
              "price": 2299.99,
              "RAM": "32GB",
              "storage": "1TB SSD",
              "videoCard": "NVIDIA GeForce RTX 3070"
            }
          ]
      )
    });

    await activateData();

    config.onConfigUpdated.listen((changes) async {
      await activateData();
    });

    isLoading = false;
    setState(() {});
  }

  Future<void> activateData() async {
    await config.fetchAndActivate();
    theme = config.getString("background");
    containerModel = containerModelFromJson(config.getString("container"));
    productModel = productModelFromJson(config.getString("products"));

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Shopping",
          style: TextStyle(
            fontSize: 28
          ),
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        backgroundColor: backgroundColors[theme],
      ),
      body: Stack(
        children: [
          isLoading ? const Center(child: CircularProgressIndicator()) : background[theme]!,

          ContainerGrid(
            containerModel: containerModel,
            productModel: productModel,
          ),
        ],
      ),
    );
  }
}

class ContainerGrid extends StatelessWidget {
  final ContainerModel containerModel;
  final List<ProductModel> productModel;

  const ContainerGrid({super.key, required this.containerModel, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: ValueKey(containerModel.height),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (_, __) {
        return SingleChildScrollView(
          child: Container(
            height: 360,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(containerModel.borderRadius ?? 15),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: containerModel.flexPhoto ?? 5,
                  child: Image.asset(productModel[__].imageUrl!),
                ),
                Expanded(
                  flex: containerModel.flexText ?? 5,
                  child: Column(
                    children: [
                      Text(
                        productModel[__].name!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 3),

                      Text(
                        "${productModel[__].price!}\$",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,

                      ),

                      const SizedBox(height: 3),

                      Text(
                        productModel[__].ram.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,

                      ),

                      const SizedBox(height: 3),

                      Text(
                        "${productModel[__].storage!}GB",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,

                      ),

                      const SizedBox(height: 3),

                      Text(
                        "${productModel[__].videoCard!} video card",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: productModel.length,
    );
  }
}
