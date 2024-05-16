import '../../../call_api_service/model/new_feed/new_feeds_entity.dart';
import 'new_feed.dart';

class AddNewFeed {
  List<NewFeed> addNewFeed(NewFeedsEntity newFeedsEntity) {
    List<NewFeed> newFeed = [];
    List<NewFeedsNews> listNewFeedNews = newFeedsEntity.news;
    listNewFeedNews.forEach((element) {
      newFeed.add(NewFeed(element.name, addPost(element.posts)));
    });

    return newFeed;
  }

  List<Post> addPost(List<NewFeedsNewsPosts> newFeedsNewsPosts) {
    List<Post> listPost = [];
    newFeedsNewsPosts.forEach((element) {
      listPost.add(Post(
          element.id,
          element.title,
          element.url,
          element.shareUrl,
          element.thumbnail,
          element.content,
          element.publish,
          element.html));
    });

    return listPost;
  }
}
