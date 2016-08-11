class UserMailer < ApplicationMailer
  def send_result lesson
    @content = {name: lesson.user.name, correct: lesson.load_answer_correct,
      id: lesson.id, total: lesson.total}
    mail to: lesson.user.email,
      subject: t("user_mailer.send_result.subject")
  end
end
