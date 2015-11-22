gem install --no-document rubocop rubocop-checkstyle_formatter \
    rails_best_practices \
    brakeman brakeman_translate_checkstyle_format \
    reek \
    checkstyle_filter-git saddler saddler-reporter-github \
    scss_lint scss_lint_reporter_checkstyle

git diff -z --name-only origin/master \
 | xargs -0 rubocop-select \
 | xargs rubocop \
     --require rubocop/formatter/checkstyle_formatter \
     --format RuboCop::Formatter::CheckstyleFormatter \
 | checkstyle_filter-git diff origin/master \
 | saddler report \
    --require saddler/reporter/github \
    --reporter Saddler::Reporter::Github::PullRequestReviewComment
