require 'rails_helper'

RSpec.describe EventPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:event_without_pincode) { create(:event, user: user) }
  let(:event_with_pincode) { create(:event, user: user, pincode: '666') }
  let(:correct_cookies) { { "event_#{event_with_pincode.id}_pincode" => '666' } }

  describe 'being a visitor' do
    let(:visitor_without_correct_cookies) { OpenStruct.new(user: nil, cookies: {}) }

    context 'event without pincode' do
      permissions :show?, :index? do
        it { is_expected.to permit(visitor_without_correct_cookies, event_without_pincode) }
      end

      permissions :create?, :edit?, :update?, :destroy?, :new? do
        it { is_expected.not_to permit(visitor_without_correct_cookies, event_without_pincode) }
      end
    end

    context 'event with pincode & vsitor without correct cookies' do
      permissions :index? do
        it { is_expected.to permit(visitor_without_correct_cookies, event_with_pincode) }
      end

      permissions :create?, :edit?, :update?, :destroy?, :new?, :show? do
        it { is_expected.not_to permit(visitor_without_correct_cookies, event_with_pincode) }
      end
    end

    context 'event with pincode & vsitor with correct cookies' do
      let(:visitor_with_correct_cookies) { OpenStruct.new(user: nil, cookies: correct_cookies) }

      permissions :index?, :show? do
        it { is_expected.to permit(visitor_with_correct_cookies, event_with_pincode) }
      end

      permissions :create?, :edit?, :update?, :destroy?, :new? do
        it { is_expected.not_to permit(visitor_with_correct_cookies, event_with_pincode) }
      end
    end
  end

  describe 'being an owner' do
    let(:event_owner) { OpenStruct.new(user: user, cookies: {}) }

    context 'event without pincode' do
      permissions :create?, :edit?, :update?, :destroy?, :new?, :show?, :index? do
        it { is_expected.to permit(event_owner, event_without_pincode) }
      end
    end

    context 'event with pincode' do
      permissions :create?, :edit?, :update?, :destroy?, :new?, :show?, :index? do
        it { is_expected.to permit(event_owner, event_with_pincode) }
      end
    end
  end

  describe 'being an another user' do
    let(:another_user_without_correct_cookies) { OpenStruct.new(user: create(:user), cookies: {}) }

    context 'event without pincode' do
      permissions :create?, :new?, :show?, :index? do
        it { is_expected.to permit(another_user_without_correct_cookies, event_without_pincode) }
      end

      permissions :edit?, :update?, :destroy? do
        it { is_expected.not_to permit(another_user_without_correct_cookies, event_without_pincode) }
      end
    end

    context 'event with pincode & another user without correct cookies' do
      permissions :create?, :new?, :index? do
        it { is_expected.to permit(another_user_without_correct_cookies, event_with_pincode) }
      end

      permissions :edit?, :update?, :destroy?, :show? do
        it { is_expected.not_to permit(another_user_without_correct_cookies, event_with_pincode) }
      end
    end

    context 'event with pincode & another user with correct cookies' do
      let(:another_user_with_correct_cookies) { OpenStruct.new(user: create(:user), cookies: correct_cookies) }

      permissions :create?, :new?, :index?, :show? do
        it { is_expected.to permit(another_user_with_correct_cookies, event_with_pincode) }
      end

      permissions :edit?, :update?, :destroy? do
        it { is_expected.not_to permit(another_user_with_correct_cookies, event_with_pincode) }
      end
    end
  end
end
