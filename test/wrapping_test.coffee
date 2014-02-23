require './setup'

describe 'Wrapping', ->
  it 'bare h2', ->
    @load "## hello", bare: true

    expect(@$).have.selectors [
      ".sg-section > h2#hello"
      ".sg-section > h2#hello.sg"
      ".sg-section.sg-section-hello"
      ".sg-section:root"
    ]

  it 'bare h3', ->
    @load "### hello", bare: true

    expect(@$).have.selectors [
      ".sg-block > h3#hello"
      ".sg-block > h3#hello.sg"
      ".sg-block.sg-section-hello"
      ".sg-block:root"
    ]

  it 'mixed case wrapping', ->
    @load '''
      ### button

          button

      ## Forms
      ### input

          input
    ''', bare: true

    expect(@$).have.selectors [
      ".sg-block.sg-section-button > h3#button"
      ".sg-block.sg-section-button > .sg-code-block"
      ".sg-section.sg-section-forms"
      ".sg-section.sg-section-forms > h2#forms"
      ".sg-section.sg-section-forms > .sg-block.sg-section-input"
      ".sg-section.sg-section-forms > .sg-block.sg-section-input > h3#input"
    ]
