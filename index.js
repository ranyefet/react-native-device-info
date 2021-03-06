/**
 * @providesModule react-native-device-info
 */

var { RNDeviceInfo } = require('react-native').NativeModules;

module.exports = {
  appBuildNumber: RNDeviceInfo.appBuildNumber,
  appIdentifier: RNDeviceInfo.appIdentifier,
  appName: RNDeviceInfo.appName,
  appVersion: RNDeviceInfo.appVersion,
  localeIdentifier: RNDeviceInfo.localeIdentifier,
  installationId: RNDeviceInfo.installationId,
  model: RNDeviceInfo.model,
  systemName: RNDeviceInfo.systemName,
  systemVersion: RNDeviceInfo.systemVersion,
  timeZone: RNDeviceInfo.timeZone
};
