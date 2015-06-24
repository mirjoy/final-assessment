class Seeds
  def self.create
    add_languages
    create_users
  end

  def self.add_languages
    languages = %w[JavaScript Java Ruby C CSS PHP Python C++
      Objective-C C# Shell R CoffeeScript Go Perl Scala VimL
      Clojure Haskell Erlang Rust Swift]

    languages.each do |l|
      Language.create(name: l)
    end
  end

  def self.create_users
   a = User.create(name: "Watts",
                image: "https://avatars.githubusercontent.com/u/7582765?v=3",
                email: "",
                github_account: "https://github.com/121watts",
                description: "Want to pair on my .vimrc? I got tired of Dvorak so i've been devising my own keyboard layout from scratch",
                uid: "ewrewr"
                )
    UserLanguage.create(user_id: a.id, language_id: 1)
    UserLanguage.create(user_id: a.id, language_id: 2)
    UserLanguage.create(user_id: a.id, language_id: 3)

    b = User.create(name: "Alan",
                image: "https://avatars.githubusercontent.com/u/4818182?v=3",
                email: "",
                github_account: "https://github.com/alanbsmith",
                description: "i am so alone plz pair with me",
                uid: "sdfds"
                )
    UserLanguage.create(user_id: b.id, language_id: 2)
    UserLanguage.create(user_id: b.id, language_id: 3)
    UserLanguage.create(user_id: b.id, language_id: 4)

    c = User.create(name: "Ali",
                image: "https://avatars.githubusercontent.com/u/7552541?v=3",
                email: "",
                github_account: "https://github.com/allisonlarson",
                description: "would love to get your help on my new startup; it's in stealth mode so we can only use 1-character variable names, but it will be fun",
                uid: "cat"
                )
    UserLanguage.create(user_id: c.id, language_id: 2)
    UserLanguage.create(user_id: c.id, language_id: 3)
    UserLanguage.create(user_id: c.id, language_id: 4)
  end
end

Seeds.create
