require_relative '../test_helper'

class TaskTest < Minitest::Test
  def test_it_assigns_proper_attributes
    attributes = {:id          => 1,
                  :title       => 'New Task',
                  :description => 'First Task'}
    task = Task.new(attributes)
    assert_equal 1, task.id
    assert_equal 'New Task', task.title
    assert_equal 'First Task', task.description
  end
end