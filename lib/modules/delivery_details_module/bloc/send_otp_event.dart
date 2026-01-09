part of 'send_otp_bloc.dart';

@freezed
sealed class SendOtpEvent with _$SendOtpEvent {
  const factory SendOtpEvent.started() = _Started;
  const factory SendOtpEvent.sendingOtp(String phoneNumber, String otp) =
      _SendingOtp;
}
