classdef myTest < sltest.TestCase
   methods (Test)
      function testOne(testCase)
         testCase.loadSystem...
           ('sltestThrottlePositionControlCompositionExample.slx');

         simOut = testCase.simulate('sltestThrottlePositionControlCompositionExample',...
             'WithHarness','BasicSchedulerTest');
        
         testCase.verifySignalsMatch(simOut,'baselineOne.mat',...
           'AbsTol',0.015);
      end
   end
end