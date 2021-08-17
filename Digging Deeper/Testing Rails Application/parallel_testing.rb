#Parallel Testing

#to enable parallelization
class ActiveSupport::TestCase
    parallelize(workers: 2)
  end
#no of workers means the no of times process will be forked

#parallelize_setup and parallelize_teardown
class ActiveSupport::TestCase
  parallelize_setup do |worker|
    # setup databases
  end

  parallelize_teardown do |worker|
    # cleanup databases
  end

  parallelize(workers: :number_of_processors)
end
  
#testing parallel transactions
class WorkerTest < ActiveSupport::TestCase
    self.use_transactional_tests = false
  
    test "parallel transactions" do
      # start some threads that create transactions
    end
  end
  