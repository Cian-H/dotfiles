# Show help
extern "jest" [
	--help(-h)					# Show help
	--automock					# Automock all files by default
	--bail(-b)					# Exit the test suite immediately upon the first failing test
	--browser					# Respect the "browser" field in package.json when resolving modules
	--cache					# Whether to use the transform cache
	--no-cache					# Disable the cache
	--cacheDirectory					# The directory where Jest should store its  dependency information
	--ci					# Whether to run Jest in continuous integration (CI) mode
	--clearMocks					# Automatically clear mock calls and instances every test
	--collectCoverage					# Alias for --coverage
	--collectCoverageFrom					# glob pattern matching files that coverage info needs to be collected from
	--collectCoverageOnlyFrom					# Explicit list of paths coverage will be restricted to
	--color					# Forces test results output color highlighting
	--colors					# Alias for --color
	--config(-c)					# The path to a jest config file
	--coverage					# Indicates that test coverage info be collected and reported in the output
	--coverageDirectory					# The directory where Jest should output its coverage files
	--coveragePathIgnorePatterns					# Pattern of files to ignore
	--coverageReporters					# A list of reporter names that Jest uses when writing coverage reports
	--coverageThreshold					# A JSON used to configure minimum threshold enforcement for coverage results
	--debug					# Print debugging info about your jest config
	--env					# The test environment used for all tests
	--expand(-e)					# Use this flag to show full diffs instead of a patch
	--findRelatedTests					# Find related tests for a list of source files
	--forceExit					# Force Jest to exit after all tests have completed running
	--globals					# A JSON string with map of global variables
	--haste					# A JSON string with map of variables for the haste module system
	--json					# Prints the test results in JSON
	--lastCommit					# Will run all tests affected by file changes in the last commit made
	--listTests					# Lists all tests Jest will run given the arguments and exits
	--logHeapUsage					# Logs the heap usage after every test
	--mapCoverage					# Maps code coverage reports against original source code
	--maxWorkers(-w)					# Specifies the maximum number of workers
	--moduleDirectories					# Dir names to be searched recursively up from the requiring module''s location
	--moduleFileExtensions					# An array of file extensions your modules use
	---moduleNameMapper					# A JSON with map from regexps to module names that allow to stub out resources
	--modulePathIgnorePatterns					# Modules to ignore
	--modulePaths					# An alternative API to setting the NODE_PATH env variable
	--noStackTrace					# Disables stack trace in test results output
	--notify					# Activates notifications for test results
	--onlyChanged(-o)					# Run tests based on the changed files
	--outputFile					# A file where to write test results
	--preset					# A preset that is used as a base for Jest''s configuration
	--projects					# A list of projects that use Jest to run all tests
	--reporters					# A list of custom reporters for the test suite
	--resetMocks					# Automatically reset mock state between every test
	--resetModules					# Whatever to reset the module registry for every test
	--resolver					# A JSON string which allows the use of a custom resolver
	--rootDir					# The root directory that Jest should scan for tests and modules within
	--roots					# Paths to directories that Jest should use to search for files in
	--runInBand(-i)					# Run all tests serially in the current process
	--setupFiles					# The paths to modules to configure the testing environment
	--setupTestFrameworkScriptFile					# The path to a module to configure the testing framework
	--showConfig					# Print your jest config and then exits
	--silent					# Prevent tests from printing messages through the console
	--snapshotSerializers					# Snapshot serializer modules Jest should use for snapshot testing
	--testEnvironment					# Alias for --env
	--testMatch					# The glob patterns Jest uses to detect test files
	--testNamePattern(-t)					# Run only tests with a name that matches the regex pattern
	--testPathIgnorePatterns					# Paths to skip
	--testPathPattern					# Regex for test paths
	--testRegex					# The regexp pattern Jest uses to detect test files
	--testResultsProcessor					# Allows the use of a custom results processor
	--testRunner					# Allows to specify a custom test runner
	--testURL					# This option sets the URL for the jsdom environment
	--timers					# Setting this value to fake value of timers
	--transform					# A JSON string which maps from regular expressions to paths to transformers
	--transformIgnorePatterns					# Regexp patterns matched against all source file paths before transformation
	--unmockedModulePathPatterns					# a regex pattern of module to unmock
	--updateSnapshot(-u)					# Use this flag to re-record snapshots
	--useStderr					# Divert all output to stderr
	--verbose					# Display individual test results with the test suite hierarchy
	--version(-v)					# Print the version and exit
	--watch					# Watch files for changes and rerun tests related to changed files
	--watchAll					# Watch files for changes and rerun all tests
	--watchman					# Whether to use watchman for file crawling
	--no-watchman					# Disable using watchman for file crawling
	--detectOpenHandles					# Print out open handles preventing Jest from exiting at the end of a test run
	...args
]