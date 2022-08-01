import 'dart:ui';

const Color color1 = Color(0xFFF7DB5F);
const Color color2 = Color(0xFFEBEBEB);

class Order {
  String address;
  String distance;
  String time;
  int pickPoints;
  int deliveryPoints;

  Order({
    required this.address,
    required this.distance,
    required this.time,
    required this.pickPoints,
    required this.deliveryPoints,
  });
}

var orders = [
  Order(address: "No - 23, Boulverd Court Street, XCV", distance: "150 m", time: "0h 20m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 123, Second Court Street, FDSER", distance: "180 m", time: "1h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 343, Bay Street, XVXSZ", distance: "195 m", time: "2h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 5, King Court Street, XVZ", distance: "200 m", time: "3h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 3, EverBroad Street, XVZ", distance: "220 m", time: "4h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 323, Graas land Street, XVZ", distance: "230 m", time: "5h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 54, Mount Street, XVZ", distance: "250 m", time: "6h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 78, Avenue Court Street, XVZ", distance: "260 m", time: "7h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 90, Kings Court Street, XVZ", distance: "280 m", time: "8h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 34, Kings Court Street, XVZ", distance: "290 m", time: "9h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 65, Kings Court Street, XVZ", distance: "300 m", time: "9h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 62, Kings Court Street, XVZ", distance: "250 m", time: "9h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 23, Kings Court Street, XVZ", distance: "250 m", time: "9h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 23, Kings Court Street, XVZ", distance: "250 m", time: "9h 15m", pickPoints: 2, deliveryPoints: 4),
  Order(address: "No - 23, Kings Court Street, XVZ", distance: "250 m", time: "9h 15m", pickPoints: 2, deliveryPoints: 4),
];