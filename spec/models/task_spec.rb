require 'spec_helper'

describe Task do
  it { should belong_to :project }
  it { should belong_to :milestone }
  it { should belong_to :assigned_user }
end
