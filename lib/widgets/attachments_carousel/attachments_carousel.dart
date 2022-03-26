import 'package:aciste/models/attachment.dart';
import 'package:aciste/widgets/attachment_overview/attachment_overview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class AttachmentsCarousel extends StatefulWidget {
  final List<AsyncValue<Attachment>> attachments;
  final double height;
  final double width;
  final Color selectedIndicatorColor;
  final Color indicatorColor;
  final BoxFit fit;

  const AttachmentsCarousel({
    Key? key,
    required this.attachments,
    required this.height,
    required this.width,
    this.selectedIndicatorColor = Colors.black,
    this.indicatorColor = Colors.black26,
    this.fit = BoxFit.fitHeight,
  }) : super(key: key);

  @override
  State<AttachmentsCarousel> createState() => _AttachmentsCarouselState();
}

class _AttachmentsCarouselState extends State<AttachmentsCarousel> {
  late PageController pageController;
  int activePage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8, initialPage: activePage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: PageView.builder(
            itemCount: widget.attachments.length,
            pageSnapping: true,
            controller: pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              bool active = pagePosition == activePage;
              return slider(widget.attachments, pagePosition, active, widget.fit);
            }
          ),
        ),
        if (widget.attachments.length >= 2) Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(widget.attachments.length, activePage)
          ,
        )
      ],
    );
  }

  List<Widget> indicators(int length, int currentIndex) {
    return  List<Widget>.generate(length, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: currentIndex == index ? widget.selectedIndicatorColor : widget.indicatorColor,
          shape: BoxShape.circle
        ),
      );
    });
  }

  AnimatedContainer slider(List<AsyncValue<Attachment>> attachments, pagePosition, active, fit) {
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: AttachmentOverview(attachment: attachments[pagePosition], fit: fit)
    );
  }
}