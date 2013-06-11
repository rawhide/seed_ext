require 'spec_helper'

describe Railstar::SeedExt do

  describe ".truncation!" do
    before { User.create }
    subject { User.truncation! }
    it { expect{ subject }.to change(User, :count).from(1).to(0) }
  end

  describe ".truncation" do
    context "when load from csv" do
      describe ' check User.count ' do
        before { User.truncation! }
        subject { User.truncation(:csv, "spec/db/seeds") }
        it { expect{ subject }.to change(User, :count).from(0).to(2) }
      end

      describe ' check loaded data ' do
        before { User.truncation!
                 User.truncation(:csv, "spec/db/seeds") 
               }
        subject(:users) { 
          { first: User.first, last: User.last }
        }

        context ' of first user' do
          it { expect(users[:first].name).to eq 'admin_from_csv1' }
          it { expect(users[:first].sex).to eq 1 }
        end

        context ' of last user' do
          it { expect(users[:last].name).to eq 'admin_from_csv2' }
          it { expect(users[:last].sex).to eq 0 }
        end
      end
    end

    context "when load from yml" do
      describe ' check User.count ' do
        before { User.truncation! }
        subject { User.truncation(:yml, "spec/db/seeds") }
        it { expect{ subject }.to change(User, :count).by(2).to(2) }
      end

      describe 'check loaded data' do
        subject(:users) { 
          { first: User.first, last: User.last }
        }
        context ' of first user' do
          it { expect(users[:first].name).to eq 'admin_from_yml1' }
          it { expect(users[:first].sex).to eq 0 }
        end

        context ' of last user' do
          it { expect(users[:last].name).to eq 'admin_from_yml2' }
          it { expect(users[:last].sex).to eq 1 }
        end
      end
    end
  end

end
