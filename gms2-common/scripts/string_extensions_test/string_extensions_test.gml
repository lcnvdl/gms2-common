function StringExtensionsTest() : GMLTest_Harness() constructor {
	function setup() {
	}
	
	function tearDown() {
	}
}

test_f(StringExtensionsTest, "string_split should work fine", function() {
	var result = string_split(" ", "hi, beautiful world");
	gmltest_expect_eq(3, array_length(result));
	gmltest_expect_eq("hi,", result[0]);
	gmltest_expect_eq("beautiful", result[1]);
	gmltest_expect_eq("world", result[2]);
});

test_f(StringExtensionsTest, "string_join_args should work fine", function() {
	var result = string_join_args(" ", "hello", "world", 13);
	gmltest_expect_eq("hello world 13", result);
});

test_f(StringExtensionsTest, "string_join should work fine", function() {
	var result = string_join(" ", ["hello", "world"]);
	gmltest_expect_eq("hello world", result);
});

test_f(StringExtensionsTest, "string_trim should remove lateral spaces", function() {
	var result = string_trim(" hi world ");
	gmltest_expect_eq("hi world", result);
});

test_f(StringExtensionsTest, "string_trim left should remove the spaces from left", function() {
	var result = string_trim(" hi world ", "left");
	gmltest_expect_eq("hi world ", result);
});