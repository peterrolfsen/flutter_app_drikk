import 'dart:io';
class AdMobService {


  String getAdMobAppId(){
    if (Platform.isIOS) {
      return 'ca-app-pub-6988476604218121~5072006586';
    } else if (Platform.isAndroid){
      return 'ca-app-pub-6988476604218121~4383587354';
    }
    return null;
  }

  String getBannerAdId(){
    if (Platform.isIOS) {
      return 'ca-app-pub-6988476604218121/2908522455';
    } else if (Platform.isAndroid){
      return 'ca-app-pub-6988476604218121/7125941397';
    }
    return null;
  }
  }

