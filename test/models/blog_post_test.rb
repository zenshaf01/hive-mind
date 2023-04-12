require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "draft? returns true for draft blog post" do
    assert blog_posts(:draft).draft? #this is using a fixture: See the fixtures for this resource
  end

  test "draft? returns false for published blog post" do
    refute blog_posts(:published).draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute blog_posts(:scheduled).draft?
  end

  test "published? returns true for published blog post" do
    assert blog_posts(:published).publish?
  end

  test "published? returns false for draft blog post" do
    refute blog_posts(:draft).publish?
  end

  test "published? returns false for scheduled blog post" do
    refute blog_posts(:scheduled).publish?
  end

  test "scheduled? returns true for scheduled blog post" do
    assert blog_posts(:scheduled).schedule?
  end

  test "scheduled? returns false for draft blog post" do
    refute blog_posts(:draft).schedule?
  end

  test "scheduled? returns false for published blog post" do
    refute blog_posts(:published).schedule?
  end
end
