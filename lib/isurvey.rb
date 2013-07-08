require "isurvey/version"

module Isurvey
  attr_accessor :company_identifier, :survey_password

  def savon_client
    @savon_client ||= Savon.client(
      wsdl: "https://isurveysoft.com/servicesv3/exportservice.asmx?WSDL"
    )
  end

  def savon_call(operation)
    self.savon_client.call(
      operation,
      message:
      {
        cp: company_identifier,
        sp: survey_password
      }
    )
  end

  def export_survey 
    @export_survey ||= self.savon_call(:export_survey) 
  end

  def export_survey_results
    @export_survey_results ||= self.savon_call(:export_survey_results) 
  end
end
