# darnbrokenrails
An attempt at a cybersecurity teaching tool for Rails.

The 'sqlite3' gem is used to prevent this Rails project being hosted in most major online hosts, but this application is 'insecure by design', so care should be taken when enabling this application. Care has been taken to ensure 'broken sections' are not executed but this is not a warranty, it is merely a 'helping hand'.

This repository plus the accompanying documentation can be used for developers wanting to improve their code quality from a security perspective. The data contained within should not need a 'Computer Science' degree in order to have it be understood. Your developers and technical management should be able to comprehend the 'nerd talk' within this project without having any issues.

The following goals are the unofficial goals of the project
1. Violates as many [bundler-audit](https://github.com/rubysec/bundler-audit) rules are possible.
  * This should use as many insecure gems from the "common rails gems".
2. Violates every warning under [brakeman](https://github.com/presidentbeef/brakeman)
3. Violates as many suggestions under [rails_best_practices](https://rails-bestpractices.com/) as possible.

A tutorial section will be created in the wiki to show how to remediate these issues and examples should have documentation linking back to the original source so the developers may use the available free tools to further their knowledge and write better Rails software. There is no reason to have insecure software in the 21st century, at any level of any company. Any sort of software tools used within this project should be free or have a trial, commercial software will be considered based on price.

Inspired by the [Damn Vulnerable Linux](https://distrowatch.com/table.php?distribution=dvl) project, original idea by [Esteban Garcia](https://www.linkedin.com/in/esteban-garcia-306468101/) so he could teach himself security as he learned Rails, implementation by [Lazaro Herrera](https://www.linkedin.com/in/lazaroherrera/). 

The following contributors helped achieve this project's goals:
1) Your Name Could Go Here For The Low Cost Of Helping Make Developers Write Safer Code

Pull requests are welcome with any changes, additions, new tooling or just any general feedback. Issues are also welcome; however, build issues will take low priority, this project's dependencies are just too old to successfully build in some configurations and I don't have the resources to dedicate to fixing build issues at current time.
