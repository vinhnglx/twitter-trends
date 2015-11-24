#!/bin/bash
gem install --no-document rubocop rubocop-checkstyle_formatter \
    rails_best_practices \
    brakeman brakeman_translate_checkstyle_format \
    reek \
    checkstyle_filter-git saddler saddler-reporter-github \
    scss_lint scss_lint_reporter_checkstyle

echo "********************"
echo "* RuboCop          *"
echo "********************"

rubocop --require `gem which rubocop/formatter/checkstyle_formatter` --format RuboCop::Formatter::CheckstyleFormatter --out rubocop.xml
cat rubocop.xml \
  | checkstyle_filter-git diff origin/master \
  | saddler report \
    --require saddler/reporter/github \
    --reporter Saddler::Reporter::Github::PullRequestReviewComment

echo "***********************"
echo "* Rails Best Pratices *"
echo "***********************"
rails_best_practices -f xml

cat rails_best_practices_output.xml \
  | checkstyle_filter-git diff origin/master \
  | saddler report \
    --require saddler/reporter/github \
    --reporter Saddler::Reporter::Github::PullRequestReviewComment

echo "********************"
echo "* Brakeman         *"
echo "********************"
brakeman -o brakeman.json
cat brakeman.json \
  | brakeman_translate_checkstyle_format translate \
  | checkstyle_filter-git diff origin/master \
  | saddler report \
    --require saddler/reporter/github \
    --reporter Saddler::Reporter::Github::PullRequestReviewComment

echo "********************"
echo "* SCSS-Lint        *"
echo "********************"
scss-lint --require=scss_lint_reporter_checkstyle --format=Checkstyle -o scsslint.xml
cat scsslint.xml \
  | checkstyle_filter-git diff origin/master \
  | saddler report \
    --require saddler/reporter/github \
    --reporter Saddler::Reporter::Github::PullRequestReviewComment
