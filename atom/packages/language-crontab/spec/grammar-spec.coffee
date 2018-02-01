describe "crontab grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage "language-crontab"

    runs ->
      grammar = atom.grammars.grammarForScopeName "source.crontab"

  it "parses the grammar", ->
    expect(grammar).toBeDefined()
    expect(grammar.scopeName).toBe "source.crontab"

  it "parses comment.crontab", ->
    {tokens} = grammar.tokenizeLine "# I am a comment "
    expect(tokens).toHaveLength 1
    expect(tokens[0]).toEqual
      value: "# I am a comment "
      scopes: [
        "source.crontab"
        "comment.crontab"
      ]

  it "parses environment.crontab", ->
    {tokens} = grammar.tokenizeLine " MAILTO = email@example.com"
    expect(tokens).toHaveLength 6
    expect(tokens[1]).toEqual
      value: "MAILTO",
      scopes: [
        "source.crontab"
        "environment.crontab"
        "entity.key.crontab"
      ]
    expect(tokens[3]).toEqual
      value: "=",
      scopes: [
        "source.crontab"
        "environment.crontab"
        "keyword.operator.crontab"
      ]
    expect(tokens[5]).toEqual
      value: "email@example.com",
      scopes: [
        "source.crontab"
        "environment.crontab"
        "entity.variable.crontab"
      ]

  describe "Statement parser", ->

    it "parses simple statement.crontab", ->
      {tokens} = grammar.tokenizeLine "30 3 * * *  echo Simple statement"
      expect(tokens).toHaveLength 11
      expect(tokens[0]).toEqual
        value: "30",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.minute.crontab"
        ]
      expect(tokens[2]).toEqual
        value: "3",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.hour.crontab"
        ]
      expect(tokens[4]).toEqual
        value: "*",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.dayofmonth.crontab"
        ]
      expect(tokens[6]).toEqual
        value: "*",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.month.crontab"
        ]
      expect(tokens[8]).toEqual
        value: "*",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.dayofweek.crontab"
        ]
      expect(tokens[10]).toEqual
        value: "echo Simple statement",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "string.command.crontab"
        ]

    it "parse ranged based statement.crontab", ->
      {tokens} = grammar.tokenizeLine "* * * * 1-5  echo Ranged based statement"
      expect(tokens).toHaveLength 11
      expect(tokens[0]).toEqual
        value: "*",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.minute.crontab"
        ]
      expect(tokens[2]).toEqual
        value: "*",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.hour.crontab"
        ]
      expect(tokens[4]).toEqual
        value: "*",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.dayofmonth.crontab"
        ]
      expect(tokens[6]).toEqual
        value: "*",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.month.crontab"
        ]
      expect(tokens[8]).toEqual
        value: "1-5",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.dayofweek.crontab"
        ]
      expect(tokens[10]).toEqual
        value: "echo Ranged based statement",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "string.command.crontab"
        ]

    it "parse portion based statement.crontab", ->
      {tokens} = grammar.tokenizeLine "*/5 * * * *  echo Portion based statement"
      expect(tokens).toHaveLength 11
      expect(tokens[0]).toEqual
        value: "*/5",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.minute.crontab"
        ]
      expect(tokens[2]).toEqual
        value: "*",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.hour.crontab"
        ]
      expect(tokens[4]).toEqual
        value: "*",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.dayofmonth.crontab"
        ]
      expect(tokens[6]).toEqual
        value: "*",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.month.crontab"
        ]
      expect(tokens[8]).toEqual
        value: "*",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.dayofweek.crontab"
        ]
      expect(tokens[10]).toEqual
        value: "echo Portion based statement",
        scopes: [
          "source.crontab"
          "statement.crontab"
          "string.command.crontab"
        ]

    it "parse portion based statement.crontab", ->
      {tokens} = grammar.tokenizeLine "@yearly echo Happy New Year !"
      expect(tokens).toHaveLength 3
      expect(tokens[0]).toEqual
        value: "@yearly"
        scopes: [
          "source.crontab"
          "statement.crontab"
          "meta.constant.crontab"
        ]
      expect(tokens[2]).toEqual
        value: "echo Happy New Year !"
        scopes: [
          "source.crontab"
          "statement.crontab"
          "string.command.crontab"
        ]
