import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import 'button.dart';

class ProductItem extends StatelessWidget {
 final Product product;

 ProductItem({required this.product});

//  @override
//  Widget build(BuildContext context) {
// //    return Card(
//       margin: EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           // Display the product image
//           Image.network(
//             product.imageUrl,
//             width: double.infinity, // Makes the image take the full width of the card
//             height: 200, // Specify a fixed height for the image
//             fit: BoxFit.fitHeight, // Cover the available space
//           ),
//           // Display the product name
//           Padding(
//             padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
//             child: Text(
//               product.name,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           // You can add more details here, such as price, description, etc.
//         ],
//       ),
//   //  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        // width: 100,
        // height: 200,
        child: Stack(
          alignment: Alignment(1.2, -1.2),
          children: [
            Card(
              color: Theme.of(context).colorScheme.secondary,
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                        'https://via.placeholder.com/150',
                        width: double.maxFinite,
                        fit: BoxFit.contain, // Cover the available space
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10 / 4, horizontal: 10),
                    child: Text(
                      product.name,
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "\$${product.price}",
                      style: TextStyle(fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ],
              ),
            ),
            HeartButton(),
          ],
        ),
      ),
    );
  }
 }

