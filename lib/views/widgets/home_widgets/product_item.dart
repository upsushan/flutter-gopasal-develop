import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopasal/helpers/dialog_provider.dart';
import 'package:gopasal/models/product_model.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/widgets/common_widgets/quantity_selector_dialog.dart';
import 'package:gopasal/views/widgets/home_widgets/product_view_bottomsheet.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => ProductViewBottomSheet(),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
      ),
      child: Container(
        width: 155.0,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: kColorGrey3.withOpacity(0.5),
              offset: Offset(1.0, 0.5),
              blurRadius: 1.5,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),

                    _imgBuilder(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: kColorGrey5,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 5.0),
                      child: Text(
                        '400 g',
                        style: TextStyle(
                          fontSize: 11.3,
                          fontWeight: FontWeight.w900,
                          color: kColorLightBlack.withOpacity(0.7),
                          fontFamily: GoogleFonts.karla().fontFamily,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    _titleBuilder(),
                  ],
                ),
              ),
            ),
            _priceBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _imgBuilder() {
    return Image.asset(
      widget.product.imgUrl ?? '',
    );
  }

  Widget _titleBuilder() {
    return Text(
      '${widget.product.name}',
      style: TextStyle(
        fontWeight: FontWeight.w600,
       overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _priceBuilder() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Rs 88',
                      style: TextStyle(
                        fontSize: 11.0,
                        color: kColorGrey3,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: kColorYellow,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 5.0),
                      child: Text(
                        '-21%',
                        style: TextStyle(
                          fontSize: 11.3,
                          fontWeight: FontWeight.w900,
                          fontFamily: GoogleFonts.karla().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: [
                    Text(
                      'Rs ${widget.product.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                        color: kColorGreen,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Per kg',
                      style: TextStyle(
                        fontSize: 11.0,
                        color: kColorGrey3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _addBtnBuilder(),
        ],
      ),
    );
  }

  Widget _addBtnBuilder() {
    return GestureDetector(
      onTap: () async {
        await DialogProvider(context).showNormalDialog(
          widget: QuantitySelectorDialog(),
        );
        setState(() => _added = true);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
        decoration: BoxDecoration(
          color: _added ? kColorGreen : kColorGrey3,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Icon(
          _added ? Icons.check : Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
