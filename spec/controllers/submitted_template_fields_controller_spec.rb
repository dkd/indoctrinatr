require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SubmittedTemplateFieldsController do

  # This should return the minimal set of attributes required to create a valid
  # SubmittedTemplateField. As you add validations to SubmittedTemplateField, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "document_submission" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SubmittedTemplateFieldsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all submitted_template_fields as @submitted_template_fields" do
      submitted_template_field = SubmittedTemplateField.create! valid_attributes
      get :index, {}, valid_session
      assigns(:submitted_template_fields).should eq([submitted_template_field])
    end
  end

  describe "GET show" do
    it "assigns the requested submitted_template_field as @submitted_template_field" do
      submitted_template_field = SubmittedTemplateField.create! valid_attributes
      get :show, {:id => submitted_template_field.to_param}, valid_session
      assigns(:submitted_template_field).should eq(submitted_template_field)
    end
  end

  describe "GET new" do
    it "assigns a new submitted_template_field as @submitted_template_field" do
      get :new, {}, valid_session
      assigns(:submitted_template_field).should be_a_new(SubmittedTemplateField)
    end
  end

  describe "GET edit" do
    it "assigns the requested submitted_template_field as @submitted_template_field" do
      submitted_template_field = SubmittedTemplateField.create! valid_attributes
      get :edit, {:id => submitted_template_field.to_param}, valid_session
      assigns(:submitted_template_field).should eq(submitted_template_field)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SubmittedTemplateField" do
        expect {
          post :create, {:submitted_template_field => valid_attributes}, valid_session
        }.to change(SubmittedTemplateField, :count).by(1)
      end

      it "assigns a newly created submitted_template_field as @submitted_template_field" do
        post :create, {:submitted_template_field => valid_attributes}, valid_session
        assigns(:submitted_template_field).should be_a(SubmittedTemplateField)
        assigns(:submitted_template_field).should be_persisted
      end

      it "redirects to the created submitted_template_field" do
        post :create, {:submitted_template_field => valid_attributes}, valid_session
        response.should redirect_to(SubmittedTemplateField.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved submitted_template_field as @submitted_template_field" do
        # Trigger the behavior that occurs when invalid params are submitted
        SubmittedTemplateField.any_instance.stub(:save).and_return(false)
        post :create, {:submitted_template_field => { "document_submission" => "invalid value" }}, valid_session
        assigns(:submitted_template_field).should be_a_new(SubmittedTemplateField)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SubmittedTemplateField.any_instance.stub(:save).and_return(false)
        post :create, {:submitted_template_field => { "document_submission" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested submitted_template_field" do
        submitted_template_field = SubmittedTemplateField.create! valid_attributes
        # Assuming there are no other submitted_template_fields in the database, this
        # specifies that the SubmittedTemplateField created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SubmittedTemplateField.any_instance.should_receive(:update).with({ "document_submission" => "" })
        put :update, {:id => submitted_template_field.to_param, :submitted_template_field => { "document_submission" => "" }}, valid_session
      end

      it "assigns the requested submitted_template_field as @submitted_template_field" do
        submitted_template_field = SubmittedTemplateField.create! valid_attributes
        put :update, {:id => submitted_template_field.to_param, :submitted_template_field => valid_attributes}, valid_session
        assigns(:submitted_template_field).should eq(submitted_template_field)
      end

      it "redirects to the submitted_template_field" do
        submitted_template_field = SubmittedTemplateField.create! valid_attributes
        put :update, {:id => submitted_template_field.to_param, :submitted_template_field => valid_attributes}, valid_session
        response.should redirect_to(submitted_template_field)
      end
    end

    describe "with invalid params" do
      it "assigns the submitted_template_field as @submitted_template_field" do
        submitted_template_field = SubmittedTemplateField.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SubmittedTemplateField.any_instance.stub(:save).and_return(false)
        put :update, {:id => submitted_template_field.to_param, :submitted_template_field => { "document_submission" => "invalid value" }}, valid_session
        assigns(:submitted_template_field).should eq(submitted_template_field)
      end

      it "re-renders the 'edit' template" do
        submitted_template_field = SubmittedTemplateField.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SubmittedTemplateField.any_instance.stub(:save).and_return(false)
        put :update, {:id => submitted_template_field.to_param, :submitted_template_field => { "document_submission" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested submitted_template_field" do
      submitted_template_field = SubmittedTemplateField.create! valid_attributes
      expect {
        delete :destroy, {:id => submitted_template_field.to_param}, valid_session
      }.to change(SubmittedTemplateField, :count).by(-1)
    end

    it "redirects to the submitted_template_fields list" do
      submitted_template_field = SubmittedTemplateField.create! valid_attributes
      delete :destroy, {:id => submitted_template_field.to_param}, valid_session
      response.should redirect_to(submitted_template_fields_url)
    end
  end

end