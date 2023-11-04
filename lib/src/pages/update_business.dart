import 'package:flutter/material.dart';
import 'package:tiger_loyalty/src/pages/customers.dart';
import 'package:tiger_loyalty/src/pages/give_reward.dart';
import 'package:tiger_loyalty/src/pages/profile.dart';
import 'styles.dart';

class UpdateBusiness extends StatefulWidget {
  final String name;

  UpdateBusiness({required this.name});

  @override
  _UpdateBusinessState createState() => _UpdateBusinessState(name: name);
}

class _UpdateBusinessState extends State<UpdateBusiness> {
  List<String> businessCategories = [
    'Business category',
    'Bakery',
    'Bar',
    'Beauty',
    'Bookstore',
    'Butcheries',
    'Coffee Shops',
    'Cosmetics',
    'Decor',
    'Electronics',
    'Fashion',
    'Fast Food',
    'Florists',
    'Groceries',
    'Gym',
    'Hotel',
    'Laundry',
    'Liquor Stores',
    'Pets',
    'Pharmacies',
    'Resort',
    'Restaurant',
    'Saloon',
    'Shopping',
    'Spa',
    'Supermarkets',
    'Travel',
    'Yoga'
  ];

  String selectedCategory = 'Business category';

  final String name;

  _UpdateBusinessState({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 30),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset('assets/chevron_left.png'),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Image.asset('assets/update_business.png'),
                            SizedBox(height: 15),
                            Text('Update Business Details', style: label),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 5.0, left: 15.0, right: 15.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFF5F5F5)),
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '$name',
                              hintStyle: TextStyle(color: Color(0xFF808080)),
                              border: InputBorder.none,
                            ),
                            style: textFieldStyle,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 5.0, left: 15.0, right: 15.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFF5F5F5)),
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '123-344-232',
                              hintStyle: TextStyle(color: Color(0xFF808080)),
                              border: InputBorder.none,
                            ),
                            style: textFieldStyle,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 20.0, left: 15.0, right: 15.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFF5F5F5)),
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: double.infinity,
                            child: Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedCategory,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedCategory = newValue ?? '';
                                    });
                                  },
                                  items: businessCategories.map((category) {
                                    return DropdownMenuItem<String>(
                                      value: category,
                                      child: Text(
                                        category,
                                        style: const TextStyle(
                                            color: Color(0XFF808080)),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextButton(
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => CreateReward(),
                            //   ),
                            // );
                          },
                          style: btnGold2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                'Update',
                                style: btnGoldText2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
