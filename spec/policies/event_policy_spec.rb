require 'rails_helper'

describe EventPolicy do
  let(:user) { User.new }
  let(:event) { Event.create(
    user: user,
    title: 'Event1',
    description: 'Event description',
    address: 'Street',
    datetime: '03.06.2021 14:00',
    pincode: "",
    user_id: 1
  )
  }

  subject { described_class.new(user, event) }

  context 'being a visitor' do
    let(:user) { nil }

    it { is_expected.to permit_actions(%i[show index]) }
    it { is_expected.to forbid_actions(%i[create edit update destroy new]) }
  end

  context 'being an not owner' do
    let(:user1) { User.new }

    it { is_expected.to permit_actions(%i[show index create new]) }
    it { is_expected.to forbid_actions(%i[edit update destroy]) }
  end

  # context 'being an owner' do
  #
  #   it { is_expected.to permit_actions(%i[update edit destroy]) }
  # end
end
