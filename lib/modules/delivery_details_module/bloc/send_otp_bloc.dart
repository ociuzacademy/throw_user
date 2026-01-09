import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'send_otp_event.dart';
part 'send_otp_state.dart';
part 'send_otp_bloc.freezed.dart';

class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  SendOtpBloc() : super(const SendOtpInitial()) {
    on<_SendingOtp>(_onSendingOtp);
  }

  Future<void> _onSendingOtp(
    _SendingOtp event,
    Emitter<SendOtpState> emit,
  ) async {
    emit(const SendOtpLoading());
    try {
      final Uri whatsappUrl = Uri.parse(
        "whatsapp://send?phone=${event.phoneNumber}&text=${Uri.encodeComponent('Here is your OTP for delivery: ${event.otp}')}",
      );

      // ignore: deprecated_member_use
      if (await canLaunch(whatsappUrl.toString())) {
        // ignore: deprecated_member_use
        await launch(whatsappUrl.toString());
        emit(const SendOtpState.success());
      } else {
        emit(const SendOtpState.error('Could not launch WhatsApp'));
      }
    } catch (e) {
      emit(SendOtpState.error(e.toString()));
    }
  }
}
