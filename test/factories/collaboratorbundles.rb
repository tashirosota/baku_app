FactoryBot.define do
  factory :collaboratorbundle do
    exec { 'MyString' }
    rails { 'MyString' }
    g { 'MyString' }
    controller { 'MyString' }
    client { '' }
  end
end
