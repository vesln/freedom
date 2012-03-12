describe SignupMailer do
  describe 'welcome' do
    let(:user) { build(:user) }

    subject { SignupMailer.welcome(user) }

    it { should have_body_text 'Welcome' }
    it { should have_body_text user.name }
    it { should deliver_to user.email }
  end
end
