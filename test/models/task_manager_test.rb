require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    attributes = {id: 1, title: 'New Task', description: 'First Task'}
    TaskManager.create(attributes)
    task = TaskManager.find(1)
    assert_equal 'New Task', task.title
    assert_equal 'First Task', task.description
  end

  def test_it_edits_a_task
    attributes = {id: 1, title: 'New Task', description: 'First Task'}
    TaskManager.create(attributes)
    attributes = {id: 1, title: 'Get Runch', description: 'Edited Task'}
    TaskManager.update(1, attributes)
    task = TaskManager.find(1)
    assert_equal 'Get Runch', task.title
    assert_equal 'Edited Task', task.description
  end
end