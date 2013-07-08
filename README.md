# Isurvey

Gem for interacting with iSurvey's SOAP api.

## Installation

Add this line to your application's Gemfile:

    gem 'isurvey'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install isurvey

You must set up your company identifier and survey password.  Perhaps in config/initiaizers/isurvey.rb.

    Isurvey::SOAPClient.company_identifier = [cp]
    Isurvey::SOAPClient.survey_password = [sp]

## Usage

Get a list of the questions:

    Isurvey::API.questions

Get a list of the result ids:

    Isurvey::API.result_ids

Get a list of the questions by screen id:

    Isurvey::API.questions_by_screen_id(screen_id)

Get a list of the answers by screen id:

    Isurvey::API.answers_by_screen_id(screen_id)

Get a list of the answers by result id:

    Isurvey::API.answers_by_result_id(result)

Get a list of the answers by result id and screen id:

    Isurvey::API.answers_by_screen_and_result_id(result_id: id, screen_id: id)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
