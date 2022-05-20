import 'dart:ui';
import 'package:flame/game.dart';
import 'package:words_play/Screens/common/screen_size.dart';
import 'common/base_screen.dart';
import 'loading/loading_screen.dart';
import 'screen_state.dart';


ScreenManager screenManager = ScreenManager();

class ScreenManager extends FlameGame{
  late ScreenState _state;
  late BaseScreen _loadingScreen;
  ScreenManager(){
    setScreenState(ScreenState.LoadingScreen);
  }
  @override
  void render(Canvas canvas){
      _getActiveScreen()?.render(canvas);
    }
  @override
  void update(double t){
      _getActiveScreen()?.update(t);
  }
  @override
  void resize(Size size){
    screenSize.resize(size);
      _getActiveScreen()?.resize();
  }

  BaseScreen _getActiveScreen(){
    switch(_state){
      case ScreenState.LoadingScreen:
        return _loadingScreen;
      default:
        throw Exception('Invalid Screen' + _state.toString());
    }
  }

  void setScreenState(ScreenState state){
    switch(state){
      case ScreenState.LoadingScreen:
      _loadingScreen = LoadingScreen();
      _loadingScreen.resize();
      break;
      default:
        break;
    }
    this._state = state;
  }
}