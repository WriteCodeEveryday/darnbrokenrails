# darnbrokenrails
An attempt at a cybersecurity / code quality teaching tool for Rails.

The 'sqlite3' gem is used to prevent this Rails project being hosted in most major online hosts, but this application is 'insecure by design', so care should be taken when enabling this application in any internet connected computer. Care has been taken to ensure 'broken sections' are not executed but this is not a warranty, it is merely a 'helping hand'. I make no guarantees about code quality or reliability.

# Project Goals and Objectives
This repository plus the accompanying documentation can be used for developers wanting to improve their code from a security / quality perspective. The data contained within should not need a 'Computer Science' degree in order to be understood. Your developers and technical management should be able to comprehend the 'nerd talk' within this project without having any issues.

The following goals are the unofficial goals of the project. More goals may be added by contributors.
1. Violates as many [bundler-audit](https://github.com/rubysec/bundler-audit) CVEs as possible.
2. Violates every warning under [brakeman](https://github.com/presidentbeef/brakeman) whenever possible.
3. Violates as many suggestions under [rails_best_practices](https://rails-bestpractices.com/) as possible.

# Tutorials
A tutorial section will be created in the wiki to show how to execute the tools and each example should have documentation linking back to the original source so the developers may use the available free tools to further their knowledge and write better Rails software. There is no reason to have insecure / non-functional software in the 21st century, at any level of any company. Any sort of software tools used within this project should be free, open source or have a trial, commercial software will be considered based on price.

# Attributions
Inspired by the [Damn Vulnerable Linux](https://distrowatch.com/table.php?distribution=dvl) project, original idea by [Esteban Garcia](https://www.linkedin.com/in/esteban-garcia-306468101/) so he could teach himself security and proper coding as he taught himself Rails, initial implementation by [Lazaro Herrera](https://www.linkedin.com/in/lazaroherrera/), contributions by you, maybe?

The following contributors helped achieve this project's goals:
1) Your Name Could Go Here For The Low Cost Of Helping Make Developers Write Safer and Better Code.

# Pull Requests and Issues
Pull requests are welcome with any changes, additions, new tooling or just any general feedback. Issues are also welcome; however, build issues will take low priority, since this project's dependencies are just too old to successfully build in some configurations and I don't have the resources to dedicate to fixing build issues at current time.

I will not accept pull requests that fix the security issues. I will accept all pull requests that make this Rails application less secure (proper documentation is required).

Be aware, you may have to manually increase your version of Rails beyond the set 3.2.22.5 in order to use fancy features like generators when making changes to the code.

# License
This code is licensed under CC0 with the understanding that you were warned it was not secure and you may credit me and other contributors if you so please.
