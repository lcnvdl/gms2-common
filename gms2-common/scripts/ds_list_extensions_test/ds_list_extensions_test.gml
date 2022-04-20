function DsListExtensionsTest() : GMLTest_Harness() constructor {
	list = -1;
	
	function setup() {
		list = ds_list_create();
	}
	
	function tearDown() {
		ds_list_destroy(list);
	}
}

test_f(DsListExtensionsTest, "ds_list_findIndexOf should work fine", function() {
	ds_list_add(list, { name: "a" });  
	ds_list_add(list, { name: "b" });
	ds_list_add(list, { name: "c" });
	
	var expectedIdx = 1;
	var idx = ds_list_findIndexOf(list, function(val) {
		return val.name == "b";
	});
	
	gmltest_expect_eq(idx, expectedIdx);
});

test_f(DsListExtensionsTest, "ds_list_findIndexOfValue should work fine", function() {
	ds_list_add(list, { name: "a" });  
	ds_list_add(list, { name: "b" });
	ds_list_add(list, { name: "c" });
	
	var expectedIdx = 1;
	var idx = ds_list_findIndexOf(list, function(val) {
		return (val.name == "b") ? val : pointer_null;
	});
	
	gmltest_expect_eq(idx, expectedIdx);
});
