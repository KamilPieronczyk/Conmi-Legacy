import 'package:conmi/utils/Colors.dart';
import 'package:conmi/widgets/RoundedWhiteContainer.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';

class SingleEventTile extends StatelessWidget {
  const SingleEventTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 2 / 1,
            child: Container(
              child: ClipRRect(
                child: Image(
                  image: AssetImage('assets/images/lake.jpg'),
                  height: 260,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [Shadow.get()]),
            ),
          ),
          Positioned.fill(
            child: Align(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: RoundedWhiteContainer(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Column(
                      children: [
                        Text(
                          'Sep',
                          style: TextStyle(
                            color: ConmiColor().purple,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '20',
                          style: TextStyle(
                            color: ConmiColor().purple,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                 // opacity: 0.85,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
          ),
          Positioned.fill(
            child: Align(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: RoundedWhiteContainer(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/face5.jpg'),
                        ),
                        SizedBox(height: 2),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/face4.jpg'),
                        ),
                        SizedBox(height: 2),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/face3.jpg'),
                        ),
                        SizedBox(height: 2),
                        Container(
                            child: Align(
                              child: Text(
                                '+5',
                                style: TextStyle(
                                  color: ConmiColor().blackText,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              alignment: AlignmentDirectional.center,
                            ),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: ConmiColor().primary),
                              shape: BoxShape.circle,
                            )),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                 // opacity: 0.85,
                ),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
          Positioned.fill(
            child: Align(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                child: RoundedWhiteContainer(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                    child: Column(
                      children: [
                        Text(
                          'Wyjazd',
                          style: TextStyle(
                            color: ConmiColor().blackText,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Katowice, Sasanek',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                  //opacity: 0.85,
                ),
              ),
              alignment: Alignment.bottomLeft,
            ),
          ),
        ],
      ),
    );
  }
}
