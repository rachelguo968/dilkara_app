class AdBanner {
  final int id;
  final String image;
  final String imageUrl; // New field for the image URL

  AdBanner({
    required this.id,
    required this.image,
    required this.imageUrl, // Initialize imageUrl in the constructor
  });
}
AdBanner adBanner = AdBanner(
  id: 1,
  image: "Banner Image",
  imageUrl: "https://dilkara.com.au/wp-content/uploads/2023/04/image-2-1.png", // Provide the image URL here
);
