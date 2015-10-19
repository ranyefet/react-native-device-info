/**
 * @providesModule react-native-device-info
 */

var { RNDeviceInfo } = require('react-native').NativeModules;

module.exports = {
  appIdentifier: RNDeviceInfo.appIdentifier,
  appName: RNDeviceInfo.appName,
  appVersion: RNDeviceInfo.appVersion
  deviceId: RNDeviceInfo.deviceId,
  model: RNDeviceInfo.model,
  systemName: RNDeviceInfo.systemName,
  systemVersion: RNDeviceInfo.systemVersion
};