class OnboardingTileModel {
  String imagePath, title, description;

  OnboardingTileModel({this.imagePath, this.title, this.description});
}

List<OnboardingTileModel> getOnboardingTiles() {
  List<OnboardingTileModel> tiles = new List<OnboardingTileModel>();
  OnboardingTileModel onboardingTileModel = new OnboardingTileModel(
      imagePath: "assets/onboarding/onboarding-1.png",
      title: "Recycle",
      description: "Recycle description"); //TODO: find a great desc for this
  tiles.add(onboardingTileModel);

  onboardingTileModel = new OnboardingTileModel(
      imagePath: "assets/onboarding/onboarding-2.png",
      title: "PLACEHOLDER 2",
      description: "PLACEHOLDER description"); //TODO: find a great desc for this
  tiles.add(onboardingTileModel);

  onboardingTileModel = new OnboardingTileModel(
      imagePath: "assets/onboarding/onboarding-3.png",
      title: "PLACEHOLDER 3",
      description: "PLACEHOLDER description"); //TODO: find a great desc for this
  tiles.add(onboardingTileModel);

  return tiles;
}
