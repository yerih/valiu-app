

import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/styles/StyleText.dart';

class CardHome extends StatefulWidget{
  final String? title;
  final String?  subtitle;
  final String? year;
  final String? image;
  final int? index;
  final VoidCallback? onTap;
  final double borderRadius;
  final List<BoxShadow>? shadow;

  const CardHome({
    this.title,
    this.subtitle,
    this.year,
    this.onTap,
    this.borderRadius = 8.0,
    this.image,
    this.shadow,
    this.index,
    super.key,
  });

  static String getImagePath(int index) {
    switch(index % 4) {
      case 0: return 'assets/images/card_home0.jpg';
      case 1: return 'assets/images/card_home1.jpg';
      case 2: return 'assets/images/card_home2.jpg';
      case 3: return 'assets/images/card_home3.jpg';
      default: return 'assets/images/default.jpg';
    }
  }

  @override
  State<StatefulWidget> createState() => _CardHomeState();

}

class _CardHomeState extends State<CardHome> with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {setState(() {_scale = 0.85;});}

  void _onTapUp(TapUpDetails details) {
      Future.delayed(Duration(milliseconds: 100), (){
        setState(() {
          _scale = 1.0;
        });
      });
  }

  void _onTapCancel() {setState(() {_scale = 1.0;});}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () => {},//widget.onTap?.call(),
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(seconds: 2),
        curve: Curves.bounceInOut,
        child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(CardHome.getImagePath(widget.index ?? 0)),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Title', style: textDrawerItem),
                        Text('Subtitle', style: textDrawerItem),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'year',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              // color: Colors.grey[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            )
      ),
    );
  }
}




