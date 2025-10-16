import 'dart:convert';

import 'package:fruits_store/constants.dart';
import 'package:fruits_store/core/services/shared_preferences_singleton.dart';
import 'package:fruits_store/features/auth/data/models/user_model.dart';
import 'package:fruits_store/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var jsonData = Prefs.getString(kUserData);
  var userEntity = (UserModel.fromJson(jsonDecode(jsonData)));
  return userEntity;
}
