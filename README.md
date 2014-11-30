maillogger
==========

A delivery method that wrapps another delivery method and logs all successfull deliveries. It logs to ```./log/emails/\#{Time.now....}.eml```

Usage
-----

In Gemfile

    gem 'maillogger', "~> 0.2"
   
Loading mail configuration in development.rb

    mail_options = {....}
    MailLogger.delivery_method(Mail::SMTP, mail_options)
    Mail.defaults do 
      delivery_method MailLogger
    end
    
The result is that all email that you call deliver on ends up in ```./log/emails/``` as ```20140707_1348.18-UTC.eml``` or ```delivery_failure_20140707_1348.18-UTC.eml```

Change log
----------

### 0.2.1

- Fixed so that failure to send email is also logged.
- Changed to LGPL
- Updated the reamde to actualy say something


Contributing to maillogger
--------------------------
 
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.

Copyright
---------

Copyright (c) 2012 - 2014 Darwin. See LICENSE.txt for
further details.

