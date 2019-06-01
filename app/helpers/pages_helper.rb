module PagesHelper
  def tweet_link(label, text)
      link_to(label,
              'twitter.com/share',
              class: 'twitter-share-button',
              'data-url': '',
              'data-text': text,
              'data-lang': 'ja'
              )
  end

  # https://twitter.com/intent/tweet?url=http://wemo.tech&text=あああ
  def tweet_link_simple(label, text)
    link_to(
      label,
      'https://twitter.com/intent/tweet?' + {text: text + ' #civictechjp'}.to_query
    )
  end
end
