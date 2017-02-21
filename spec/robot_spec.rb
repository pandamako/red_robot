require_relative '../lib/robot'

describe Robot do
  let(:robot) { Robot.new }

  describe '#place' do
    context 'valid' do
      before { robot.place 0, 0, :west }

      it { expect(robot.placed?).to eq true }
    end

    context 'not valid' do
      context 'more then max X' do
        before { robot.place 5, 0, :west }

        it { expect(robot.placed?).to eq false }
      end

      context 'more then max Y' do
        before { robot.place 0, 5, :west }

        it { expect(robot.placed?).to eq false }
      end

      context 'less then min X' do
        before { robot.place -1, 0, :west }

        it { expect(robot.placed?).to eq false }
      end

      context 'less then min Y' do
        before { robot.place 0, -1, :west }

        it { expect(robot.placed?).to eq false }
      end
    end
  end
  describe '#left' do
    subject { robot.left }

    context 'not placed' do
      it do
        is_expected.to be_nil
        expect(robot.direction).to eq :north
      end
    end

    context 'placed' do
      before { robot.place 0, 0, initial_directions }

      context 'north' do
        let(:initial_directions) { :north }

        it do
          is_expected.to eq true
          expect(robot.direction).to eq :west
        end
      end

      context 'south' do
        let(:initial_directions) { :south }

        it do
          is_expected.to eq true
          expect(robot.direction).to eq :east
        end
      end
    end
  end

  describe '#right' do
    subject { robot.right }

    context 'not placed' do
      it do
        is_expected.to be_nil
        expect(robot.direction).to eq :north
      end
    end

    context 'placed' do
      before { robot.place 0, 0, initial_directions }

      context 'east' do
        let(:initial_directions) { :east }

        it do
          is_expected.to eq true
          expect(robot.direction).to eq :south
        end
      end

      context 'west' do
        let(:initial_directions) { :west }

        it do
          is_expected.to eq true
          expect(robot.direction).to eq :north
        end
      end
    end
  end

  describe '#move' do
    subject { robot.move }

    context 'not placed' do
      it { is_expected.to be_nil }
    end

    context 'placed' do
      context 'valid move' do
        before { robot.place 2, 2, initial_directions }

        context 'move north' do
          let(:initial_directions) { :north }

          it do
            is_expected.to eq true
            expect(robot.x).to eq 2
            expect(robot.y).to eq 3
          end
        end
        context 'move south' do
          let(:initial_directions) { :south }

          it do
            is_expected.to eq true
            expect(robot.x).to eq 2
            expect(robot.y).to eq 1
          end
        end
        context 'move east' do
          let(:initial_directions) { :east }

          it do
            is_expected.to eq true
            expect(robot.x).to eq 3
            expect(robot.y).to eq 2
          end
        end
        context 'move west' do
          let(:initial_directions) { :west }

          it do
            is_expected.to eq true
            expect(robot.x).to eq 1
            expect(robot.y).to eq 2
          end
        end
      end

      context 'invalid move' do
        context 'move north' do
          before { robot.place 2, 4, :north }

          it do
            is_expected.to be_nil
            expect(robot.x).to eq 2
            expect(robot.y).to eq 4
          end
        end
        context 'move south' do
          before { robot.place 2, 0, :south }

          it do
            is_expected.to be_nil
            expect(robot.x).to eq 2
            expect(robot.y).to eq 0
          end
        end
        context 'move east' do
          before { robot.place 4, 0, :east }

          it do
            is_expected.to be_nil
            expect(robot.x).to eq 4
            expect(robot.y).to eq 0
          end
        end
        context 'move west' do
          before { robot.place 0, 0, :west }

          it do
            is_expected.to be_nil
            expect(robot.x).to eq 0
            expect(robot.y).to eq 0
          end
        end
      end
    end
  end
end
