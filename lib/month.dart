import 'package:flutter/material.dart';

class Month extends StatelessWidget {
  int _days = 31;
  int _num = 1;
  int _year = 2023;
  Month({super.key, int num = 1, int year = 2023}) {
    _days = dayCount(num, year);
    _num = num;
    _year = year;
  }
  bool isLeap(int year) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  int dayCount(int month, int year) {
    if (month == 2) {
      if (isLeap(year)) {
        return 29;
      } else {
        return 28;
      }
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
      return 30;
    } else {
      return 31;
    }
  }

  String monthName(int num) {
    switch (num) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'January';
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextStyle titles = TextStyle(
        fontSize: height * 0.025,
        fontWeight: FontWeight.bold,
        color: Colors.white);
    return Column(children: [
      Container(
          height: height * 0.15,
          width: width,
          color: Theme.of(context).primaryColor,
          child: Column(children: [
            SizedBox(height: height * 0.01),
            Center(
                child: Text(
              _year.toString(),
              style: titles,
              textAlign: TextAlign.center,
            )),
            Center(
                child: Text(
              monthName(_num),
              style: titles.copyWith(fontSize: height * 0.035),
              textAlign: TextAlign.center,
            )),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Sun', style: titles),
                Text('Mon', style: titles),
                Text('Tue', style: titles),
                Text('Wed', style: titles),
                Text('Thu', style: titles),
                Text('Fri', style: titles),
                Text('Sat', style: titles),
              ],
            )
          ])),
      SizedBox(
          height: height * 0.85,
          width: width,
          child: GridView.builder(
            itemCount: _days,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisExtent: height * 0.17,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}', // Replace with actual date for that day
                ),
              );
            },
          )),
    ]);
  }
}
