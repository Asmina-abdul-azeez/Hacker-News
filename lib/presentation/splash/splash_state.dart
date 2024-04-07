class SplashState {
  SplashState({this.splashFinished=false});
  bool splashFinished=false;
  SplashState init() {
    return SplashState();
  }

  SplashState clone() {
    return SplashState();
  }
  SplashState closeSplash() {
    return SplashState(splashFinished: true);
  }
}
