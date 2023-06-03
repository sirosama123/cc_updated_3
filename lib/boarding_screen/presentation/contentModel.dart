class ContentModel {
 final String image;
 final String title;

  ContentModel({required this.image,required this.title});
}

List<ContentModel> contents = [
  ContentModel(  
    image: "assets/images/logo2.jpg",
    title:  "HouseEase",
   
  ),
  ContentModel(  
    image: "assets/images/screen2.PNG",
    title:  "Get Verified Techinician at your doorstep",
   
  ),
  ContentModel(  
    image: "assets/images/screen3.PNG",
    title:  "Pick the time slot that is best for you",
  ),
];