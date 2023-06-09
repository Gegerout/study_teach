class OnboardingModel {
  final String image;
  final String subtitle;

  OnboardingModel(this.image, this.subtitle);

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(json["image"], json["subtitle"]);
  }
}