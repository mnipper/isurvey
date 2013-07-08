module Isurvey
  class SOAPClient 
    def self.savon_client
      @savon_client ||= Savon.client(
        wsdl: "https://isurveysoft.com/servicesv3/exportservice.asmx?WSDL"
      )
    end

    def self.savon_call(operation)
      self.savon_client.call(
        operation,
        message:
        {
          cp: Credentials.company_identifier,
          sp: Credentials.survey_password
        }
      )
    end

    def self.export_survey 
      @export_survey ||= self.savon_call(:export_survey) 
    end

    def self.export_survey_results
      @export_survey_results ||= self.savon_call(:export_survey_results) 
    end
  end
end
