require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    attributes = {id: 1, title: 'New Task', description: 'First Task'}
    task = TaskManager.create(attributes)
    task = TaskManager.find(task.id)
    assert_equal 'New Task', task.title
    assert_equal 'First Task', task.description
  end

  def test_it_edits_a_task
    attributes = {id: 1, title: 'New Task', description: 'First Task'}
    task = TaskManager.create(attributes)
    assert_equal 'New Task', task.title
    task.title = 'Get Runch'
    TaskManager.update(task.id, task)
    assert_equal 'Get Runch', task.title
    assert_equal 'First Task', task.description
  end

  def test_it_deletes_a_task
    attributes = {id: 1, title: 'New Task', description: 'First Task'}
    task = TaskManager.create(attributes)
    total = TaskManager.all.count
    TaskManager.delete(task.id)
    assert_equal (total-1), TaskManager.all.count
  end
end