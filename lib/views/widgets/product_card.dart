import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String? imageUrl;
  final String placeHolderImage;
  final num averageRating;
  final num price;
  final bool isFavorite;
  final VoidCallback onFavoriteButtonClicked;
  const ProductCard({
    super.key,
    required this.productName,
    required this.imageUrl,
    this.placeHolderImage = "https://cdn-icons-png.flaticon.com/128/16878/16878840.png",
    required this.averageRating,
    required this.price,
    required this.isFavorite,
    required this.onFavoriteButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade50,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  imageUrl ?? placeHolderImage,
                  height: 142,
                  width: 142,
                ),
                const SizedBox(height: 16),
                Text(
                  productName,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                //rating indicator widget
                DecoratedBox(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.green.shade300),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "$averageRating",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "₹$price",
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                )
              ],
            ),

            //favorite icon
            Positioned(
              top: -3,
              right: -8,
              child: IconButton(
                  color: Colors.white,
                  splashColor: Colors.red.shade100,
                  onPressed: () {},
                  icon: isFavorite
                      ? reusableFavIcon(
                          Icons.favorite,
                          iconColor: Colors.red.shade400,
                        )
                      : reusableFavIcon(
                          Icons.favorite_border,
                          iconColor: Colors.blueGrey.shade300,
                        )),
            )
          ],
        ),
      ),
    );
  }

  Widget reusableFavIcon(IconData icon, {required Color iconColor}) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon, color: iconColor));
  }
}
