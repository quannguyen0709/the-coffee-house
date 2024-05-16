import 'package:flutter/cupertino.dart';
enum AxisListBlog{HORIZONTAL,VERTICAL}
class ListBlogWidget extends StatelessWidget{

  final List<dynamic> listBlog;
  final height;
  final width;
  final AxisListBlog axis;

  ListBlogWidget({required this.listBlog, this.height, this.width, required this.axis});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch (axis){
      case AxisListBlog.HORIZONTAL:
        return listBlogHorizontal();
      case AxisListBlog.VERTICAL:
        return Container();
    }
  }

  Widget listBlogHorizontal() {
    return Container();
  }

}
