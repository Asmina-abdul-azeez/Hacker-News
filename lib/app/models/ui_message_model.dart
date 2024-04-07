// ignore_for_file: avoid_positional_boolean_parameters

class UIMessageModel {
  UIMessageModel(this._title, this._message, this._showMessage) {
    messageShown = false;
  }

  final String _title;
  String _message;
  final bool _showMessage;
  bool messageShown = false;

  String get message {
    messageShown = true;
    return _message;
  }

  String get title {
    return _title;
  }

  bool get showMessage {
    return _showMessage && !messageShown;
  }

  set message(String message) {
    _message = message;
    messageShown = false;
  }
}
