function PathScriptsTest() : GMLTest_Harness() constructor {
	function setup() {
	}
	
	function tearDown() {
		global.__path_separator = "\\";
	}
}

test_f(PathScriptsTest, "path_get_separator should work fine if __path_separator doesn't exists", function() {
	var result = path_get_separator();
	gmltest_expect_eq("\\", result);
});

test_f(PathScriptsTest, "path_set_separator should work fine", function() {
	path_set_separator("/");
	var result = path_join("hi", "world");
	gmltest_expect_eq("hi/world", result);
});

test_f(PathScriptsTest, "path_join should work fine", function() {
	path_set_separator("/");
	var result = path_join("hi", "awesome", "world");
	gmltest_expect_eq("hi/awesome/world", result);
});

