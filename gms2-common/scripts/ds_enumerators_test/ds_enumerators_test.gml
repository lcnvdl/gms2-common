function DsEnumeratorsTest() : GMLTest_Harness() constructor {
	function setup() {
		list = ds_list_create();
	}
	
	function tearDown() {
		ds_list_destroy(list);
	}
}

test_f(DsEnumeratorsTest, "ds_list to ArrayList", function() {
	ds_list_add(list, 1);
	ds_list_add(list, 2);
	ds_list_add(list, 3);

	var result = new DsListEnumerator(list);
	var json = result.ToArrayList().ToString();
	gmltest_expect_eq(json, "[ 1.0, 2.0, 3.0 ]");
});

test_f(DsEnumeratorsTest, "ds_list count", function() {
	ds_list_add(list, 1);
	ds_list_add(list, 2);
	ds_list_add(list, 3);

	var enumerator = new DsListEnumerator(list);
	gmltest_expect_eq(enumerator.Count(), 3);
});

test_f(DsEnumeratorsTest, "ds_list any", function() {
	var enumerator = new DsListEnumerator(list);
	gmltest_expect_false(enumerator.Any());
	
	ds_list_add(list, 1);
	ds_list_add(list, 2);
	ds_list_add(list, 3);
	
	gmltest_expect_true(enumerator.Any());
	gmltest_expect_false(enumerator.Any(function(m) { return false }));
});
