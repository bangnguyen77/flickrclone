require 'rails_helper'

describe Image do
  it { should belong_to :user }
  it { should validate_presence_of :title }
end
