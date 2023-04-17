import matlab.unittest.TestRunner;
runner = TestRunner.withTextOutput;

suite = testsuite('myTest');

import sltest.plugins.MATLABTestCaseIntegrationPlugin;
runner.addPlugin(MATLABTestCaseIntegrationPlugin);

import sltest.plugins.ToTestManagerLog;
import matlab.unittest.plugins.DiagnosticsOutputPlugin;
streamOutput = ToTestManagerLog();
diagnosticsOutputPlugin = DiagnosticsOutputPlugin...
    (streamOutput,'IncludingPassingDiagnostics',true);
runner.addPlugin(diagnosticsOutputPlugin);

import sltest.plugins.coverage.CoverageMetrics;
import sltest.plugins.ModelCoveragePlugin;
mcdcMetrics = CoverageMetrics('MCDC',true);
runner.addPlugin(ModelCoveragePlugin('Collecting',mcdcMetrics));

run(runner,suite);