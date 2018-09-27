require 'spec_helper'
require_relative '../lib/table'
require_relative '../lib/position'

describe 'Table' do
  let(:table) { Table.new(5, 5) }

  describe '#new' do
    it 'create an instance of Table' do
      expect(table).to be_a Table
    end
  end

  describe '#rows' do
    it { expect(table.rows).to eq 5 }
  end

  describe '#columns' do
    it { expect(table.columns).to eq 5 }
  end
end