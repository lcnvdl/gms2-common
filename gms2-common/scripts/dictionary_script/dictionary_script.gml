function Dictionary(_struct) constructor {
	_data = is_struct(_struct) ? _struct : {};
	
	static Set = function(key, value) {
		_data[$ key] = value;
	};
	
	static Get = function(key) {
		return _data[$ key];
	};
	
	static Remove = function(key) {
		variable_struct_remove(_data, key);
	};
	
	static GetAt = function(idx) {
		var key = variable_struct_get_names(_data)[idx];
		return Get({ key: key, value: Get(key) });
	};
	
	static Clear = function() {
		_data = {};	
	};
	
	static ContainsKey = function(key) {
		return variable_struct_exists(_data, key);	
	};
	
	static GetKeys = function() {
		var keys = variable_struct_get_names(_data);
		array_sort(keys, true);
		return new ArrayEnumerator(keys);
	};
	
	static Count = function() {
		return array_length(variable_struct_get_names(_data));
	};
}