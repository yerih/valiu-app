
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/PreacherModel.dart';
import '../atomics/SocialNetworkBtn.dart';
import '../styles/StyleText.dart';

class PreacherScreen extends StatefulWidget {
  const PreacherScreen({super.key, required this.preacher, this.onTapItem});
  final void Function(PreacherModel preacher)? onTapItem;
  final PreacherModel preacher;

  @override
  State<StatefulWidget> createState() => _PreacherScreenState();
}

class _PreacherScreenState extends State<PreacherScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final PreacherModel preacher = widget.preacher;
    return Builder(
      builder:
          (context) => Material(
            child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
            SliverAppBar(
              automaticallyImplyLeading: true,
              pinned: true,
              expandedHeight: 300,
              backgroundColor: Colors.black,
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                    centerTitle: false,
                    titlePadding: const EdgeInsets.only(left: 20),
                    collapseMode: CollapseMode.parallax,
                    background: Container(
                      color: Colors.white,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(40),),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(preacher.image),
                                fit: BoxFit.cover
                            )
                          )
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),


            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(preacher.name, style: StyleText.titleDetail()),
                        SizedBox(height: 20),

                        Padding(padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(preacher.bio, style: StyleText.textDetail()),
                                SizedBox(height: 15),
                              ]
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(preacher.socialNetworks.web != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SocialButton(
                                    icon: Icons.language,
                                    onPressed: () async {
                                      final Uri url = Uri.parse(preacher.socialNetworks.web!);
                                      debugPrint('web: $url');
                                      if (await canLaunchUrl(url)) await launchUrl(url);
                                    }
                                ),
                              ),
                            if(preacher.socialNetworks.fb != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SocialButton(
                                  icon: Icons.facebook,
                                  onPressed: () async {
                                    final Uri url = Uri.parse(preacher.socialNetworks.fb!);
                                    debugPrint('facebook: $url');
                                    if (await canLaunchUrl(url)) await launchUrl(url);
                                  }
                                ),
                              ),
                            if(preacher.socialNetworks.ig != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SocialButton(
                                  icon: FontAwesomeIcons.instagram,
                                  onPressed: () async {
                                    final Uri url = Uri.parse(preacher.socialNetworks.ig!);
                                    debugPrint('ig: $url');
                                    if (await canLaunchUrl(url)) await launchUrl(url);
                                  }
                                ),
                              ),
                            if(preacher.socialNetworks.yt != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SocialButton(
                                  icon: FontAwesomeIcons.youtube,
                                  onPressed: () async {
                                    final Uri url = Uri.parse(preacher.socialNetworks.yt!);
                                    debugPrint('youtube: $url');
                                    if (await canLaunchUrl(url)) await launchUrl(url);
                                  }
                                ),
                              ),
                            if(preacher.socialNetworks.x != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SocialButton(
                                  icon: FontAwesomeIcons.xTwitter,
                                  onPressed: () async {
                                    final Uri url = Uri.parse(preacher.socialNetworks.x!);
                                    debugPrint('x: $url');
                                    if (await canLaunchUrl(url)) await launchUrl(url);
                                  }
                                ),
                              ),
                          ]
                        ),

                        SizedBox(height: 400,)
                      ]
                  ),
                ),
              ),
            ),
                    ],
                  ),
          ),
    );
  }
}





