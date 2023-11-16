import 'package:flutter/material.dart';
import 'package:flutter_layout/utils/my_colors.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: 244,
        width: 426,
        child: Column(
          children: [
            const SizedBox(height: 35),
            const Text(
              'Chose Payment Option',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 19),
            Container(
              height: 66,
              width: 326,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 232, 232),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  prefixIcon: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          'Phone Pay',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '0318-1687-XXXX',
                          style: TextStyle(
                            color: MyColor.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
              ),
            ),
            const SizedBox(height: 19),
            SizedBox(
              width: 258,
              height: 46,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF13640),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Process to Pay",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 29),
        child: SizedBox(
          height: 50,
          width: 50,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: ClipOval(
              child: Card(
                elevation: 5,
                shadowColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                surfaceTintColor: Colors.transparent,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      transform: GradientRotation(20),
                      colors: [
                        Color(0xFFF13640),
                        Color(0xFFBD2930),
                      ],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
