
import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/organims/SideMenu.dart';
import '../organims/CustomDrawer.dart';
import 'HomeContent.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;
  bool isSideMenuClosed = true;

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener((){setState(() {});});

    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn)
    );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn)
    );

  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedPositioned(
            width: 288,
            left: isSideMenuClosed ? -288:0,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            child: SideMenu(),
          ),
          
          Transform.translate(
              offset: Offset(animation.value*288,0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: HomeContent(
                    onTapBurgerBtn: () => setState(() {
                      isSideMenuClosed = !isSideMenuClosed;
                      isSideMenuClosed ? _animationController.reverse() : _animationController.forward();
                    }),
                  ),
                ),
              )
          )
        ],
      )
    );
  }
}
