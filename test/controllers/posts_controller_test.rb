require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  # TODO: FIXME: Fix this test!
  # test "should get index" do
  #   get posts_url
  #   assert_response :success
  # end

  # TODO: FIXME: Fix this test!
  # test "should get new" do
  #   get new_post_url
  #   assert_response :success
  # end

  # TODO: FIXME: Fix this test!
  # test "should create post" do
  #   assert_difference("Post.count") do
  #     post posts_url, params: { post: { body: @post.body, title: @post.title } }
  #   end

  #   assert_redirected_to post_url(Post.last)
  # end

  # TODO: FIXME: Fix this test!
  # test "should show post" do
  #   get post_url(@post)
  #   assert_response :success
  # end

  # TODO: FIXME: Fix this test!
  # test "should get edit" do
  #   get edit_post_url(@post)
  #   assert_response :success
  # end

  # TODO: FIXME: Fix this test!
  # test "should update post" do
  #   patch post_url(@post), params: { post: { body: @post.body, title: @post.title } }
  #   assert_redirected_to post_url(@post)
  # end

  # TODO: FIXME: Fix this test!
  # test "should destroy post" do
  #   assert_difference("Post.count", -1) do
  #     delete post_url(@post)
  #   end

  #   assert_redirected_to posts_url
  # end
end
