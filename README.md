# Isurvey

Gem for interacting with iSurvey's SOAP api.

## Installation

Add this line to your application's Gemfile:

    gem 'isurvey'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install isurvey

You must set up your company identifier and survey password.  Perhaps in config/initializers/isurvey.rb if you are using Rails.

    Isurvey::Credentials.company_identifier = [cp]
    Isurvey::Credentials.survey_password = [sp]

## Usage

There are questions and answers.  Questions are available through Isurvey::Question and answers are available through Isurvey::Answer.

To get a list of all questions:

    Isurvey::Question.all

To get a list of all answers:

    Isurvey::Answer.all

All of the properties available through the iSurvey API are also available through the gem.  You obtain a property value by calling for it on the appropriate class; for example, Isurvey::Answer.all.first.screen_id would give you the screen_id of the first Answer. 

For questions, the available properties are:
    
    :screen_id, :question_number, :screen_id_next, :show_labels, :selectable_images, :screen_text, :screen_instructions, :theme_class_id, :screen_options, :answers, :questions

For answers, the available properties are:
    
    :screen_id, :question_id, :answer_id, :result_answer, :response_date

You can also get direct access to the API.  I do not recommend relying on any of these methods since they are being phased out.

Get a list of the questions:

    Isurvey::API.questions

Get a list of the result ids:

    Isurvey::API.result_ids

Get a list of the questions by screen id:

    Isurvey::API.question_by_screen_id(screen_id)

Get a list of the answers by screen id:

    Isurvey::API.answers_by_screen_id(screen_id)

Get a list of the answers by result id:

    Isurvey::API.answers_by_result_id(result)

Get a list of the answers by result id and screen id:

    Isurvey::API.answer_by_screen_and_result_id(result_id: id, screen_id: id)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
