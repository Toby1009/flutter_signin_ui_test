import '../screen/signin_screen.dart';

abstract class FormSubmissionStatus{
  const FormSubmissionStatus();
}

class InititalFormStatus extends FormSubmissionStatus{
  const InititalFormStatus();
}

class FormSubmitting extends FormSubmissionStatus{

}

class SubmittionSuccess extends FormSubmissionStatus{
}

class SubmittionFailed extends FormSubmissionStatus{
  SubmittionFailed();
}

