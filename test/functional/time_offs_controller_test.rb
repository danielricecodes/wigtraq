require 'test_helper'

class TimeOffsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TimeOff.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TimeOff.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TimeOff.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to time_off_url(assigns(:time_off))
  end
  
  def test_edit
    get :edit, :id => TimeOff.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TimeOff.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TimeOff.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TimeOff.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TimeOff.first
    assert_redirected_to time_off_url(assigns(:time_off))
  end
  
  def test_destroy
    time_off = TimeOff.first
    delete :destroy, :id => time_off
    assert_redirected_to time_offs_url
    assert !TimeOff.exists?(time_off.id)
  end
end
