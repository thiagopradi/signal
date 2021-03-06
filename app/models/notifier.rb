class Notifier < ActionMailer::Base

  def fail_notification(build)
    deliver build, "failed"
  end

  def fix_notification(build)
    deliver build, "fixed"
  end

  private

  def deliver(build, status)
    project = build.project
    from "signal@#{MAILER['domain']}"
    recipients project.email
    subject "[Signal] #{project.name} #{status}"
    body :build => build, :project => project
  end
end
