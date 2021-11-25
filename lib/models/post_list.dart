class Post {
  final String name;
  final String profile;
  final String time;
  final String title;
  final String image;
  final int like;
  final bool likeStatus;
  final int comment;

  Post(
      {required this.name,
      required this.profile,
      required this.time,
      required this.title,
      required this.image,
      required this.like,
      this.likeStatus = false,
      required this.comment});
}

List<Post> postList = [
  Post(
      name: "gentille",
      profile: "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8ZG9nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60",
      time: "08:16 pm",
      title: "One of the basic pieces of furniture, a chair is a type of seat. Its primary features are two pieces of a durable material, attached as back and seat to one another at a 90°-or-slightly-greater angle, ",
      image: "https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxNjN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60",
      like: 1341,
      likeStatus: true,
      comment: 76),
  Post(
      name: "olivia",
      profile: "https://images.unsplash.com/photo-1582456891925-a53965520520?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGRvZyUyMGFuZCUyMGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60",
      time: "09:26 pm",
      title: "The definition of cup of tea is an expression that is used to describe something you like, something you are good at or something you enjoy doing. An example of cup of tea is sewing to a seamstress or knitting to a knitter. (idiomatic, not used in plural form) Whatever suits or interests one.",
      image: "https://images.unsplash.com/photo-1637773633693-ee52228bab6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMTR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60",
      like: 131,
      comment: 76),
  Post(
      name: "sam",
      profile: "https://images.unsplash.com/photo-1501959181532-7d2a3c064642?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bGFwdG9wJTIwd2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60",
      time: "12:26 am",
      title: "Food is any substance consumed to provide nutritional support for an organism. Food is usually of plant, animal or fungal origin, and contains essential nutrients, such as carbohydrates, fats, proteins, vitamins, or minerals.",
      image: "https://images.unsplash.com/photo-1637768443506-c7c48c8a393f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4N3x8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60",
      like: 341,
      comment: 36),
  Post(
      name: "sophia",
      profile: "https://images.unsplash.com/photo-1491947153227-33d59da6c448?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fGxhcHRvcCUyMHdhbGxwYXBlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60",
      time: "04:36 pm",
      title: "The labour law concept of leave, specifically paid leave or, in some countries' long-form, a leave of absence, is an authorised prolonged absence from work, for any reason authorised by the workplace.",
      image: "https://images.unsplash.com/photo-1471897488648-5eae4ac6686b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2N3x8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60",
      like: 134,
      likeStatus: true,
      comment: 96),
  Post(
      name: "steve",
      profile: "https://images.unsplash.com/photo-1637783226061-6d3e55c26cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60",
      time: "02:44 am",
      title: "Tea is an aromatic beverage prepared by pouring hot or boiling water over cured or fresh leaves of Camellia sinensis, an evergreen shrub native to China and other East Asian countries. After water, it is the most widely consumed drink in the world.",
      image: "https://images.unsplash.com/photo-1637783226061-6d3e55c26cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60",
      like: 541,
      comment: 176)
];