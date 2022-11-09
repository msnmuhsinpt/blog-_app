import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/model/blog_view_arg.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/constance.dart';
import '../../widget/app_text_view.dart';

class HomeMainCard extends StatelessWidget {
  HomeMainCard({
    super.key,
    required this.blogList,
  });

  List<BlogModel> blogList = [];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: blogList.length,
      physics: const ClampingScrollPhysics(),
      separatorBuilder: (context, index) => dividerH(),
      itemBuilder: (context, index) {
        //values
        var id = blogList[index].id;
        String title = blogList[index].tittle.toString();
        var imageUrl = blogList[index].image;
        var content = blogList[index].content;
        int blogLenght = blogList.length = 0;

        return blogLenght == 0
            ? Center(
                child: appTextView(
                    name: 'No Blog Added Please add blog',
                    isBold: true,
                    color: AppColor.kBlack),
              )
            : InkWell(
                onTap: (() => Navigator.pushNamed(
                      context,
                      '/blogView',
                      arguments: BlogModelArg(
                        id: id!.toInt(),
                        title: title,
                        imageUrl: imageUrl,
                        content: content,
                      ),
                    )),
                child: Container(
                  padding: commonPaddingLR,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: imageUrl != null
                            ? Image.file(imageUrl)
                            : Container(),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 10,
                        right: 10,
                        child: appTextView(
                            name: title,
                            isBold: true,
                            size: 18,
                            color: AppColor.kWhite,
                            maxLines: 2),
                      ),
                      dividerSH(),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
