require "spec"
require "webmock"
require "../src/docker"

Spec.before_each &->WebMock.reset
