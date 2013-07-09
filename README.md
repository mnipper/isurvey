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

Before being used, the API must be loaded.  This can be done in your initialzer or in any other place you see fit.

    Isurvey::API.load

## Usage

There are questions and answers.  Questions are available through Isurvey::Question and answers are available through Isurvey::Answer.

To get a list of all questions:

    Isurvey::Question.all

To get a list of all answers:

    Isurvey::Answer.all

All of the properties available through the iSurvey API are also available through the gem.  You obtain a property value by calling for it on the appropriate class; for example, Isurvey::Answer.first.screen_id would give you the screen_id of the first Answer. 

For questions, the available properties are:
    
    :screen_id, :question_number, :screen_id_next, :show_labels, :selectable_images, :screen_text, :screen_instructions, :theme_class_id, :screen_options, :answers, :questions

For answers, the available properties are:
    
    :screen_id, :question_id, :answer_id, :result_answer, :response_date

Any property can also be used to find on either questions or answers.  For example:

    Isurvey::Question.find_by_screen_id(:id)
    Isurvey::Answer.find_by_question_id(:id)

You can query a question for its answers, or an answer for its question.

    Isurvey::Question.first.answers
    Isurvey::Answer.first.question

You can also find answers by result id to a question.

    Isurvey::Question.answers_by_result_id(:id)

Questions and Answers have shortcut methods that allow you to query for the first or some index:

    Isurvey::Question.first
    Isurvey::Answer[10]

You can also get direct access to the API.

Get a list of the result ids:

    Isurvey::API.result_ids

These are also available, though I advise against using them unless there is a good reason:

    Isurvey::API.questions
    Isurvey::API.answers

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
