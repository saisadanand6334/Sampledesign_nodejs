import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renting_car/screen/detail_cars/detail_cars.dart';

class Carbm extends StatelessWidget {
  const Carbm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [

          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, spreadRadius: 0.5, blurRadius: 15)
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "B M W 640 d",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "2022",
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500),
                          children: const <TextSpan>[
                            TextSpan(text: '\₹10,000'),
                            TextSpan(
                                text: '/day',
                                style: TextStyle(color: Colors.black38)),
                          ],
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailCars()));
                          },
                          child: Text(
                            "Details",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400, fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(
                "assets/images/bmw1.jpeg",
                width: 150,
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}