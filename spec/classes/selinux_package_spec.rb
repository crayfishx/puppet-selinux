require 'spec_helper'

describe 'selinux' do
  context 'package' do
    context 'on RedHat 5 based OSes' do
      let(:facts) do
        {
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '5',
          selinux_current_mode: 'enforcing'
        }
      end

      it { should contain_package('policycoreutils').with(ensure: 'installed') }
    end

    context "On RedHat 6 based OSes" do
      let(:facts) do
        {
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '6',
          selinux_current_mode: 'enforcing'
        }
      end

      it { should contain_package('policycoreutils-python').with(ensure: 'installed') }
    end

    context "On RedHat 7 based OSes" do
      let(:facts) do
        {
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '7',
          selinux_current_mode: 'enforcing'
        }
      end

      it { should contain_package('policycoreutils-devel').with(ensure: 'installed') }
    end

    context 'On Fedora 19' do
      let(:facts) do
        {
          osfamily: 'RedHat',
          operatingsystem: 'Fedora',
          operatingsystemmajrelease: '19',
        }
      end
      it { should contain_package('policycoreutils-python').with(ensure: 'installed') }
    end
    context 'On Fedora 20' do
      let(:facts) do
        {
          osfamily: 'RedHat',
          operatingsystem: 'Fedora',
          operatingsystemmajrelease: '20',
        }
      end
    it { should contain_package('policycoreutils-python').with(ensure: 'installed') }
    end
    context 'On Fedora 21' do
      let(:facts) do
        {
          osfamily: 'RedHat',
          operatingsystem: 'Fedora',
          operatingsystemmajrelease: '21',
        }
      end
      it { should contain_package('policycoreutils-devel').with(ensure: 'installed') }
    end
    context 'On Fedora 22' do
      let(:facts) do
        {
          osfamily: 'RedHat',
          operatingsystem: 'Fedora',
          operatingsystemmajrelease: '22',
        }
      end
      it { should contain_package('policycoreutils-devel').with(ensure: 'installed') }
    end
    context 'On Fedora 23' do
      let(:facts) do
        {
          osfamily: 'RedHat',
          operatingsystem: 'Fedora',
          operatingsystemmajrelease: '23',
        }
      end
      it { should contain_package('policycoreutils-devel').with(ensure: 'installed') }
    end
    context 'On Fedora 24' do
      let(:facts) do
        {
          osfamily: 'RedHat',
          operatingsystem: 'Fedora',
          operatingsystemmajrelease: '24',
        }
      end
      it { should contain_package('policycoreutils-devel').with(ensure: 'installed') }
    end

    context 'do not manage package' do
      let(:facts) do
        {
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '5'
        }
      end
      let(:params) do
        {
          manage_package: false
        }
      end

      it { should_not contain_package('policycoreutils').with(ensure: 'installed') }
    end

    context 'install a different package name' do
      let(:facts) do
        {
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '5'
        }
      end
      let(:params) do
        {
          package_name: 'some_package'
        }
      end

      it { should contain_package('some_package').with(ensure: 'installed') }
    end
  end
end
