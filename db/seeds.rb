class Seeds
  def self.create
    add_languages
  end

  def self.add_languages
    languages = %w[JavaScript Java Ruby C CSS PHP Python C++
      Objective-C C# Shell R CoffeeScript Go Perl Scala VimL
      Clojure Haskell Erlang Rust Swift]

    languages.each do |l|
      Language.create(name: l)
    end
  end
end

Seeds.create
