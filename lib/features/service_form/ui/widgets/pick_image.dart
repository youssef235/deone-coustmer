import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../theme/app_colors.dart';

class ImagesPicker extends StatefulWidget {
  const ImagesPicker({
    Key? key,
    required this.onImagePicked,
    this.isUserImage = false,
    this.canEdit = true,
  }) : super(key: key);

  final Function(List<XFile?>) onImagePicked;
  final bool isUserImage;
  final bool canEdit;

  @override
  State<ImagesPicker> createState() => _ImagesPickerState();
}

class _ImagesPickerState extends State<ImagesPicker> {
  List<XFile> pickedImages = [];

  Future pickImages(ImageSource source) async {
    ImagePicker pickerServiceCoverImage = ImagePicker();
    // pickerServiceCoverImage.pickImage(source:  ImageSource.camera);
    
    List<XFile> pickedFiles = pickedImages; 
    if(source == ImageSource.camera){
      XFile? image = await  pickerServiceCoverImage.pickImage(source:  ImageSource.camera); 
      if(image!=null) {
        // pickedFiles?? = [];
        pickedFiles.add(image);
        }
    }else{
      List<XFile> picked = await pickerServiceCoverImage.pickMultiImage(
    );
      if(picked !=null)
      pickedFiles+= picked;
    }
    if (pickedFiles != null) {
      setState(() {
        pickedImages = pickedFiles;
      });
      widget.onImagePicked(pickedImages);
    }
  }

  void deleteImage(int index) {
    setState(() {
      pickedImages.removeAt(index);
    });
    widget.onImagePicked(pickedImages);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60 ,//MediaQuery.of(context).size.height * 0.058,
            decoration: BoxDecoration(
              color: AppColors.blackGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                showModalBottomSheet(
                  
                  context: context,
                  builder: (context) =>
                  Container(
                    height: 100 ,
                    width: double.infinity,
                    child: Column(children: [
                      TextButton(
                        child: Text("الكاميرا" , style: TextStyle(color: AppColors.primaryColor),) ,
                        onPressed: (){
                            Navigator.of(context).pop();
                            // get image from gallery
                            pickImages(ImageSource.camera);
                        },
                      ),
                       TextButton(
                        child: Text("الاستوديو" , style: TextStyle(color: AppColors.primaryColor),) ,
                        onPressed: (){
                            Navigator.of(context).pop();
                            // get image from gallery
                            pickImages(ImageSource.gallery);
                        },
                      ),
                    ],),
                  )
                  //  CupertinoActionSheet(
                  //   actions: [
                  //     CupertinoActionSheetAction(
                  //       child: Text('Photo Gallery'),
                  //       onPressed: () {
                  //         // close the options modal
                         
                  //       },
                  //     ),
                  //     CupertinoActionSheetAction(
                  //       child: Text('Camera'),
                  //       onPressed: () {
                  //         // close the options modal
                  //         Navigator.of(context).pop();
                  //         // get image from camera
                  //         pickImages(ImageSource.camera);
                  //       },
                  //     ),
                  //   ],
                  // ),
               
               
                );
                

              },

              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'رفع الصور',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(
                    Icons.cloud_upload,
                    color: Colors.white, // Icon color
                  ),
                ],
              ),
            ),
          ),
   // SizedBox(height: 20,),
   //
   //        pickedImages.length> 0 ?
   //          Container(
   //            height: 120,
   //            decoration: BoxDecoration(
   //              borderRadius: BorderRadius.circular(20),
   //              border: Border.all(color: AppColors.grayWhite, width: 1),
   //            ),
   //            child: ListView.builder(
   //              scrollDirection: Axis.horizontal,
   //              itemBuilder: (BuildContext context, int index) {
   //                return Padding(
   //                  padding: const EdgeInsets.all(8.0),
   //                  child: Stack(
   //                    children: [
   //                      Container(
   //                        width: 100,  // Customize the width of the container as needed
   //                        height: 100,  // Customize the height of the container as needed
   //                        decoration: BoxDecoration(
   //                          borderRadius: BorderRadius.circular(20),  // Adjust the radius as needed for curved edges
   //                          border: Border.all(color: AppColors.primaryColor, width: 2),  // Customize border properties
   //                          image: DecorationImage(
   //                            image: pickedImages[index] != null
   //                                ? FileImage(File(pickedImages[index]!.path))
   //                                : const AssetImage("res/assets/logo_rec.png") as ImageProvider,
   //                            fit: BoxFit.cover,  // You can customize the fit property
   //                          ),
   //                        ),
   //                      ),
   //                      if (widget.canEdit)
   //                        Positioned(
   //                          right: -10,
   //                          top: -10,
   //                          child: IconButton(
   //                            icon: const Icon(Icons.cancel,color: Color.fromARGB(255, 10, 10, 10),),
   //                            onPressed: () {
   //                              deleteImage(index);
   //                            },
   //                          ),
   //                        ),
   //                    ],
   //                  ),
   //                );
   //              },
   //              itemCount: pickedImages.length,
   //            ),
   //          )
   //          : SizedBox()
        ],
      ),
    );
  }
}
