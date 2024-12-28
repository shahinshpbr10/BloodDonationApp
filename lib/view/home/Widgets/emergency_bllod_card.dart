import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../common/apptextstyle.dart';

class EmergencyBloodCarousel extends StatefulWidget {
  const EmergencyBloodCarousel({Key? key}) : super(key: key);

  @override
  _EmergencyBloodCarouselState createState() => _EmergencyBloodCarouselState();
}

class _EmergencyBloodCarouselState extends State<EmergencyBloodCarousel> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _carouselItems = [
    {
      'avatarUrl': 'https://via.placeholder.com/40',
      'patientName': 'Naznin Sonia',
      'time': '10:45 PM',
      'message': 'Required B unit O -ve blood at Alpha Perinthalmanna.',
    },
    {
      'avatarUrl': 'https://via.placeholder.com/40',
      'patientName': 'John Doe',
      'time': '9:30 AM',
      'message': 'Urgent: A+ve blood needed at, Malappuram.',
    },
    {
      'avatarUrl': 'https://via.placeholder.com/40',
      'patientName': 'Jane Smith',
      'time': '5:15 PM',
      'message': 'O+ve blood required at Center, Kozhikode.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _carouselItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: 350, // Set the width here
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(item['avatarUrl']),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item['patientName'],
                                      style:  AppTextStyles.bodyText.copyWith(
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ), Text(
                                      item['time'],
                                      style: AppTextStyles.smallBodyText.copyWith(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item['message'],
                        style:  AppTextStyles.smallBodyText.copyWith(fontSize: 16),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child:  Text(
                                'Accept',
                                style: AppTextStyles.smallBodyText.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(width:40,
                            decoration:BoxDecoration(color:Colors.grey.withOpacity(0.2),shape:BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(Icons.share_outlined),
                              onPressed: () {},
                            ),
                          ),SizedBox(width: 5,),
                          Container(width:40,
                            decoration:BoxDecoration(color:Colors.grey.withOpacity(0.2),shape:BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            enlargeFactor: 0.2,
            height: 220,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1, // Set to show 80% of the card (increasing it reduces card width)
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _carouselItems.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => setState(() {
                _currentIndex = entry.key;
              }),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                      .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
