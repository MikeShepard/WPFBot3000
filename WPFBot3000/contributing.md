# Contributing to WPFBot3000

Stolen from Mike Lombardi's needful-docs project (https://gitlab.com/michaeltlombardi/needful-docs/blob/master/CONTRIBUTING.md)
Contributions to `needful-docs` are highly encouraged and desired.
Below are some guidelines that will help make the process as smooth as possible.

## Getting Started
+ Make sure you have a [Github account](https://github.com/join)
+ [Submit a new issue](https://github.com/MikeShepard/WPFBot3000/issues/new), assuming one does not already exist.
  + Clearly describe the issue including steps to reproduce when it is a bug.
  + Make sure you fill in the earliest version that you know has the issue.
+ Fork the repository on Github

## Suggesting Enhancements
I want to know what you think is missing from `needful-docs` and how it can be made better.

+ When submitting an issue for an enhancement, please be as clear as possible about why you think the enhancement is needed and what the benefit of it would be.

## Making Changes
+ From your fork of the repository, create a topic branch where work on your change will take place.
+ To quickly create a topic branch based on master; `git checkout -b my_contribution master`. Please avoid working directly on the `master` branch.
+ Make commits of logical units.
+ Check for unnecessary whitespace with `git diff --check` before committing.
+ Please follow the prevailing [style conventions](#style-conventions) in the repository.
Differences in style make the plaintext harder to understand for everyone.
+ Make sure your commit messages are in the proper format.

````
    Fix typo in 3-narrative/2-why.md

    + Fix the typo in the why page for narrative documentation where narrative was misspelled.
````

## Submitting Changes
+ Push your changes to a topic branch in your fork of the repository.
+ Submit a marge request to the main repository.
+ Once the marge request has been reviewed and accepted, it will be merged with the master branch.
+ Celebrate

## Style Conventions
This is a list of style conventions used in this project.
Please follow these conventions when contributing.

+ Use a `+` instead of an `*` for unordered lists.
This helps us be consistent and avoid some weird formatting issues.
+ Always write your documents one-sentence-per-line.
This makes diff'ing the documents easier.
+ Always use a first level header `# Title` for the page.
+ Use second and third level headers for sections where appropriate.
+ Always leave a blank line at the end of the file.

## Additional Resources
* [GitHub Flow guide](https://docs.gitlab.com/ee/workflow/gitlab_flow.html)
* [GitHub's guide to contributing to open source projects](https://guides.github.com/activities/contributing-to-open-source/)
