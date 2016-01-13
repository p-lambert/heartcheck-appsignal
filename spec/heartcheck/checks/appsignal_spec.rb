RSpec.describe Heartcheck::Checks::Appsignal do
  subject(:appsignal_check) { described_class.new }

  describe '#validate' do
    subject(:validate) { -> { appsignal_check.validate } }

    let(:transmitter) do
      instance_double(Appsignal::Transmitter, transmit: response)
    end

    let(:response) { '200' }

    let(:errors) { -> { appsignal_check.instance_variable_get(:@errors) } }

    before do
      allow(Appsignal::Transmitter).to receive(:new).and_return(transmitter)
    end

    it { is_expected.not_to change(&errors).from([]) }

    it 'instantiates a transmitter with the proper arguments' do
      expect(Appsignal::Transmitter).to receive(:new)
        .with('auth')
        .and_return(transmitter)

      validate.call
    end

    context 'when response code is different from 200' do
      let(:response) { '401' }

      it do
        is_expected.to change(&errors).from([]).to(
          [
            'could not authenticate with appsignal server.',
            'response from server: 401'
          ]
        )
      end
    end

    context 'when transmitter raises an error' do
      before do
        allow(transmitter).to receive(:transmit).and_raise('error message')
      end

      it do
        is_expected.to change(&errors).from([]).to(
          [
            'could not authenticate with appsignal server.',
            'error message'
          ]
        )
      end
    end
  end
end
