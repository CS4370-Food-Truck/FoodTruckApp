require "test_helper"

class TrucksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @truck = trucks(:one)
  end

  # test "should get index" do
  #   get trucks_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_truck_url
  #   assert_response :success
  # end

  # test "should create truck" do
  #   assert_difference("Truck.count") do
  #     post trucks_url, params: { truck: { latitude: @truck.latitude, longitude: @truck.longitude, menu: @truck.menu, name: @truck.name, schedule: @truck.schedule, website: @truck.website } }
  #   end

  #   assert_redirected_to truck_url(Truck.last)
  # end

  test "should show truck" do
    get truck_url(@truck)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_truck_url(@truck)
  #   assert_response :success
  # end

  # test "should update truck" do
  #   patch truck_url(@truck), params: { truck: { latitude: @truck.latitude, longitude: @truck.longitude, menu: @truck.menu, name: @truck.name, schedule: @truck.schedule, website: @truck.website } }
  #   assert_redirected_to truck_url(@truck)
  # end

  # test "should destroy truck" do
  #   assert_difference("Truck.count", -1) do
  #     delete truck_url(@truck)
  #   end

  #   assert_redirected_to trucks_url
  # end
  # test "should destroy all trucks" do
  #   assert_difference("Truck.count", -1 * eval("Truck.count")) do
  #     get trucks_delete_url
  #   end
  # end

  test "should show simple view" do
    get trucks_simple_url
    assert_response :success
  end

  test "should show map" do
    get map_url
    assert_response :success
  end

  test "should not save truck without name" do
    truck = Truck.new
    assert_not truck.save, "Saved the truck without a name"
  end

end
