



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? label;
  final String? hint;

  const CustomTextFieldWidget({
    Key? key,
    this.textEditingController,
    this.label,
    this.hint,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return _searchTextField();
  }

  Widget _searchTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(.1),
              offset: const Offset(0.0, 0.50),
              spreadRadius: 1,
              blurRadius: 1,
            )
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("$label",style: const TextStyle(fontSize: 18),),
          Scrollbar(
            child: TextFormField(
              style: const TextStyle(fontSize: 16),
              controller: textEditingController,
              maxLines: null,
              decoration:  InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 16),
                  hintText: hint),
            ),
          ),
        ],
      ),
    );
  }
}
