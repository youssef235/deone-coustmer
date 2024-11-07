class Settings {
  String? email;
  String? whatsappNumber;
  String? facebookAccount;
  String? twitterAccount;
  String? youtubeAccount;
  String? instgramAccount;

  Settings(
      {this.email,
      this.whatsappNumber,
      this.facebookAccount,
      this.twitterAccount,
      this.youtubeAccount,
      this.instgramAccount});

  Settings.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    whatsappNumber = json['whatsapp_number'];
    facebookAccount = json['facebook_account'];
    twitterAccount = json['twitter_account'];
    youtubeAccount = json['youtube_account'];
    instgramAccount = json['instgram_account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['whatsapp_number'] = this.whatsappNumber;
    data['facebook_account'] = this.facebookAccount;
    data['twitter_account'] = this.twitterAccount;
    data['youtube_account'] = this.youtubeAccount;
    data['instgram_account'] = this.instgramAccount;
    return data;
  }
}
