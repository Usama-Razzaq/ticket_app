import 'package:flutter/material.dart';
import 'package:ticket_app/app_routes.dart';
import 'package:ticket_app/res/styles/app_styles.dart';
import 'package:ticket_app/utills/all_json.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Hotels'),
        centerTitle: true,
        backgroundColor: AppStyles.bgColor,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.9,

              ),
                itemCount: hotelList.length,
              itemBuilder: (context, index){
                var singleHotel = hotelList[index];
                return HotelGridView(hotel: singleHotel);
              }),
        ),
      ),
    );
  }
}



// Changes for all hotel grid view

class HotelGridView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelGridView({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.hotelDetail);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 8),
        // width: size.width * 0.6,
        height: 350,
        decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/${hotel['image']}"),
                    )),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                hotel['place'],
                style:
                AppStyles.headLineStyle3.copyWith(color: AppStyles.kakiColor),
              ),
            ),
      
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    hotel['destination'],
                    style: AppStyles.headLineStyle4.copyWith(color: Colors.white),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      '\$${hotel['price']}/night',
                      style:
                      AppStyles.headLineStyle4.copyWith(color: AppStyles.kakiColor),
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

