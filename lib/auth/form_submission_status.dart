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
  final Exception  exception;

  SubmittionFailed(this.exception);

}

