# Stack Overflow Clone

#### By **_Kendra Ash and Vaughn Dice_**


## Description
  This application was created for learning purposes only. It is a clone of stackoverflow.com.
_Using this app, users can:_
* _Create and sign into accounts_
* _Create and comments and questions,_
* _Add votes to a answer they like..._
* _...and more!_

## Setup
* _Clone this repository_
* _Run the following commands: (can be copied into terminal)_

```
bundle                   # installs necessary dependencies
postgres                # starts up the postgres server in background
rake db:init             # runs rake db:drop, :create, :migrate, :seed and :test:prepare
rails s                  # starts up the rails server
```

* _Then navigate to `localhost:3000`_

* _You can always run specs with: `rspec`_

## Technologies Used

_Ruby, rspec, Rails, Capybara, Postgres, Rake, Active Record, Devise

### Legal

Copyright (c) 2015 **_Kendra Ash and Vaughn Dice_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
