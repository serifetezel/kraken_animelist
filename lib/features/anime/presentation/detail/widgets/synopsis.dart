import 'package:flutter/material.dart';

class Synopsis extends StatefulWidget {
  final String synopsis;
  const Synopsis({super.key, required this.synopsis});

  @override
  State<Synopsis> createState() => _SynopsisState();
}

class _SynopsisState extends State<Synopsis> {
  int maxLines = 3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Text(
            widget.synopsis,
            maxLines: maxLines,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
          ),
          widget.synopsis.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: InkWell(
                    child: Text(
                      maxLines == 3 ? 'Show More' : 'Show Less',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    onTap: () {
                      setState(() {
                        maxLines = maxLines == 3 ? 100 : 3;
                      });
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
