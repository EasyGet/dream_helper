

import 'package:permission_handler/permission_handler.dart';

/// 获取[permission] 当前授权结果
Future<PermissionStatus> permissionStatus(Permission permission) async {
  return await permission.status;
}
