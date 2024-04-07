import 'package:freezed_annotation/freezed_annotation.dart';
part '../../gen/profile_page/profile_page_state.freezed.dart';
part '../../gen/profile_page/profile_page_state.g.dart';

@freezed
class ProfilePageState with _$ProfilePageState {

const factory ProfilePageState({
    String? phoneNumber,
  }) = _ProfilePageState;

  factory ProfilePageState.init() {
    return const ProfilePageState();
  }

  factory ProfilePageState.clone() {
    return const ProfilePageState();
  }

  factory ProfilePageState.fromJson(Map<String, dynamic> json) => _$ProfilePageStateFromJson(json);

}
