part of 'send_otp_bloc.dart';

@freezed
sealed class SendOtpState with _$SendOtpState {
  const factory SendOtpState.initial() = SendOtpInitial;
  const factory SendOtpState.loading() = SendOtpLoading;
  const factory SendOtpState.success() = SendOtpSuccess;
  const factory SendOtpState.error(String error) = SendOtpError;
}
