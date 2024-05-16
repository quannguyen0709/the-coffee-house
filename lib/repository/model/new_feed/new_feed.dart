class NewFeed{

  String name;
  List<Post> listPost;

  NewFeed(this.name, this.listPost);
}


class Post{
  String id;
  String title;
  String url;
  String shareUrl;
  String thumbnail;
  String content;
  int publish;
  String html;

  Post(this.id, this.title, this.url, this.shareUrl, this.thumbnail,
      this.content, this.publish, this.html);
}