import 'dart:developer';
import 'dart:io';
import 'package:blog_app/blocs/bloc_explore.dart';
import 'package:blog_app/core/app_colors.dart';
import 'package:blog_app/core/constance.dart';
import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/ui/widget/app_app_bar.dart';
import 'package:blog_app/ui/widget/app_text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  //image
  late File imageFile = File("");
  final picker = ImagePicker();

  List<BlogModel> blogList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titile: 'Create Blog'),
      body: ListView(
        shrinkWrap: true,
        children: [
          //add tittle
          dividerH(),
          Padding(
            padding: commonPaddingLR,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  maxLength: 50,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Enter title here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.startsWith(" ")) {
                      return 'This field cannot be empty';
                    }
                    return null;
                  },
                ),
                //add content
                TextFormField(
                  controller: contentController,
                  maxLength: 1000,
                  maxLines: 15,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Write your blog here...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.startsWith(" ")) {
                      return 'This field cannot be empty';
                    }
                    return null;
                  },
                ),
                // add image

                InkWell(
                  child: Card(
                    elevation: 10,
                    child: SizedBox(
                      width: 250,
                      height: 100,
                      child: imageFile.path.length > 10
                          ? Image.file(imageFile)
                          : const Icon(Icons.add_photo_alternate_rounded),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Camera'),
                              onTap: () async {
                                Navigator.pop(ctx);
                                final pickedFile =
                                    await ImagePicker.platform.pickImage(
                                  source: ImageSource.camera,
                                  imageQuality: 40,
                                  maxHeight: 200,
                                  maxWidth: double.infinity,
                                );
                                if (pickedFile != null) {
                                  setState(() {
                                    imageFile = File(pickedFile.path);
                                  });
                                }
                              },
                            ),
                            const Divider(height: 1),
                            ListTile(
                              leading: const Icon(Icons.photo),
                              title: const Text('Gallery'),
                              onTap: () async {
                                Navigator.pop(ctx);
                                final pickedFile = await ImagePicker.platform
                                    .pickImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 40,
                                        maxHeight: 200,
                                        maxWidth: double.infinity);
                                if (pickedFile != null) {
                                  setState(() {
                                    imageFile = File(pickedFile.path);
                                  });
                                }
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                dividerSH(),
                //submit button
                SizedBox(
                  width: screenWidth(context) - 20,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () {

                      log("ListLength>>>>>${blogList.length}");
                      if (imageFile.path.length < 10) {
                        EasyLoading.show(status: 'Add Image');
                      } else {
                        EasyLoading.dismiss();
                        var blog = BlogModel(
                          id: blogList.length + 1,
                          tittle: titleController.text.toString(),
                          content: contentController.text.toString(),
                          image: imageFile,
                        );

                        context.read<BlogBloc>().add(AddBlog(blogModel: blog));
                        Navigator.pop(context);
                      }
                    },
                    child: appTextView(
                        name: 'submit', isBold: true, size: 17, color: kWhite),
                  ),
                ),
                dividerSH(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
