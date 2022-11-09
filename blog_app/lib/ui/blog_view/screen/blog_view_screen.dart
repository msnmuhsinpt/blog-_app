import 'package:blog_app/core/constance.dart';
import 'package:blog_app/ui/widget/app_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../widget/app_text_view.dart';

class BlogViewScreen extends StatefulWidget {
  final String id;
  final String title;
  final String content;
  final dynamic imageUrl;

  const BlogViewScreen(
    this.id,
    this.title,
    this.imageUrl,
    this.content, {
    super.key,
  });

  @override
  State<BlogViewScreen> createState() => _BlogViewScreenState();
}

class _BlogViewScreenState extends State<BlogViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //common appBar
      appBar: const AppAppBar(
        titile: 'Blog View',
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: widget.imageUrl != null
                      ? Image.file(widget.imageUrl)
                      : Container(),
                ),
                dividerSH(),
                appTextView(
                    name: widget.title, isBold: true, size: 18, maxLines: 2),
                dividerSH(),
                appTextView(name: widget.content, maxLines: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.kBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/blogAdd');
                        },
                        child: appTextView(
                            name: 'Edit', isBold: true, color: AppColor.kWhite),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.kRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: appTextView(
                            name: 'Delete', isBold: true, color: AppColor.kWhite),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
