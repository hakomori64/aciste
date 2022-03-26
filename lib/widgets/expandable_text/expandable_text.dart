import 'dart:math';

import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> with TickerProviderStateMixin<ExpandableText> {
  String text = '';
  bool isExpanded = false;
  bool canExpand = false;
  @override
  Widget build(BuildContext context) {
    canExpand = widget.text.isNotEmpty && (
      widget.text.length >= 150 ||
      '\n'.allMatches(widget.text).length > 3
    );
    text = canExpand
      ? (isExpanded ? widget.text : widget.text.substring(0, min(widget.text.length, 150)))
      : (widget.text);
    return canExpand ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          softWrap: true,
          overflow: TextOverflow.fade,
          maxLines: isExpanded ? null : 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: isExpanded
                ? TextButton(
                  onPressed: () => setState(() => isExpanded = false),
                  child: const Text('閉じる')
                )
                : TextButton(
                  onPressed: () => setState(() => isExpanded = true),
                  child: const Text('もっと見る')
                ),
            )
          ],
        )
      ],
    ) : Text(text);
  }
}