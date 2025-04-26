import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/color_util.dart';

Widget buildDropdownSearchField({
  required String hintText,
  required List<String> items,
  required TextEditingController controller,
  required bool validation,
}) {
  return Padding(
    padding: const EdgeInsets.all(4),
    child: SizedBox(
      height: 55,
      width: double.infinity,
      child:DropdownSearch<String>(
        items: items,
        selectedItem: controller.text.isNotEmpty ? controller.text : null,
        onChanged: (value) => controller.text = value ?? '',
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            hintText: hintText,
            labelText: hintText,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colorutils.userdetailcolor),
            ),
          ),
        ),
        popupProps: PopupProps.menu(
          showSearchBox: true,
          itemBuilder: (context, item, isSelected) => ListTile(
            title: Text(item),
          ),
          // Dynamically set height based on item count
          constraints: BoxConstraints(
            maxHeight: 250,
          ),
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: "Search $hintText",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(
                    "assets/images/MagnifyingGlass.svg",
                    color: Colorutils.userdetailcolor,
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colorutils.userdetailcolor),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        validator: validation
            ? (val) => val == null || val.trim().isEmpty
            ? 'Please select $hintText'
            : null
            : null,
      )
    ),
  );
}