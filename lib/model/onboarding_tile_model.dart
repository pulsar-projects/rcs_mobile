class OnboardingTileModel {
  String imagePath, title, description;

  OnboardingTileModel({this.imagePath, this.title, this.description});
}

List<OnboardingTileModel> getOnboardingTiles() {
  List<OnboardingTileModel> tiles = new List<OnboardingTileModel>();
  OnboardingTileModel onboardingTileModel = new OnboardingTileModel(
      imagePath: "assets/onboarding/onboarding-1.png",
      title: "Recycle",
      description: "Inspect your items and find the nearest recycling center.");
  tiles.add(onboardingTileModel);

  onboardingTileModel = new OnboardingTileModel(
      imagePath: "assets/onboarding/onboarding-2.png",
      title: "Benefits",
      description:
          "Recycling helps reduce waste, conserve natural resources, prevent pollution and save energy.");
  tiles.add(onboardingTileModel);

  onboardingTileModel = new OnboardingTileModel(
      imagePath: "assets/onboarding/onboarding-3.png",
      title: "Contribute",
      description:
          "By recycling you also help produce recycled-content products and jobs related to recycling.");
  tiles.add(onboardingTileModel);

  return tiles;
}
