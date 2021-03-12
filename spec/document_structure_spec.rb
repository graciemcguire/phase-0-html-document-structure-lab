RSpec.describe "Has a Valid Document Structure" do

  it 'Begins with a DOCTYPE html tag' do
    expect(html_file_contents).to include('<!DOCTYPE html>'), "Missing DOCTYPE html tag"
  end

  it 'Includes HTML tags' do
    expect(html_file_contents).to include('<html')
    expect(html_file_contents).to include('</html>')
  end

  it 'Has a language attribute in the <html> tag' do
    expect(html_file_contents).to include('<html lang="en">'), 'Include a lang attribute assigned to "en" for English'
  end

  it 'Properly structures both head and body tags' do
    # how to check order?
    # byebug
    head = parsed_html.search("html > head").first
    expect(head.name).to eq('head')

    expect(html_file_contents).to include('</head>')

    body = parsed_html.search('html > body').first
    expect(body.name).to eq('body')

    expect(html_file_contents).to include('</body>')
  end

  context 'within <head>' do
    it 'contains a <link> tag to an external stylesheet' do
      link = parsed_html.search('html > head > link').first
      expect(link).to_not be_nil, "No <link> tag found in the <head>"
      expect(link.attributes["href"]).to_not be_nil, "The 'href' attribute is missing in the link tag"
    end


    it 'contains a <title> tag to enclose the site title' do
      title = parsed_html.search('html > head > title').first

      expect(title.name).to eq('title')

      expect(html_file_contents).to include('</title>')

      # html_validator
    end

  end

end
  
