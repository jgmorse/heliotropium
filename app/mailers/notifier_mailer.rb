# frozen_string_literal: true

class NotifierMailer < ApplicationMailer
  default from: Settings.mailers.from.no_reply

  def administrators(text)
    @text = text
    mail(to: Settings.mailers.to.administrators)
  end

  def fulcrum_info_umpebc_marc_updates(text)
    @text = text
    mail(to: Settings.mailers.to.fulcrum_info,
         from: Settings.mailers.from.fulcrum_info,
         bcc: Settings.mailers.bcc.ebc_tech_contacts,
         subject: 'University of Michigan Press Ebook Collection MARC updates')
  end

  def mpub_cataloging_encoding_error(text)
    @text = text
    mail(to: Settings.mailers.to.mpub_cataloging,
         from: Settings.mailers.from.fulcrum_dev,
         subject: 'bad character encoding in MARC records for Michigan Publishing')
  end

  def mpub_cataloging_missing_record(text)
    @text = text
    mail(to: Settings.mailers.to.mpub_cataloging,
         from: Settings.mailers.from.fulcrum_dev,
         subject: 'missing MARC records for Michigan Publishing')
  end
end
