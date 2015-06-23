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
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      "provider"=>"github",
      "uid"=>"5142805",
      "info"=>
      {"email"=>"miriam@example.com",
       "name"=>"Miriam",
       "image"=>"https://avatars.githubusercontent.com/u/5142805?v=3",
       "urls"=>{"GitHub"=>"https://github.com/mirjoy", "Blog"=>"mirjoy"}}
    })
  end
end
