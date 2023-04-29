RSpec.describe 'home/index', type: :view do
  before do
    render
  end

  it "displays the app name 'PENNY WISE'" do
    expect(rendered).to have_css('h1.app_name', text: 'PENNY WISE')
  end

  it "displays the 'LOG IN' link" do
    expect(rendered).to have_link('LOG IN', href: new_user_session_path)
  end

  it "displays the 'SIGN UP' link" do
    expect(rendered).to have_link('SIGN UP', href: new_user_registration_path)
  end
end
