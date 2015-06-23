module Helpers
def user_logs_in_with_github
    visit root_path
    mock_auth_hash
    within(".nav") do
      click_link "Sign in with Github"
    end
    find("#github-login").click
  end

  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
       provider: "facebook",
       uid: 827670270665,
       info:
        {email: "mirjoy.moser@gmail.com",
         name: "Miriam Joy"},
       credentials:
        {token:
          "CAAUNZB0W6ps8BAK8xf",
         expires_at: 1434834483}
      })
  end
end
