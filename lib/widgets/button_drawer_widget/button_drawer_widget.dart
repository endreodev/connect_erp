import 'package:flutter/material.dart';

class ButtonDrawerWidget extends StatelessWidget {
  final String selected;
  final List<String> list;
  final String? Function(String?)? onChanged;

  const ButtonDrawerWidget({
    Key? key,
    required this.list,
    required this.selected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        // value: dropdownValue,
        icon: const Icon(Icons.arrow_downward, color: Colors.white),
        isExpanded: true,
        underline: Container(),
        style: const TextStyle(color: Colors.white, fontSize: 18),
        hint: Center(
            child: Text(
          selected,
          style: TextStyle(color: Colors.white),
        )),
        onChanged: onChanged,
        // onChanged: (String? newValue) {
        //   setState(() {
        //     selected = newValue!;
        //   });
        // },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          );
        }).toList(),
        selectedItemBuilder: (BuildContext context) => list
            .map((e) => Center(
                  child: Text(
                    e,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
