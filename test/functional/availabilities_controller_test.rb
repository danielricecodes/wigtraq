require 'test_helper'

class AvailabilitiesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Availability.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Availability.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Availability.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to availability_url(assigns(:availability))
  end
  
  def test_edit
    get :edit, :id => Availability.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Availability.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Availability.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Availability.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Availability.first
    assert_redirected_to availability_url(assigns(:availability))
  end
  
  def test_destroy
    availability = Availability.first
    delete :destroy, :id => availability
    assert_redirected_to availabilities_url
    assert !Availability.exists?(availability.id)
  end
end
