import 'package:flutter/material.dart';

class AddNew extends StatelessWidget {
  const AddNew({Key? key}) : super(key: key);

  final thisLabelStyle = const TextStyle(fontSize: 12);

  final thisFormTextStyle = const TextStyle(fontSize: 12);

  final thisFieldStyle = const InputDecoration(
      border: OutlineInputBorder(),
      isDense: true,
      // isCollapsed: true,
      hintText: 'Owner\'s Name:',
      constraints: BoxConstraints(maxWidth: 320),
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text('Owner\'s Name:', style: thisLabelStyle),
              const SizedBox(
                width: 16,
              ),
              TextFormField(
                  style: thisFormTextStyle, decoration: thisFieldStyle)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text('Owner\'s Name:', style: thisLabelStyle),
              const SizedBox(
                width: 16,
              ),
              TextFormField(
                  style: thisFormTextStyle, decoration: thisFieldStyle)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text('Owner\'s Name:', style: thisLabelStyle),
              const SizedBox(
                width: 16,
              ),
              TextFormField(
                  style: thisFormTextStyle, decoration: thisFieldStyle)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text('Owner\'s Name:', style: thisLabelStyle),
              const SizedBox(
                width: 16,
              ),
              TextFormField(
                  style: thisFormTextStyle, decoration: thisFieldStyle)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text('Owner\'s Name:', style: thisLabelStyle),
              const SizedBox(
                width: 16,
              ),
              TextFormField(
                  style: thisFormTextStyle, decoration: thisFieldStyle)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text('Owner\'s Name:', style: thisLabelStyle),
              const SizedBox(
                width: 16,
              ),
              TextFormField(
                  style: thisFormTextStyle, decoration: thisFieldStyle)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text('Owner\'s Name:', style: thisLabelStyle),
              const SizedBox(
                width: 16,
              ),
              TextFormField(
                  style: thisFormTextStyle, decoration: thisFieldStyle)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text('Owner\'s Name:', style: thisLabelStyle),
              const SizedBox(
                width: 16,
              ),
              TextFormField(
                  style: thisFormTextStyle, decoration: thisFieldStyle)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text('Owner\'s Name:', style: thisLabelStyle),
              const SizedBox(
                width: 16,
              ),
              TextFormField(
                  style: thisFormTextStyle, decoration: thisFieldStyle)
            ],
          ),
        ],
      ),
    );
  }
}
