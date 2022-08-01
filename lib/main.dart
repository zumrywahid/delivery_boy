import 'package:delivery_boy/AppUtil.dart';
import 'package:delivery_boy/OrderDetailsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Tajawal",
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Today's jobs",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Tajawal')
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: () {

              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 300,
                      child: const Center(
                        child: Text("Oops! No notifications found",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black38,
                                fontFamily: 'Tajawal'
                            )
                        ),
                      ),
                    );
                  });
            },
            child: const Icon(
              Icons.notifications,
            ),
          ),
          Padding(padding: EdgeInsets.all(5))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: color1,
              ),
              child: Text(''),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Office'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xFFF5F4F5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                MaterialButton(
                  minWidth: (MediaQuery.of(context).size.width - 30) / 3,
                  color: color1,
                  elevation: 1,
                  onPressed: () {},
                  child: const Text("Pending"),
                ),
                MaterialButton(
                  minWidth: (MediaQuery.of(context).size.width - 30) / 3,
                  color: color2,
                  elevation: 1,
                  onPressed: () {},
                  child: const Text("Accepted"),
                ),
                MaterialButton(
                  minWidth: (MediaQuery.of(context).size.width - 30) / 3,
                  color: color2,
                  elevation: 1,
                  onPressed: () {},
                  child: const Text("Rejected"),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.separated(
                itemCount: orders.length,
                padding: const EdgeInsets.all(10),
                separatorBuilder: (ctx, index) => const Divider(height: 10, color: Colors.white),
                itemBuilder: (context, index) {
                  return RowItem(order: orders[index]);
                },
            ))
          ],
        ),
      ),
    );
  }
}


class RowItem extends StatefulWidget {
  final Order order;
  const RowItem({Key? key, required this.order}) : super(key: key);

  @override
  State<RowItem> createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OrderDetailsPage()),
        );
      },
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: color1,
                        ),
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.location_on, color: Colors.white,size: 20),
                      ),
                    ),
                    const SizedBox(height: 3,),
                    Text(widget.order.distance,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontFamily: 'Tajawal'
                        )
                    )
                  ],

                ),
                SizedBox(width: 10,),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Pickup point",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black38,
                            fontFamily: 'Tajawal'
                        )
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 45,
                      child: Text(widget.order.address,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Tajawal'
                          )
                      ),
                    )
                  ],

                )

              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Time",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black38,
                            fontFamily: 'Tajawal'
                        )
                    ),
                    const SizedBox(height: 8,),
                    Text(widget.order.time,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Tajawal'
                        )
                    )
                  ],
                ),
                SizedBox(width: 20,),
                Container(
                  width: 0.5,
                  height: 50,
                  color: Colors.black54,
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Pickup points",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black38,
                            fontFamily: 'Tajawal'
                        )
                    ),
                    const SizedBox(height: 8,),
                    Text("${widget.order.pickPoints}",
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Tajawal'
                        )
                    )
                  ],
                ),
                SizedBox(width: 20,),
                Container(
                  width: 0.5,
                  height: 50,
                  color: Colors.black54,
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Delivery points",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black38,
                            fontFamily: 'Tajawal'
                        )
                    ),
                    const SizedBox(height: 8,),
                    Text("${widget.order.deliveryPoints}",
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Tajawal'
                        )
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
