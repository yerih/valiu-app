


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../atomics/CardHome.dart';
import '../styles/StyleText.dart';

class HomeContent extends StatefulWidget{
  const HomeContent({super.key, this.onTapBurgerBtn});
  final VoidCallback? onTapBurgerBtn;
  @override
  State<StatefulWidget> createState() => _HomeContentState();
}


class _HomeContentState extends State<HomeContent>{

  final ScrollController _scrollController = ScrollController();
  bool _isShownBurgerBtn = true;
  final double _scrollThreshold = 10;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    _scrollController.addListener(() {
      final shouldShow = _scrollController.offset <= _scrollThreshold;
      if (_isShownBurgerBtn != shouldShow) {
        setState(() => _isShownBurgerBtn = shouldShow);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            leading: _isShownBurgerBtn ? IconButton(
                onPressed: widget.onTapBurgerBtn,
                icon: const Icon(Icons.menu, color: Colors.white)
            ):Container(),
            pinned: true,
            expandedHeight: 400,
            backgroundColor: Colors.black,
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Featured', style: textDrawerItem),
                      Container(
                        margin: const EdgeInsets.only(top: 4.0),
                        height: 3.0,
                        width: 60, // Adjust width as needed
                        decoration: BoxDecoration(
                          color: Colors.white, // Or your preferred color
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  centerTitle: false,
                  titlePadding: const EdgeInsets.only(left: 20),
                  collapseMode: CollapseMode.parallax,
                  background: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image(
                      image: AssetImage('assets/images/home_bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.9,
                ),
                delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return CardHome(
                        title: 'Title $index',
                        subtitle: 'Subtitle $index',
                        year: '2023',
                        index: index,
                        onTap: () => {},
                      );
                    },
                    childCount: 10
                ),
              )
          )
        ],
      ),
    );
  }
}


