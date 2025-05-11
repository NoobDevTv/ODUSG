import 'package:flutter/material.dart';
import 'package:odusg/events/tags.dart';

class ShowTags extends StatelessWidget {
  const ShowTags({super.key, required this.tags});

  final List<Tag> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...tags.map(
          (x) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: Chip(label: Text(x.tag)),
          ),
        ),
      ],
    );
  }
}
