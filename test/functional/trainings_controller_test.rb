require 'test_helper'

class TrainingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Training.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Training.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Training.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to training_url(assigns(:training))
  end
  
  def test_edit
    get :edit, :id => Training.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Training.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Training.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Training.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Training.first
    assert_redirected_to training_url(assigns(:training))
  end
  
  def test_destroy
    training = Training.first
    delete :destroy, :id => training
    assert_redirected_to trainings_url
    assert !Training.exists?(training.id)
  end
end
