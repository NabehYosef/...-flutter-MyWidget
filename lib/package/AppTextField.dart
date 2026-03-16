import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isReadOnly;
  final List<String> datalist;

  const AppTextField({
    super.key,
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.datalist,
    this.isReadOnly = true,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  void openListDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(widget.title),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.datalist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.datalist[index]),
                  onTap: () {
                    widget.textEditingController.text = widget.datalist[index];
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.textEditingController,
          readOnly: widget.isReadOnly,
          cursorColor: Colors.black,
          onTap: () {
            FocusScope.of(context).unfocus();
            openListDialog();
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            hintText: widget.hint,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
